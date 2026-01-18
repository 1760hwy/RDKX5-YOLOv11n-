#!/usr/bin/env python3
"""
导出YOLOv11n ONNX模型（6输出版本）

作者: RDKX5-YOLOv11n-项目
许可证: MIT
"""

import sys
from pathlib import Path

def export_onnx(model_path='yolo11n.pt', output_name='yolo11n.onnx', imgsz=640):
    """
    导出ONNX模型
    
    Args:
        model_path: 预训练模型路径
        output_name: 输出ONNX文件名
        imgsz: 输入图像尺寸
    """
    
    try:
        from ultralytics import YOLO
        import onnx
    except ImportError as e:
        print(f"❌ 导入错误: {e}")
        print("   请先安装: pip install ultralytics onnx")
        return False
    
    print("=" * 60)
    print("导出YOLOv11n ONNX模型")
    print("=" * 60)
    print()
    
    # 检查模型文件
    if not Path(model_path).exists():
        print(f"❌ 模型文件不存在: {model_path}")
        print("   正在下载...")
        try:
            model = YOLO(model_path)
        except Exception as e:
            print(f"❌ 下载失败: {e}")
            return False
    else:
        print(f"✅ 找到模型文件: {model_path}")
        model = YOLO(model_path)
    
    print()
    print("📝 导出配置:")
    print(f"  模型: {model_path}")
    print(f"  输出: {output_name}")
    print(f"  输入尺寸: {imgsz}x{imgsz}")
    print(f"  ONNX Opset: 11")
    print()
    
    # 导出ONNX
    print("🚀 开始导出...")
    try:
        success = model.export(
            format='onnx',
            imgsz=imgsz,
            opset=11,           # RDK X5支持opset 10/11
            simplify=False,     # 不简化，避免ir version问题
            dynamic=False,      # 静态shape（BPU不支持动态shape）
            half=False          # 使用float32
        )
        
        print()
        print(f"✅ ONNX导出成功: {success}")
        
    except Exception as e:
        print(f"❌ 导出失败: {e}")
        import traceback
        traceback.print_exc()
        return False
    
    # 验证ONNX模型
    print()
    print("🔍 验证ONNX模型...")
    try:
        onnx_model = onnx.load(output_name)
        
        print(f"  IR Version: {onnx_model.ir_version}")
        print(f"  Opset Version: {onnx_model.opset_import[0].version}")
        print(f"  Producer: {onnx_model.producer_name} {onnx_model.producer_version}")
        print()
        print(f"  输入数量: {len(onnx_model.graph.input)}")
        for i, inp in enumerate(onnx_model.graph.input):
            print(f"    Input {i}: {inp.name}")
        
        print()
        print(f"  输出数量: {len(onnx_model.graph.output)}")
        for i, out in enumerate(onnx_model.graph.output):
            print(f"    Output {i}: {out.name}")
        
        print()
        if len(onnx_model.graph.output) == 6:
            print("✅ 输出数量正确（6个）")
            print("   - Output 0-2: BBox特征 (stride=8/16/32)")
            print("   - Output 3-5: Class分数 (stride=8/16/32)")
        else:
            print(f"⚠️  警告：输出数量为 {len(onnx_model.graph.output)}")
            print("   预期6个输出，请检查ultralytics是否正确修改")
            print("   提示：运行 python scripts/modify_ultralytics.py")
            return False
        
    except Exception as e:
        print(f"⚠️  验证过程出错: {e}")
    
    print()
    print("=" * 60)
    print("✅ ONNX导出完成！")
    print("=" * 60)
    print()
    print("下一步：")
    print("  1. 准备校准数据:")
    print("     python scripts/prepare_calibration.py --coco-path /path/to/coco")
    print()
    print("  2. PTQ量化:")
    print("     ./scripts/quantize.sh")
    print()
    
    return True


def main():
    """主函数"""
    
    import argparse
    
    parser = argparse.ArgumentParser(description='导出YOLOv11n ONNX模型')
    parser.add_argument('--model', type=str, default='yolo11n.pt',
                       help='预训练模型路径 (default: yolo11n.pt)')
    parser.add_argument('--output', type=str, default='yolo11n.onnx',
                       help='输出ONNX文件名 (default: yolo11n.onnx)')
    parser.add_argument('--imgsz', type=int, default=640,
                       help='输入图像尺寸 (default: 640)')
    
    args = parser.parse_args()
    
    success = export_onnx(
        model_path=args.model,
        output_name=args.output,
        imgsz=args.imgsz
    )
    
    sys.exit(0 if success else 1)


if __name__ == '__main__':
    main()

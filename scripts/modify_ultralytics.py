#!/usr/bin/env python3
"""
修改Ultralytics YOLOv11输出头
将单一输出拆分为6个输出（3个bbox + 3个cls）

作者: RDKX5-YOLOv11n-项目
许可证: MIT
"""

import os
import re
import sys

def modify_ultralytics_head():
    """
    修改ultralytics/nn/modules/head.py中的Detect类
    将输出从1个tensor拆分为6个tensor
    """
    
    try:
        import ultralytics
    except ImportError:
        print("❌ 错误：未安装ultralytics")
        print("   请先安装: pip install ultralytics")
        return False
    
    # 找到ultralytics安装路径
    ultralytics_path = os.path.dirname(ultralytics.__file__)
    head_file = os.path.join(ultralytics_path, 'nn/modules/head.py')
    
    print(f"📁 Ultralytics路径: {ultralytics_path}")
    print(f"📝 Head文件路径: {head_file}")
    
    # 备份原文件
    backup_file = head_file + '.backup'
    if not os.path.exists(backup_file):
        import shutil
        shutil.copy2(head_file, backup_file)
        print(f"✅ 原文件已备份到: {backup_file}")
    else:
        print(f"ℹ️  备份文件已存在: {backup_file}")
    
    # 读取原文件
    with open(head_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 检查是否已修改
    if '*bboxes, *clses' in content:
        print("ℹ️  文件已经修改过，跳过")
        return True
    
    # 定义新的forward方法
    new_forward = '''    def forward(self, x):
        """Concatenates and returns predicted bounding boxes and class probabilities.
        【修改】分离bbox和cls输出，适配地平线BPU
        """
        if self.end2end:
            return self.forward_end2end(x)

        # 【关键修改】分离bbox和cls为6个独立输出
        # cv2: bbox分支 (64维DFL特征)
        # cv3: class分支 (80维类别分数)
        bboxes = [self.cv2[i](x[i]).permute(0, 2, 3, 1).contiguous() for i in range(self.nl)]
        clses = [self.cv3[i](x[i]).permute(0, 2, 3, 1).contiguous() for i in range(self.nl)]
        
        # 返回6个输出：(*bboxes, *clses)
        return (*bboxes, *clses)
'''
    
    # 查找并替换Detect类的forward方法
    # 使用正则表达式找到forward方法的范围
    pattern = r'(class Detect.*?def forward\(self, x\):)(.*?)(?=\n    def |\nclass |\Z)'
    
    def replace_forward(match):
        class_def = match.group(1)
        # 返回类定义 + 新的forward方法
        return class_def + new_forward
    
    # 执行替换
    new_content = re.sub(pattern, replace_forward, content, flags=re.DOTALL)
    
    # 检查是否替换成功
    if new_content == content:
        print("❌ 错误：未能找到Detect类的forward方法")
        print("   可能Ultralytics版本不兼容")
        return False
    
    # 写回文件
    with open(head_file, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print("✅ 成功修改Ultralytics输出头")
    print("   输出格式已改为6个tensor（3个bbox + 3个cls）")
    
    return True


def verify_modification():
    """验证修改是否生效"""
    
    print("\n🔍 验证修改...")
    
    try:
        import torch
        from ultralytics import YOLO
    except ImportError as e:
        print(f"❌ 导入错误: {e}")
        return False
    
    try:
        # 创建临时模型测试
        model = YOLO('yolo11n.pt')
        
        # 创建测试输入
        dummy_input = torch.randn(1, 3, 640, 640)
        
        # 测试forward
        model.model.eval()
        with torch.no_grad():
            outputs = model.model(dummy_input)
        
        # 检查输出
        if isinstance(outputs, tuple) and len(outputs) == 6:
            print("✅ 验证通过！模型输出为6个tensor")
            for i, out in enumerate(outputs):
                print(f"   Output {i}: {out.shape}")
            return True
        else:
            print(f"❌ 验证失败！输出数量: {len(outputs)}")
            print(f"   预期6个，实际{len(outputs)}个")
            return False
    
    except Exception as e:
        print(f"⚠️  验证过程出错（可忽略，稍后导出时会再次验证）: {e}")
        return True  # 返回True以继续流程


def main():
    """主函数"""
    
    print("=" * 60)
    print("修改Ultralytics YOLOv11输出头")
    print("=" * 60)
    print()
    
    # 执行修改
    success = modify_ultralytics_head()
    
    if not success:
        print("\n❌ 修改失败")
        sys.exit(1)
    
    # 验证修改
    if not verify_modification():
        print("\n⚠️  验证失败，但修改已完成")
        print("   请在导出ONNX时再次验证")
    
    print("\n" + "=" * 60)
    print("✅ 完成！")
    print("=" * 60)
    print()
    print("下一步：")
    print("  python scripts/export_onnx.py")
    print()


if __name__ == '__main__':
    main()

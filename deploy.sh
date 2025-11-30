#!/bin/bash
##############################################################################
# YOLOv11n-RDK-X5 一键部署脚本
# 
# 功能：
# 1. 环境检查和准备
# 2. 修改Ultralytics输出头
# 3. 导出ONNX模型
# 4. 准备校准数据
# 5. PTQ量化
# 6. 传输到RDK X5
#
# 使用方法：
#   export RDK_IP=192.168.43.7    # 设置RDK X5的IP
#   export COCO_PATH=/path/to/coco/val2017  # 设置COCO数据集路径
#   ./deploy.sh
##############################################################################

set -e  # 遇到错误立即退出

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 输出函数
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 检查命令是否存在
check_command() {
    if ! command -v $1 &> /dev/null; then
        log_error "$1 未安装，请先安装"
        exit 1
    fi
}

# 打印欢迎信息
echo "============================================================"
echo "  YOLOv11n-RDK-X5 一键部署脚本"
echo "============================================================"
echo ""

# 环境变量检查
if [ -z "$RDK_IP" ]; then
    log_warn "未设置RDK_IP环境变量，使用默认值: 192.168.43.7"
    export RDK_IP=192.168.43.7
fi

if [ -z "$COCO_PATH" ]; then
    log_warn "未设置COCO_PATH，将跳过校准数据准备"
    log_warn "如需量化，请设置: export COCO_PATH=/path/to/coco/val2017"
fi

RDK_USER=${RDK_USER:-sunrise}
RDK_PASS=${RDK_PASS:-sunrise}

log_info "配置信息："
echo "  RDK IP: $RDK_IP"
echo "  RDK用户: $RDK_USER"
echo "  COCO路径: ${COCO_PATH:-未设置}"
echo ""

# 步骤1：检查环境
log_info "步骤1: 检查环境依赖..."
check_command python3
check_command docker
check_command git

# 检查Python版本
PYTHON_VERSION=$(python3 --version | awk '{print $2}')
log_info "Python版本: $PYTHON_VERSION"

# 步骤2：创建虚拟环境
log_info "步骤2: 准备Python虚拟环境..."
if [ ! -d "yolo_env" ]; then
    python3 -m venv yolo_env
    log_info "虚拟环境已创建"
else
    log_info "虚拟环境已存在，跳过创建"
fi

source yolo_env/bin/activate

# 安装依赖
log_info "安装Python依赖..."
pip install -q --upgrade pip
pip install -q -r requirements.txt

# 步骤3：下载YOLOv11n权重
log_info "步骤3: 下载YOLOv11n预训练权重..."
if [ ! -f "yolo11n.pt" ]; then
    python3 -c "from ultralytics import YOLO; YOLO('yolo11n.pt')"
    log_info "权重下载完成"
else
    log_info "权重文件已存在，跳过下载"
fi

# 步骤4：修改Ultralytics
log_info "步骤4: 修改Ultralytics输出头..."
python3 scripts/modify_ultralytics.py

# 步骤5：导出ONNX
log_info "步骤5: 导出ONNX模型..."
if [ ! -f "yolo11n.onnx" ]; then
    python3 scripts/export_onnx.py
    log_info "ONNX导出完成"
else
    log_info "ONNX文件已存在，跳过导出"
fi

# 步骤6：准备校准数据
if [ -n "$COCO_PATH" ]; then
    log_info "步骤6: 准备校准数据..."
    if [ ! -d "calibration_data" ] || [ $(ls calibration_data/*.rgb 2>/dev/null | wc -l) -lt 100 ]; then
        python3 scripts/prepare_calibration.py --coco-path "$COCO_PATH" --output-dir calibration_data --num-images 100
        log_info "校准数据准备完成"
    else
        log_info "校准数据已存在，跳过准备"
    fi
else
    log_warn "步骤6: 跳过校准数据准备（COCO_PATH未设置）"
fi

# 步骤7：复制文件到models目录
log_info "步骤7: 组织文件..."
mkdir -p models
cp yolo11n.onnx models/

# 步骤8：量化提示
echo ""
log_info "步骤8: PTQ量化"
echo "============================================================"
echo "量化需要在Docker环境中执行，请按照以下步骤操作："
echo ""
echo "1. 确保已下载OpenExplorer工具链并加载Docker镜像"
echo ""
echo "2. 启动Docker容器："
echo "   ./scripts/start_docker.sh"
echo ""
echo "3. 在Docker内执行量化："
echo "   hb_mapper makertbin --model-type onnx --config /data/configs/yolo11n_config.yaml"
echo ""
echo "4. 退出Docker："
echo "   exit"
echo ""
echo "或者直接使用量化脚本："
echo "   ./scripts/quantize.sh"
echo ""
echo "============================================================"
echo ""

read -p "是否现在执行量化？(y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    log_info "开始执行量化..."
    ./scripts/quantize.sh
else
    log_warn "跳过量化步骤"
    log_info "你可以稍后手动执行: ./scripts/quantize.sh"
fi

# 步骤9：传输到RDK X5
echo ""
log_info "步骤9: 部署到RDK X5"
echo "============================================================"

BIN_FILE=$(find output* -name "*.bin" 2>/dev/null | head -n 1)

if [ -z "$BIN_FILE" ]; then
    log_warn "未找到量化后的bin文件"
    log_warn "请先完成量化步骤，然后手动传输："
    echo "   scp output/yolo11n_detect_bayese_640x640_nv12.bin $RDK_USER@$RDK_IP:~/models/"
else
    log_info "找到量化模型: $BIN_FILE"
    
    read -p "是否传输到RDK X5 ($RDK_IP)？(y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        log_info "传输模型到RDK X5..."
        
        # 在RDK上创建目录
        ssh $RDK_USER@$RDK_IP "mkdir -p ~/models ~/yolo11_deploy"
        
        # 传输模型
        scp "$BIN_FILE" $RDK_USER@$RDK_IP:~/models/yolo11n_detect_bayese_640x640_nv12.bin
        
        # 传输部署代码
        scp -r rdk_deployment/* $RDK_USER@$RDK_IP:~/yolo11_deploy/
        
        log_info "传输完成！"
        echo ""
        echo "============================================================"
        echo "部署到RDK X5完成！"
        echo ""
        echo "下一步："
        echo "1. SSH登录RDK X5:"
        echo "   ssh $RDK_USER@$RDK_IP"
        echo ""
        echo "2. 启用性能模式:"
        echo "   sudo bash -c \"echo 1 > /sys/devices/system/cpu/cpufreq/boost\""
        echo "   sudo bash -c \"echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor\""
        echo ""
        echo "3. 运行实时检测:"
        echo "   cd ~/yolo11_deploy"
        echo "   python3 camera_detect.py"
        echo ""
        echo "============================================================"
    else
        log_info "跳过传输，你可以稍后手动传输："
        echo "   scp $BIN_FILE $RDK_USER@$RDK_IP:~/models/"
        echo "   scp -r rdk_deployment/* $RDK_USER@$RDK_IP:~/yolo11_deploy/"
    fi
fi

echo ""
log_info "✅ 部署流程完成！"
echo ""

# 显示后续操作建议
echo "📝 后续操作建议："
echo "  1. 查看详细教程: docs/tutorial_zh.md"
echo "  2. 性能测试: ssh $RDK_USER@$RDK_IP 'cd ~/yolo11_deploy && python3 performance_test.py'"
echo "  3. 故障排查: docs/troubleshooting_zh.md"
echo ""

<<<<<<< HEAD
# RDKX5 YOLOv11n Deployment (Horizon RDK X5)

[English](README_EN.md) | [简体中文](README_ZH.md)

This repository documents a complete workflow to deploy **YOLOv11n** on **Horizon RDK X5**, including ONNX export, PTQ quantization, and real-time camera inference.

本仓库提供在**地平线 RDK X5**上部署 **YOLOv11n** 的完整流程（ONNX导出、PTQ量化、实时摄像头推理等）。

---

- English documentation: [README_EN.md](README_EN.md)
- 中文文档： [README_ZH.md](README_ZH.md)
=======
# YOLOv11n-RDK-X5 🚀

<<<<<<< HEAD
English | [简体中文](README_ZH.md)
=======
[English](README_EN.md) | 简体中文
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115

<div align="center">

![YOLOv11](https://img.shields.io/badge/YOLOv11-n-blue)
![RDK X5](https://img.shields.io/badge/RDK-X5-green)
![Performance](https://img.shields.io/badge/FPS-47-red)
![License](https://img.shields.io/badge/license-MIT-yellow)

<<<<<<< HEAD
**Deploy YOLOv11n on Horizon RDK X5 with 47 FPS Real-time Object Detection**

[Features](#-features) • [Quick Start](#-quick-start) • [Performance](#-performance) • [Documentation](#-documentation) • [Contributing](#-contributing)
=======
**在地平线RDK X5上部署YOLOv11n，实现47 FPS实时目标检测**

[特性](#-特性) • [快速开始](#-快速开始) • [性能](#-性能) • [文档](#-文档) • [贡献](#-贡献)
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115

</div>

---

<<<<<<< HEAD
## 📖 Project Overview

This project provides a **complete solution** for deploying YOLOv11n model on Horizon RDK X5 development board, including:
- ✅ Complete pipeline from ONNX export to PTQ quantization
- ✅ Critical optimization for Softmax operator performance bottleneck
- ✅ High-performance real-time detection code (47 FPS)
- ✅ Comprehensive documentation and tutorials

### Why This Project?

When deploying YOLOv11n to RDK X5, we encountered severe performance issues:

- ❌ **Initial Attempt**: 126ms latency, only 7 FPS
- ❌ **Quantization Accuracy Normal**: Cosine similarity > 0.99
- ❌ **Detection Working**: But too slow to be practical

After in-depth research, we discovered that the **Softmax operator** in YOLOv11's new C2PSA module runs on CPU by default, causing frequent CPU-BPU data transfers and a **17x performance drop**!

With our optimization approach:
- ✅ **Optimized**: 10.8ms latency, **92 FPS** (BPU throughput)
- ✅ **End-to-End**: **47 FPS** (including preprocessing, postprocessing, display)
- ✅ **Performance Boost**: **11.6x faster**!

---

## ⭐ Features

### 🔥 Core Advantages

- **High Performance**: 47 FPS end-to-end real-time detection, meeting most application requirements
- **Easy Deployment**: One-click deployment script, complete setup in 10 minutes following documentation
- **High Precision**: PTQ quantization maintains >95% accuracy (cosine similarity)
- **Complete Documentation**: Detailed tutorials from environment setup to performance optimization

### 🎯 Technical Highlights

- **Softmax BPU Optimization**: Configure Softmax to run on BPU (int16 precision) via `node_info`
- **Detection Head Optimization**: Modified Ultralytics output to 6 tensors for efficient postprocessing
- **NV12 Input**: Leverage BPU hardware acceleration for preprocessing, no CPU conversion needed
- **O3 Compilation**: Highest optimization level for maximum BPU performance

---

## 🚀 Quick Start

### Prerequisites

**Hardware**:
- Horizon RDK X5 Development Board
- USB Camera (or MIPI Camera)
- Ubuntu Host Machine (for model conversion)

**Software**:
- Ubuntu 22.04 (VM or physical machine)
- Docker
- Python 3.10+

### Installation Steps

#### Step 1: Clone Repository
=======
## 📖 项目简介

本项目提供了在地平线RDK X5开发板上部署YOLOv11n模型的**完整解决方案**，包括：
- ✅ 从ONNX导出到PTQ量化的完整流程
- ✅ 解决Softmax算子性能瓶颈的关键优化
- ✅ 高性能实时检测代码（47 FPS）
- ✅ 详细的中文文档和教程

### 为什么做这个项目？

在将YOLOv11n部署到RDK X5时，我们遇到了严重的性能问题：

- ❌ **初次尝试**：126ms延迟，仅7 FPS
- ❌ **量化精度正常**：余弦相似度>0.99
- ❌ **检测功能正常**：但就是慢得无法使用

经过深入研究，我们发现YOLOv11新增的C2PSA模块中的**Softmax算子**默认在CPU运行，导致CPU-BPU频繁数据传输，性能暴跌**17倍**！

通过本项目的优化方案：
- ✅ **优化后**：10.8ms延迟，**92 FPS**（BPU吞吐）
- ✅ **端到端**：**47 FPS**（含预处理、后处理、显示）
- ✅ **性能提升**：**11.6倍**！

---

## ⭐ 特性

### 🔥 核心优势

- **高性能**：47 FPS端到端实时检测，满足大多数应用需求
- **易部署**：提供一键部署脚本，跟着文档10分钟完成部署
- **高精度**：PTQ量化后精度保持>95%（余弦相似度）
- **完整文档**：从环境搭建到性能优化的详细中文教程

### 🎯 技术亮点

- **Softmax BPU优化**：通过`node_info`配置将Softmax指定到BPU运行（int16精度）
- **输出头优化**：修改Ultralytics输出为6个tensor，优化后处理效率
- **NV12输入**：利用BPU硬件加速预处理，无需CPU转换
- **O3编译优化**：使用最高优化等级，充分发挥BPU性能

---

## 🚀 快速开始

### 前置要求

**硬件**：
- 地平线RDK X5开发板
- USB摄像头（或MIPI摄像头）
- Ubuntu主机（用于模型转换）

**软件**：
- Ubuntu 22.04（虚拟机或物理机）
- Docker
- Python 3.10+

### 安装步骤

#### 步骤1：克隆项目
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115

```bash
git clone https://github.com/1760hwy/YOLOv11n-RDK-X5.git
cd YOLOv11n-RDK-X5
```

<<<<<<< HEAD
#### Step 2: Environment Setup

```bash
# Create Python virtual environment
python3 -m venv yolo_env
source yolo_env/bin/activate

# Install dependencies
pip install -r requirements.txt
```

#### Step 3: Download Toolchain

Download OpenExplorer toolchain (v1.2.8) from [Horizon Robotics](https://developer.d-robotics.cc/) and extract to project directory.

```bash
# Load Docker image
=======
#### 步骤2：环境准备

```bash
# 创建Python虚拟环境
python3 -m venv yolo_env
source yolo_env/bin/activate

# 安装依赖
pip install -r requirements.txt
```

#### 步骤3：下载工具链

从[地平线官网](https://developer.d-robotics.cc/)下载OpenExplorer工具链（v1.2.8），解压到项目目录。

```bash
# 加载Docker镜像
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115
cd docker_images
docker load < openexplorer_ai_toolchain_ubuntu_20_x5_cpu_v1.2.8-py310.tar.gz
```

<<<<<<< HEAD
#### Step 4: Model Conversion

```bash
# Modify Ultralytics detection head
python scripts/modify_ultralytics.py

# Export ONNX
python scripts/export_onnx.py

# Prepare calibration data (requires COCO dataset)
python scripts/prepare_calibration.py --coco-path /path/to/coco/val2017

# PTQ quantization (execute in Docker)
./scripts/quantize.sh
```

#### Step 5: Board Deployment

```bash
# Transfer model to RDK X5
scp output/yolo11n_detect_bayese_640x640_nv12.bin sunrise@<RDK_IP>:~/models/

# SSH login to RDK X5
ssh sunrise@<RDK_IP>

# Run real-time detection
=======
#### 步骤4：模型转换

```bash
# 修改Ultralytics输出头
python scripts/modify_ultralytics.py

# 导出ONNX
python scripts/export_onnx.py

# 准备校准数据（需要COCO数据集）
python scripts/prepare_calibration.py --coco-path /path/to/coco/val2017

# PTQ量化（在Docker内执行）
./scripts/quantize.sh
```

#### 步骤5：板端部署

```bash
# 传输模型到RDK X5
scp output/yolo11n_detect_bayese_640x640_nv12.bin sunrise@<RDK_IP>:~/models/

# SSH登录RDK X5
ssh sunrise@<RDK_IP>

# 运行实时检测
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115
cd ~/yolo11_deploy
python3 camera_detect.py
```

<<<<<<< HEAD
### 🎬 One-Click Deployment (Recommended)

If you have complete COCO dataset, use the one-click deployment script:

```bash
# Configure RDK X5 IP address
export RDK_IP=192.168.43.7

# Execute one-click deployment
=======
### 🎬 一键部署（推荐）

如果你有完整的COCO数据集，可以使用一键部署脚本：

```bash
# 配置RDK X5的IP地址
export RDK_IP=192.168.43.7

# 执行一键部署
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115
./deploy.sh
```

---

<<<<<<< HEAD
## 📊 Performance

### Performance Comparison

| Metric | Before Optimization | After Optimization | Improvement |
|--------|--------------------|--------------------|-------------|
| **BPU Inference Latency** | 126ms | **10.8ms** | **11.6x** |
| **Theoretical Max FPS** | 7.9 | **92.3** | **11.6x** |
| **End-to-End FPS** | ~7 | **47** | **6.7x** |
| **BPU Subgraphs** | 2 | **1** | ✅ |
| **Cosine Similarity** | 0.996 | **0.958** | -3.8% |

### Comparison with Other Models

| Model | BPU Throughput | End-to-End FPS | Parameters | Notes |
|-------|----------------|----------------|------------|-------|
| **YOLOv11n (This Project)** | **92 FPS** | **47 FPS** | 2.6M | Latest architecture |
| YOLOv8n | 220 FPS | ~80 FPS | 3.2M | Best official optimization |
| YOLOv5s (Official) | 180 FPS | ~90 FPS | 7.2M | Most mature |
| YOLOv10n | ~200 FPS | ~70 FPS | 2.3M | End-to-end NMS-free |

### Performance Breakdown

End-to-end latency breakdown (640x480 input):

```
Total Latency ≈ 21ms (47 FPS)
├── Preprocessing (BGR→NV12): ~3ms (14%)
├── BPU Inference: ~10.8ms (51%)
├── Postprocessing (DFL+NMS): ~5ms (24%)
└── Drawing+Display: ~2ms (9%)
=======
## 📊 性能

### 性能对比

| 指标 | 优化前 | 优化后 | 提升 |
|------|--------|--------|------|
| **BPU推理延迟** | 126ms | **10.8ms** | **11.6x** |
| **理论最大FPS** | 7.9 | **92.3** | **11.6x** |
| **端到端FPS** | ~7 | **47** | **6.7x** |
| **BPU子图数** | 2个 | **1个** | ✅ |
| **余弦相似度** | 0.996 | **0.958** | -3.8% |

### 与其他模型对比

| 模型 | BPU吞吐 | 端到端FPS | 参数量 | 备注 |
|------|---------|-----------|--------|------|
| **YOLOv11n (本项目)** | **92 FPS** | **47 FPS** | 2.6M | 最新架构 |
| YOLOv8n | 220 FPS | ~80 FPS | 3.2M | 官方优化最好 |
| YOLOv5s (官方) | 180 FPS | ~90 FPS | 7.2M | 最成熟 |
| YOLOv10n | ~200 FPS | ~70 FPS | 2.3M | 端到端无NMS |

### 性能分解

端到端延迟分解（640x480输入）：

```
总延迟 ≈ 21ms (47 FPS)
├── 预处理 (BGR→NV12): ~3ms (14%)
├── BPU推理: ~10.8ms (51%)
├── 后处理 (DFL+NMS): ~5ms (24%)
└── 绘制+显示: ~2ms (9%)
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115
```

---

<<<<<<< HEAD
## 📚 Documentation

### Complete Tutorials

- [📖 Detailed Deployment Tutorial](docs/tutorial_en.md) - Complete guide from scratch
- [🔧 Troubleshooting Guide](docs/troubleshooting_en.md) - Common issues and solutions
- [⚡ Performance Optimization Guide](docs/optimization_en.md) - Further performance improvements
- [📝 API Documentation](docs/api_reference_en.md) - Code interface reference

### Technical Principles

- [🧠 Softmax Performance Bottleneck Analysis](docs/softmax_bottleneck_en.md)
- [🎯 PTQ Quantization Deep Dive](docs/ptq_guide_en.md)
- [🖼️ YOLOv11 Postprocessing Implementation](docs/postprocess_en.md)

### Advanced Topics

- [🚀 C++ Deployment Acceleration](docs/cpp_deployment_en.md)
- [🎨 Custom Model Training](docs/custom_training_en.md)
- [🔬 Accuracy Evaluation & Comparison](docs/accuracy_evaluation_en.md)

---

## 📁 Project Structure

```
YOLOv11n-RDK-X5/
├── README.md                          # English README
├── README_ZH.md                       # Chinese README
├── LICENSE                            # MIT License
├── requirements.txt                   # Python dependencies
├── deploy.sh                          # One-click deployment script
├── configs/                           # Configuration files
│   ├── yolo11n_config.yaml           # PTQ quantization config
│   └── camera_config.yaml            # Camera configuration
├── scripts/                           # Utility scripts
│   ├── modify_ultralytics.py         # Modify Ultralytics detection head
│   ├── export_onnx.py                # Export ONNX model
│   ├── prepare_calibration.py        # Prepare calibration data
│   ├── quantize.sh                   # PTQ quantization script
│   └── deploy_to_rdk.sh              # Deploy to RDK script
├── rdk_deployment/                    # RDK X5 board-side code
│   ├── camera_detect.py              # Real-time detection main program
│   ├── yolo11_detector.py            # YOLOv11 detector class
│   ├── utils.py                      # Utility functions
│   └── performance_test.py           # Performance testing script
├── docs/                              # Documentation directory
│   ├── images/                       # Documentation images
│   ├── tutorial_en.md                # Detailed tutorial
│   ├── troubleshooting_en.md         # Troubleshooting
│   └── ...                           # Other documentation
├── examples/                          # Example code
│   ├── basic_inference.py            # Basic inference example
│   ├── video_inference.py            # Video inference example
│   └── benchmark.py                  # Performance benchmark
└── tests/                             # Test code
=======
## 📚 文档

### 完整教程

- [📖 详细部署教程](docs/tutorial_zh.md) - 从零开始的完整指南
- [🔧 故障排查指南](docs/troubleshooting_zh.md) - 常见问题解决
- [⚡ 性能优化指南](docs/optimization_zh.md) - 进一步提升性能
- [📝 API文档](docs/api_reference_zh.md) - 代码接口说明

### 技术原理

- [🧠 Softmax性能瓶颈分析](docs/softmax_bottleneck_zh.md)
- [🎯 PTQ量化详解](docs/ptq_guide_zh.md)
- [🖼️ YOLOv11后处理实现](docs/postprocess_zh.md)

### 进阶主题

- [🚀 C++部署加速](docs/cpp_deployment_zh.md)
- [🎨 自定义模型训练](docs/custom_training_zh.md)
- [🔬 精度评估与对比](docs/accuracy_evaluation_zh.md)

---

## 📁 项目结构

```
YOLOv11n-RDK-X5/
├── README.md                          # 项目说明
├── README_EN.md                       # English README
├── LICENSE                            # MIT许可证
├── requirements.txt                   # Python依赖
├── deploy.sh                          # 一键部署脚本
├── configs/                           # 配置文件
│   ├── yolo11n_config.yaml           # PTQ量化配置
│   └── camera_config.yaml            # 摄像头配置
├── scripts/                           # 工具脚本
│   ├── modify_ultralytics.py         # 修改Ultralytics输出头
│   ├── export_onnx.py                # 导出ONNX模型
│   ├── prepare_calibration.py        # 准备校准数据
│   ├── quantize.sh                   # PTQ量化脚本
│   └── deploy_to_rdk.sh              # 部署到RDK脚本
├── rdk_deployment/                    # RDK X5板端代码
│   ├── camera_detect.py              # 实时检测主程序
│   ├── yolo11_detector.py            # YOLOv11检测器类
│   ├── utils.py                      # 工具函数
│   └── performance_test.py           # 性能测试脚本
├── docs/                              # 文档目录
│   ├── images/                       # 文档图片
│   ├── tutorial_zh.md                # 详细教程
│   ├── troubleshooting_zh.md         # 故障排查
│   └── ...                           # 其他文档
├── examples/                          # 示例代码
│   ├── basic_inference.py            # 基础推理示例
│   ├── video_inference.py            # 视频推理示例
│   └── benchmark.py                  # 性能基准测试
└── tests/                             # 测试代码
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115
    ├── test_onnx_export.py
    ├── test_quantization.py
    └── test_inference.py
```

---

<<<<<<< HEAD
## 🎯 Use Cases

This project is suitable for the following scenarios:

✅ **Smart Surveillance** - Real-time monitoring in malls, parking lots, offices
✅ **Robot Vision** - AGV navigation, service robot obstacle avoidance
✅ **Edge AI** - Unmanned detection, smart home applications
✅ **Educational Demo** - AI course experiments, algorithm verification

❌ **Not Ideal For**:
- High-speed motion scenarios (requiring 100+ FPS)
- Ultra-high precision requirements (recommend YOLOv11x)

---

## 🤝 Contributing

Contributions, bug reports, and suggestions are welcome!

### How to Contribute

1. Fork this repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for details

### Contributors

Thanks to all developers who contributed to this project!

<a href="https://github.com/1760hwy/YOLOv11n-RDK-X5/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=1760hwy/YOLOv11n-RDK-X5" />
=======
## 🎯 使用场景

本项目适合以下应用场景：

✅ **智能监控** - 商场、停车场、办公室等实时监控
✅ **机器人视觉** - AGV导航、服务机器人避障
✅ **边缘AI** - 无人值守检测、智能家居
✅ **教学演示** - AI课程实验、算法验证

❌ **不太适合**：
- 高速运动场景（需要100+ FPS）
- 超高精度要求（建议用YOLOv11x）

---

## 🤝 贡献

欢迎贡献代码、报告问题或提出建议！

### 如何贡献

1. Fork本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启Pull Request

详见 [CONTRIBUTING.md](CONTRIBUTING.md)

### 贡献者

感谢所有为本项目做出贡献的开发者！

<a href="https://github.com/1760hwy/YOLOv11n-RDK-X5/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=your-username/YOLOv11n-RDK-X5" />
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115
</a>

---

<<<<<<< HEAD
## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details

---

## 🙏 Acknowledgments

- [Ultralytics](https://github.com/ultralytics/ultralytics) - Official YOLOv11 implementation
- [Horizon Robotics](https://developer.d-robotics.cc/) - RDK X5 development board and toolchain
- [OpenCV](https://opencv.org/) - Computer vision library
- All developers and community members who helped with this project

---

## 📞 Contact

- Project Homepage: https://github.com/1760hwy/YOLOv11n-RDK-X5
- Issue Tracker: https://github.com/1760hwy/YOLOv11n-RDK-X5/issues
- Email: 1580195000@qq.com
=======
## 📄 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件

---

## 🙏 致谢

- [Ultralytics](https://github.com/ultralytics/ultralytics) - YOLOv11官方实现
- [地平线机器人](https://developer.d-robotics.cc/) - RDK X5开发板和工具链
- [OpenCV](https://opencv.org/) - 计算机视觉库
- 所有为本项目提供帮助的开发者和社区成员

---

## 📞 联系方式

- 项目主页：https://github.com/1760hwy/YOLOv11n-RDK-X5
- 问题反馈：https://github.com/1760hwy/YOLOv11n-RDK-X5/issues
- 邮箱：1580195000@qq.com
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115

---

## ⭐ Star History

<<<<<<< HEAD
If this project helps you, please give us a Star ⭐!
=======
如果这个项目对你有帮助，请给我们一个Star ⭐！
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115

[![Star History Chart](https://api.star-history.com/svg?repos=1760hwy/YOLOv11n-RDK-X5&type=Date)](https://star-history.com/1760hwy/YOLOv11n-RDK-X5&Date)

---

<div align="center">

<<<<<<< HEAD
**[⬆ Back to Top](#yolov11n-rdk-x5-)**
=======
**[⬆ 返回顶部](#yolov11n-rdk-x5-)**
>>>>>>> 5cbef688514db14e23911e4c55feb6d512cab115

Made with ❤️ by [Your Name]

</div>
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6

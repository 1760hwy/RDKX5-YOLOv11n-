<div id="top"></div>

# RDKX5-YOLOv11n- 🚀

English | [简体中文](README_ZH.md)

<div align="center">

![YOLOv11](https://img.shields.io/badge/YOLOv11-n-blue)
![RDK X5](https://img.shields.io/badge/RDK-X5-green)
![Performance](https://img.shields.io/badge/FPS-47-red)
![License](https://img.shields.io/badge/license-MIT-yellow)

**Deploy YOLOv11n on Horizon RDK X5 with 47 FPS Real-time Object Detection**

[Features](#-features) • [Quick Start](#-quick-start) • [Performance](#-performance) • [Documentation](#-documentation) • [Contributing](#-contributing)

</div>

---

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

```bash
git clone git@github.com:1760hwy/RDKX5-YOLOv11n-.git
cd RDKX5-YOLOv11n-
```

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
cd docker_images
docker load < openexplorer_ai_toolchain_ubuntu_20_x5_cpu_v1.2.8-py310.tar.gz
```

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
cd ~/yolo11_deploy
python3 camera_detect.py
```

### 🎬 One-Click Deployment (Recommended)

If you have complete COCO dataset, use the one-click deployment script:

```bash
# Configure RDK X5 IP address
export RDK_IP=192.168.43.7

# Execute one-click deployment
./deploy.sh
```

---

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
```

---

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
RDKX5-YOLOv11n-/
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
    ├── test_onnx_export.py
    ├── test_quantization.py
    └── test_inference.py
```

---

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

<a href="https://github.com/1760hwy/RDKX5-YOLOv11n-/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=1760hwy/RDKX5-YOLOv11n-" />
</a>

---

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

- Project Homepage: https://github.com/1760hwy/RDKX5-YOLOv11n-
- Issue Tracker: https://github.com/1760hwy/RDKX5-YOLOv11n-/issues
- Email: 1580195000@qq.com

---

## ⭐ Star History

If this project helps you, please give us a Star ⭐!

[![Star History Chart](https://api.star-history.com/svg?repos=1760hwy/RDKX5-YOLOv11n-&type=Date)](https://star-history.com/1760hwy/RDKX5-YOLOv11n-&Date)

---

<div align="center">

**[⬆ Back to Top](#top)**

Made with ❤️ by [Your Name]

</div>

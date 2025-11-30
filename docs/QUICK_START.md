# 快速上传指南

这个文档会指导你用**最快的方式**把项目上传到GitHub。

## 🚀 超快速版（5分钟）

适合已经有GitHub账号且配置好Git的用户。

```bash
# 1. 创建项目目录
cd ~
mkdir YOLOv11n-RDK-X5
cd YOLOv11n-RDK-X5

# 2. 复制所有准备好的文件到这里
# （从/mnt/user-data/outputs/github_project/复制）

# 3. 修改README中的用户名（替换your-username为你的GitHub用户名）
YOUR_USERNAME="你的GitHub用户名"
sed -i "s/your-username/$YOUR_USERNAME/g" README.md
sed -i "s/your-email@example.com/你的邮箱/g" README.md LICENSE CONTRIBUTING.md
sed -i "s/\[Your Name\]/你的名字/g" README.md LICENSE

# 4. 初始化Git
git init
git add .
git commit -m "Initial commit: YOLOv11n RDK X5 project"

# 5. 在GitHub网页创建仓库（名为YOLOv11n-RDK-X5）
# 访问：https://github.com/new

# 6. 关联并推送
git remote add origin https://github.com/$YOUR_USERNAME/YOLOv11n-RDK-X5.git
git push -u origin main

# 输入GitHub用户名和密码（密码用Personal Access Token）
```

完成！访问 `https://github.com/你的用户名/YOLOv11n-RDK-X5` 查看项目。

---

## 📝 需要创建的文件清单

### ✅ 已创建的文件

以下文件已经为你准备好了（在`/mnt/user-data/outputs/github_project/`）：

```
✅ README.md                    - 项目主页（需要修改用户名）
✅ LICENSE                      - MIT许可证（需要修改作者名）
✅ CONTRIBUTING.md              - 贡献指南
✅ .gitignore                   - Git忽略文件
✅ requirements.txt             - Python依赖
✅ deploy.sh                    - 一键部署脚本
✅ scripts/modify_ultralytics.py - 修改Ultralytics脚本
✅ scripts/export_onnx.py       - 导出ONNX脚本
✅ docs/GITHUB_GUIDE.md         - GitHub操作指南
```

### 📋 还需要创建的文件

这些文件需要你根据实际情况创建：

#### 1. 量化配置文件

**文件路径**: `configs/yolo11n_config.yaml`

```yaml
# PTQ量化配置
model_parameters:
  onnx_model: '/data/models/yolo11n.onnx'
  march: 'bayes-e'
  working_dir: '/data/output'
  output_model_file_prefix: 'yolo11n_detect_bayese_640x640_nv12'
  
  # 核心配置：Softmax BPU优化
  node_info: {"/model.10/m/m.0/attn/Softmax": {'ON': 'BPU','InputType': 'int16','OutputType': 'int16'}}

input_parameters:
  input_type_rt: 'nv12'
  input_type_train: 'rgb'
  input_layout_train: 'NCHW'
  norm_type: 'data_scale'
  scale_value: 0.003921568627451

calibration_parameters:
  cal_data_dir: '/data/calibration_data'
  cal_data_type: 'float32'
  calibration_type: 'default'

compiler_parameters:
  compile_mode: 'latency'
  optimize_level: 'O3'
```

#### 2. RDK板端代码

**文件路径**: `rdk_deployment/camera_detect.py`

（使用你之前测试成功的`camera_detect_final.py`）

**文件路径**: `rdk_deployment/yolo11_detector.py`

（将检测器类单独提取出来）

**文件路径**: `rdk_deployment/performance_test.py`

（使用你的`test_bpu_performance.py`）

#### 3. 其他脚本

**文件路径**: `scripts/prepare_calibration.py`

（校准数据准备脚本）

**文件路径**: `scripts/quantize.sh`

（PTQ量化Shell脚本）

**文件路径**: `scripts/start_docker.sh`

（启动Docker的脚本）

#### 4. 文档文件

**文件路径**: `docs/tutorial_zh.md`

（使用你的CSDN博客内容）

**文件路径**: `docs/troubleshooting_zh.md`

（故障排查指南）

#### 5. 示例代码

**文件路径**: `examples/basic_inference.py`

（基础推理示例）

**文件路径**: `examples/benchmark.py`

（性能测试示例）

---

## 📦 完整文件结构

```
YOLOv11n-RDK-X5/
├── README.md                          ✅ 已创建
├── README_EN.md                       ⚠️  可选（英文版README）
├── LICENSE                            ✅ 已创建
├── CONTRIBUTING.md                    ✅ 已创建
├── .gitignore                         ✅ 已创建
├── requirements.txt                   ✅ 已创建
├── deploy.sh                          ✅ 已创建
│
├── configs/                           📁 配置文件目录
│   └── yolo11n_config.yaml           🔨 需要创建
│
├── scripts/                           📁 工具脚本目录
│   ├── modify_ultralytics.py         ✅ 已创建
│   ├── export_onnx.py                ✅ 已创建
│   ├── prepare_calibration.py        🔨 需要创建
│   ├── quantize.sh                   🔨 需要创建
│   └── start_docker.sh               🔨 需要创建
│
├── rdk_deployment/                    📁 RDK板端代码
│   ├── camera_detect.py              🔨 需要创建
│   ├── yolo11_detector.py            🔨 需要创建
│   ├── utils.py                      🔨 需要创建
│   └── performance_test.py           🔨 需要创建
│
├── docs/                              📁 文档目录
│   ├── GITHUB_GUIDE.md               ✅ 已创建
│   ├── tutorial_zh.md                🔨 需要创建
│   ├── troubleshooting_zh.md         🔨 需要创建
│   ├── optimization_zh.md            ⚠️  可选
│   └── images/                       📁 文档图片
│       └── (添加截图)
│
├── examples/                          📁 示例代码
│   ├── basic_inference.py            🔨 需要创建
│   ├── video_inference.py            ⚠️  可选
│   └── benchmark.py                  🔨 需要创建
│
└── tests/                             📁 测试代码（可选）
    └── ...
```

**图例**：
- ✅ 已创建：文件已经在`/mnt/user-data/outputs/github_project/`中
- 🔨 需要创建：使用你现有的代码创建
- ⚠️  可选：非必需，可以稍后添加

---

## 🔨 创建剩余文件的方法

### 方法1：复制你现有的代码

```bash
cd ~/YOLOv11n-RDK-X5

# 创建目录
mkdir -p configs rdk_deployment examples

# 复制配置文件
cp ~/rdk_x5_deploy/yolo11n_config_optimized.yaml configs/yolo11n_config.yaml

# 复制RDK代码
cp ~/yolo_test/camera_detect_final.py rdk_deployment/camera_detect.py
cp ~/yolo_test/test_bpu_performance.py rdk_deployment/performance_test.py

# 复制文档（CSDN博客）
cp /mnt/user-data/outputs/RDK_X5_YOLOv11n_部署完整教程.md docs/tutorial_zh.md
```

### 方法2：使用模板创建

我会为你创建所有剩余文件的模板，你只需要复制即可。

---

## ⚡ 最小可用版本

如果你想先快速上传一个基础版本，只需要这些文件：

```
最小版本/
├── README.md              ✅
├── LICENSE                ✅
├── .gitignore            ✅
├── requirements.txt       ✅
├── scripts/
│   ├── modify_ultralytics.py  ✅
│   └── export_onnx.py         ✅
└── docs/
    └── GITHUB_GUIDE.md        ✅
```

上传后，其他文件可以逐步添加：

```bash
# 后续添加文件
git add configs/yolo11n_config.yaml
git commit -m "docs: add quantization config"
git push

git add rdk_deployment/
git commit -m "feat: add RDK deployment code"
git push
```

---

## 🎯 推荐流程

### 阶段1：基础版本（第1天）

1. 上传核心文件（README、脚本）
2. 完善README描述
3. 添加基本文档

### 阶段2：完整版本（第2-3天）

1. 添加所有代码文件
2. 补充详细文档
3. 添加示例和测试

### 阶段3：优化版本（持续）

1. 根据用户反馈改进
2. 添加更多功能
3. 写博客宣传

---

## 💡 提示

1. **不要上传大文件**
   - ONNX模型（~10MB）→ 可以上传
   - BIN模型（~5MB）→ 可以上传
   - 校准数据（>100MB）→ 不要上传，在.gitignore中排除
   - 工具链（>2GB）→ 绝对不要上传

2. **README要吸引人**
   - 添加性能对比表格
   - 添加实际运行的GIF或视频
   - 清晰的安装步骤

3. **持续更新**
   - 及时回复Issues
   - 定期更新文档
   - 添加新功能

4. **代码质量**
   - 添加注释
   - 保持一致的代码风格
   - 写单元测试（可选）

---

需要帮助？查看：
- [详细GitHub指南](GITHUB_GUIDE.md)
- [Git命令速查](#)
- [贡献指南](../CONTRIBUTING.md)

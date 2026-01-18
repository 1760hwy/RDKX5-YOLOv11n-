# Windows环境下的GitHub上传指南

本指南专门为**Windows用户**编写，手把手教你如何在Windows上传项目到GitHub。

## 📋 准备工作

### 1. 下载项目文件

<<<<<<< HEAD
你已经下载了项目压缩包 `RDKX5-YOLOv11n-.zip`，解压到：
```
C:\Users\你的用户名\Desktop\RDKX5-YOLOv11n-
=======
你已经下载了项目压缩包 `YOLOv11n-RDK-X5.zip`，解压到：
```
C:\Users\你的用户名\Desktop\YOLOv11n-RDK-X5
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
```

### 2. 安装Git for Windows

#### 下载安装

1. 访问：https://git-scm.com/download/win
2. 下载安装包（约50MB）
3. 双击运行，**一路点击Next**（使用默认设置即可）

#### 验证安装

1. 按 `Win + R`，输入 `cmd`，按回车
2. 在命令提示符中输入：
   ```cmd
   git --version
   ```
3. 应该看到：`git version 2.x.x`

### 3. 配置Git

在命令提示符（cmd）中执行：

```cmd
git config --global user.name "你的GitHub用户名"
git config --global user.email "你的邮箱@example.com"
```

---

## 🚀 方法1：使用GitHub Desktop（最简单）

**推荐新手使用！** 无需敲命令，全程图形界面操作。

### 步骤1：安装GitHub Desktop

1. 访问：https://desktop.github.com/
2. 下载并安装（约100MB）
3. 打开GitHub Desktop
4. 点击 **Sign in to GitHub.com**
5. 输入你的GitHub账号和密码登录

### 步骤2：创建仓库

1. 在GitHub Desktop中，点击 **File** → **New repository**
2. 填写信息：
   ```
<<<<<<< HEAD
   Name: RDKX5-YOLOv11n-
=======
   Name: YOLOv11n-RDK-X5
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
   Local path: C:\Users\你的用户名\Desktop
   ```
3. **取消勾选** "Initialize this repository with a README"
4. 点击 **Create repository**

### 步骤3：复制项目文件

<<<<<<< HEAD
1. 打开文件夹：`C:\Users\你的用户名\Desktop\RDKX5-YOLOv11n-`
=======
1. 打开文件夹：`C:\Users\你的用户名\Desktop\YOLOv11n-RDK-X5`
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
2. 删除里面的 `.git` 文件夹（如果有）
3. 将下载的项目文件**全部复制**到这个文件夹

### 步骤4：修改个人信息

使用记事本或VS Code打开以下文件并修改：

**README.md**：
- 查找 `your-username`，全部替换为你的GitHub用户名
- 查找 `your-email@example.com`，替换为你的邮箱
- 查找 `[Your Name]`，替换为你的名字

**LICENSE**：
- 将 `[Your Name]` 替换为你的名字

**CONTRIBUTING.md**：
- 将 `your-email@example.com` 替换为你的邮箱

### 步骤5：提交更改

1. 回到GitHub Desktop
2. 会看到很多文件显示在左侧（Changes）
3. 在左下角 Summary 中输入：`Initial commit`
4. 点击蓝色按钮 **Commit to main**

### 步骤6：发布到GitHub

1. 点击顶部的 **Publish repository**
2. 确认信息：
<<<<<<< HEAD
   - Name: `RDKX5-YOLOv11n-`
=======
   - Name: `YOLOv11n-RDK-X5`
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
   - Description: `YOLOv11n部署到地平线RDK X5，实现47 FPS实时检测`
   - 勾选 **Public**（公开项目）
3. 点击 **Publish repository**

### 步骤7：验证成功

1. 在GitHub Desktop中点击 **View on GitHub**
2. 浏览器会打开你的项目页面
3. 检查README是否正确显示

**完成！你的项目已经上传到GitHub了！** 🎉

---

## 🔧 方法2：使用命令行（适合有经验的用户）

### 步骤1：打开PowerShell

1. 按 `Win + X`
2. 选择 **Windows PowerShell** 或 **终端**

### 步骤2：进入项目目录

```powershell
<<<<<<< HEAD
cd C:\Users\你的用户名\Desktop\RDKX5-YOLOv11n-
=======
cd C:\Users\你的用户名\Desktop\YOLOv11n-RDK-X5
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
```

### 步骤3：修改个人信息

使用VS Code或记事本批量替换：
```powershell
# 使用PowerShell替换（需要安装PowerShell 7+）
(Get-Content README.md) -replace 'your-username', '你的GitHub用户名' | Set-Content README.md
(Get-Content README.md) -replace 'your-email@example.com', '你的邮箱' | Set-Content README.md
(Get-Content README.md) -replace '\[Your Name\]', '你的名字' | Set-Content README.md
```

### 步骤4：初始化Git

```powershell
git init
git add .
git commit -m "Initial commit: YOLOv11n RDK X5 project"
```

### 步骤5：在GitHub创建仓库

1. 访问：https://github.com/new
<<<<<<< HEAD
2. Repository name: `RDKX5-YOLOv11n-`
=======
2. Repository name: `YOLOv11n-RDK-X5`
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
3. Description: `YOLOv11n部署到地平线RDK X5，实现47 FPS实时检测`
4. 选择 **Public**
5. **不要勾选**任何初始化选项
6. 点击 **Create repository**

### 步骤6：关联并推送

```powershell
# 替换为你的GitHub用户名
<<<<<<< HEAD
git remote add origin git@github.com:你的用户名/RDKX5-YOLOv11n-.git
=======
git remote add origin https://github.com/你的用户名/YOLOv11n-RDK-X5.git
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
git branch -M main
git push -u origin main
```

第一次推送会要求输入：
- Username: 你的GitHub用户名
- Password: **Personal Access Token**（不是登录密码！）

### 创建Personal Access Token

1. 访问：https://github.com/settings/tokens
2. 点击 **Generate new token** → **Generate new token (classic)**
3. 设置：
<<<<<<< HEAD
   - Note: `RDKX5-YOLOv11n-`
=======
   - Note: `YOLOv11n-RDK-X5`
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
   - Expiration: `90 days`
   - 勾选权限：`repo`（全选）
4. 点击 **Generate token**
5. **复制Token**（只显示一次，保存好）
6. 在推送时，将Token作为密码输入

---

## 📝 修改文件的技巧（Windows）

### 方法1：使用记事本批量替换

1. 用记事本打开 `README.md`
2. 按 `Ctrl + H` 打开替换
3. 查找：`your-username`
4. 替换为：`你的GitHub用户名`
5. 点击 **全部替换**
6. 重复以上步骤替换其他内容

### 方法2：使用VS Code（推荐）

1. 下载安装 VS Code：https://code.visualstudio.com/
2. 用VS Code打开整个项目文件夹
3. 按 `Ctrl + Shift + H` 打开全局替换
4. 在 "搜索" 框输入：`your-username`
5. 在 "替换" 框输入：你的GitHub用户名
6. 点击 **全部替换**

### 方法3：使用PowerShell脚本

创建一个 `replace.ps1` 文件：

```powershell
# replace.ps1 - 批量替换脚本
$username = "你的GitHub用户名"
$email = "你的邮箱@example.com"
$name = "你的名字"

# 替换README.md
(Get-Content README.md -Raw) -replace 'your-username', $username `
    -replace 'your-email@example.com', $email `
    -replace '\[Your Name\]', $name | Set-Content README.md -NoNewline

# 替换LICENSE
(Get-Content LICENSE -Raw) -replace 'your-email@example.com', $email `
    -replace '\[Your Name\]', $name | Set-Content LICENSE -NoNewline

# 替换CONTRIBUTING.md
(Get-Content CONTRIBUTING.md -Raw) -replace 'your-email@example.com', $email | Set-Content CONTRIBUTING.md -NoNewline

Write-Host "✅ 替换完成！" -ForegroundColor Green
```

运行脚本：
```powershell
# 在PowerShell中执行
.\replace.ps1
```

---

## 🎯 添加剩余文件

项目中还缺少一些从你的实际代码复制的文件：

### 从Ubuntu虚拟机复制文件

**方法A：使用WinSCP（推荐）**

1. 下载WinSCP：https://winscp.net/eng/download.php
2. 安装并打开
3. 连接到Ubuntu虚拟机：
   - 文件协议：SCP
   - 主机名：你的Ubuntu IP
   - 用户名：你的用户名
   - 密码：你的密码
4. 复制以下文件到Windows项目目录：

```
Ubuntu路径                                          → Windows路径
~/rdk_x5_deploy/yolo11n_config_optimized.yaml     → configs/yolo11n_config.yaml
```

**方法B：通过SSH和SFTP**

使用FileZilla等SFTP客户端连接Ubuntu虚拟机并下载文件。

### 从RDK X5复制文件

同样使用WinSCP连接到RDK X5（IP: 192.168.43.7）：

```
RDK X5路径                           → Windows路径
~/yolo_test/camera_detect_final.py  → rdk_deployment/camera_detect.py
~/yolo_test/test_bpu_performance.py → rdk_deployment/performance_test.py
```

### 创建缺少的Python脚本

如果某些脚本没有，可以先创建占位文件，后续补充：

**rdk_deployment/utils.py**（创建一个空的工具文件）：
```python
# RDK X5 工具函数
# 后续添加常用函数
```

**examples/basic_inference.py**（基础推理示例）：
```python
#!/usr/bin/env python3
"""基础推理示例 - 待补充"""
print("示例代码待补充")
```

---

## 🔄 后续更新文件

### 使用GitHub Desktop更新

1. 修改或添加文件
2. 打开GitHub Desktop
3. 会自动检测到更改
4. 填写 Summary（如："Add performance test script"）
5. 点击 **Commit to main**
6. 点击 **Push origin**

### 使用命令行更新

```powershell
# 查看更改
git status

# 添加新文件或修改
git add .

# 提交
git commit -m "feat: add new feature"

# 推送
git push
```

---

## 🎨 美化项目

### 添加截图

1. 截取程序运行画面
2. 保存为 `demo.png`
3. 创建 `assets` 文件夹
4. 将图片放入 `assets/demo.png`
5. 在README.md中添加：
   ```markdown
   ![Demo](assets/demo.png)
   ```

### 录制GIF动图

使用工具：
- ScreenToGif（免费）：https://www.screentogif.com/
- LICEcap（免费）：https://www.cockos.com/licecap/

录制步骤：
1. 打开ScreenToGif
2. 选择录制区域
3. 点击录制
4. 保存为GIF
5. 添加到项目

---

## 🆘 常见问题

### Q1: Git推送时提示403错误

**原因**：密码错误或Token过期

**解决**：
1. 创建新的Personal Access Token
2. 使用Token作为密码

### Q2: 文件名太长无法复制

**原因**：Windows路径限制

**解决**：
```powershell
# 启用长路径支持
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
```

### Q3: PowerShell执行脚本被阻止

**原因**：执行策略限制

**解决**：
```powershell
# 以管理员身份运行PowerShell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Q4: GitHub Desktop无法找到Git

**解决**：
1. 重新安装Git for Windows
2. 重启GitHub Desktop

---

## 📚 推荐工具（Windows）

### 代码编辑器
- **VS Code**（推荐）：https://code.visualstudio.com/
- Notepad++：https://notepad-plus-plus.org/

### Git客户端
- **GitHub Desktop**（推荐）：https://desktop.github.com/
- GitKraken：https://www.gitkraken.com/
- SourceTree：https://www.sourcetreeapp.com/

### 文件传输
- **WinSCP**（推荐）：https://winscp.net/
- FileZilla：https://filezilla-project.org/

### 终端工具
- **Windows Terminal**（推荐）：Microsoft Store下载
- Git Bash：随Git for Windows安装

---

## ✅ 完整检查清单

上传前检查：

- [ ] 已安装Git for Windows
- [ ] 已配置Git用户名和邮箱
- [ ] 已修改README.md中的个人信息
- [ ] 已修改LICENSE中的作者名
- [ ] 已修改CONTRIBUTING.md中的邮箱
- [ ] 文件结构完整
- [ ] 没有包含敏感信息（密码、Token）

上传后检查：

- [ ] README正确显示
- [ ] LICENSE显示为MIT
- [ ] 所有链接可点击
- [ ] 文件结构正确
- [ ] 添加了Topics标签

---

## 🎯 快速命令参考

```powershell
# 常用Git命令（PowerShell）

# 查看状态
git status

# 添加文件
git add .
git add 文件名

# 提交
git commit -m "提交说明"

# 推送
git push

# 拉取
git pull

# 查看历史
git log

# 创建分支
git checkout -b 分支名

# 切换分支
git checkout 分支名

# 克隆仓库
<<<<<<< HEAD
git clone git@github.com:用户名/仓库名.git
=======
git clone https://github.com/用户名/仓库名.git
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
```

---

## 🎉 你准备好了！

**现在你可以在Windows上操作了！**

推荐流程：
1. 解压项目文件
2. 安装GitHub Desktop（最简单）
3. 按照"方法1"步骤操作
4. 10分钟搞定！

**祝你上传顺利！** 🚀

---

**需要帮助？**
- 查看[GitHub官方文档](https://docs.github.com/)
- 观看[GitHub Desktop教程视频](https://www.youtube.com/watch?v=8Dd7KRpKeaE)
- 在Issues中提问

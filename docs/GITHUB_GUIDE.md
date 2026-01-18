# GitHub操作指南 - 从零开始发布项目

<<<<<<< HEAD
本指南将手把手教你如何将RDKX5-YOLOv11n-项目上传到GitHub并开源。
=======
本指南将手把手教你如何将YOLOv11n-RDK-X5项目上传到GitHub并开源。
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6

## 📋 前置准备

### 1. 注册GitHub账号

如果你还没有GitHub账号：

1. 访问 https://github.com
2. 点击右上角 **Sign up**
3. 填写邮箱、密码、用户名
4. 完成邮箱验证

### 2. 安装Git

**Ubuntu/Linux:**
```bash
sudo apt update
sudo apt install git
```

**Windows:**
- 下载：https://git-scm.com/download/win
- 双击安装，一路Next

**Mac:**
```bash
brew install git
```

验证安装：
```bash
git --version
# 应该显示：git version 2.x.x
```

### 3. 配置Git

第一次使用Git需要配置用户名和邮箱：

```bash
# 设置你的GitHub用户名
git config --global user.name "你的GitHub用户名"

# 设置你的GitHub邮箱
git config --global user.email "你的邮箱@example.com"

# 验证配置
git config --global --list
```

---

## 🚀 第一步：在GitHub创建仓库

### 1.1 登录GitHub

访问 https://github.com 并登录

### 1.2 创建新仓库

1. 点击右上角头像旁边的 **+** 号
2. 选择 **New repository**
3. 填写仓库信息：

   ```
<<<<<<< HEAD
   Repository name: RDKX5-YOLOv11n-
=======
   Repository name: YOLOv11n-RDK-X5
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
   Description: YOLOv11n部署到地平线RDK X5，实现47 FPS实时目标检测
   
   [ ] Public  （选这个，公开项目）
   [ ] Private （私有项目，只有你能看）
   
   [ ] Add a README file （不勾选，我们已经准备好了）
   [ ] Add .gitignore （不勾选，我们已经有了）
   [ ] Choose a license （不勾选，我们已经有LICENSE了）
   ```

4. 点击 **Create repository**

### 1.3 记录仓库地址

创建后会看到一个页面，有两种地址：

<<<<<<< HEAD
- **HTTPS**: `https://github.com/你的用户名/RDKX5-YOLOv11n-.git`
- **SSH**: `git@github.com:你的用户名/RDKX5-YOLOv11n-.git`
=======
- **HTTPS**: `https://github.com/你的用户名/YOLOv11n-RDK-X5.git`
- **SSH**: `git@github.com:你的用户名/YOLOv11n-RDK-X5.git`
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6

我们使用HTTPS方式（更简单）。

---

## 📦 第二步：准备项目文件

### 2.1 整理项目文件

在你的Ubuntu虚拟机中创建项目目录：

```bash
# 创建项目根目录
<<<<<<< HEAD
mkdir -p ~/RDKX5-YOLOv11n-
cd ~/RDKX5-YOLOv11n-
=======
mkdir -p ~/YOLOv11n-RDK-X5
cd ~/YOLOv11n-RDK-X5
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6

# 复制所有准备好的文件
# （从 /mnt/user-data/outputs/github_project/ 复制）
```

### 2.2 检查文件结构

确保你的项目包含以下文件：

```bash
tree -L 2 -a
# 应该看到：
# .
# ├── README.md
# ├── LICENSE
# ├── .gitignore
# ├── requirements.txt
# ├── deploy.sh
# ├── CONTRIBUTING.md
# ├── scripts/
# │   ├── modify_ultralytics.py
# │   ├── export_onnx.py
# │   └── ...
# ├── rdk_deployment/
# │   └── ...
# ├── docs/
# │   └── ...
# └── configs/
#     └── ...
```

### 2.3 修改README.md中的链接

使用文本编辑器打开 `README.md`，替换以下内容：

```bash
# 将所有 "your-username" 替换为你的GitHub用户名
# 将所有 "your-email@example.com" 替换为你的邮箱
# 将 "[Your Name]" 替换为你的名字

# 使用sed命令批量替换（推荐）
YOUR_USERNAME="你的GitHub用户名"
YOUR_EMAIL="你的邮箱"
YOUR_NAME="你的名字"

sed -i "s/your-username/$YOUR_USERNAME/g" README.md
sed -i "s/your-email@example.com/$YOUR_EMAIL/g" README.md LICENSE CONTRIBUTING.md
sed -i "s/\[Your Name\]/$YOUR_NAME/g" README.md LICENSE
```

---

## 🔧 第三步：初始化Git仓库

### 3.1 初始化本地仓库

```bash
<<<<<<< HEAD
cd ~/RDKX5-YOLOv11n-
=======
cd ~/YOLOv11n-RDK-X5
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6

# 初始化Git仓库
git init

# 查看状态
git status
# 应该看到很多"未跟踪的文件"
```

### 3.2 添加文件到暂存区

```bash
# 添加所有文件
git add .

# 查看将要提交的文件
git status
# 应该看到很多"要提交的变更"
```

### 3.3 提交到本地仓库

```bash
# 第一次提交
git commit -m "Initial commit: YOLOv11n RDK X5 deployment project"

# 查看提交历史
git log
```

---

## ⬆️ 第四步：上传到GitHub

### 4.1 关联远程仓库

```bash
# 添加远程仓库地址（替换成你的地址）
<<<<<<< HEAD
git remote add origin git@github.com:你的用户名/RDKX5-YOLOv11n-.git
=======
git remote add origin https://github.com/你的用户名/YOLOv11n-RDK-X5.git
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6

# 验证远程仓库
git remote -v
# 应该看到：
<<<<<<< HEAD
# origin  git@github.com:你的用户名/RDKX5-YOLOv11n-.git (fetch)
# origin  git@github.com:你的用户名/RDKX5-YOLOv11n-.git (push)
=======
# origin  https://github.com/你的用户名/YOLOv11n-RDK-X5.git (fetch)
# origin  https://github.com/你的用户名/YOLOv11n-RDK-X5.git (push)
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
```

### 4.2 推送到GitHub

```bash
# 推送到main分支（GitHub新仓库默认是main）
git push -u origin main

<<<<<<< HEAD
# 如果你使用的是 SSH 远程地址（git@github.com:...），正常情况下不会要求输入用户名和密码
# 如果遇到 Permission denied (publickey)，说明 SSH Key 未配置或未添加到 GitHub
#（如需走 HTTPS 方式推送，才需要使用 Personal Access Token，见下文）
```

### 4.3 创建Personal Access Token（仅在使用 HTTPS 推送时需要）

如果你使用的是 HTTPS 远程地址并且推送时提示密码错误，需要创建 Token：
=======
# 第一次推送会要求输入GitHub用户名和密码
# 用户名：你的GitHub用户名
# 密码：需要使用Personal Access Token（见下文）
```

### 4.3 创建Personal Access Token（如果需要）

如果推送时提示密码错误，需要创建Token：
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6

1. 访问 https://github.com/settings/tokens
2. 点击 **Generate new token** → **Generate new token (classic)**
3. 填写信息：
<<<<<<< HEAD
   - Note: `RDKX5-YOLOv11n-`
=======
   - Note: `YOLOv11n-RDK-X5`
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
   - Expiration: `90 days`（或自定义）
   - 勾选权限：`repo` （全部勾选）
4. 点击 **Generate token**
5. **复制Token**（只显示一次，保存好）
6. 再次推送时，用Token替代密码

**保存Token的方法：**

```bash
# 让Git记住Token（下次不用再输入）
git config --global credential.helper store

# 然后再次推送
git push -u origin main
# 输入用户名和Token，Git会记住
```

---

## ✅ 第五步：验证上传成功

### 5.1 访问你的仓库

在浏览器中访问：
```
<<<<<<< HEAD
https://github.com/你的用户名/RDKX5-YOLOv11n-
=======
https://github.com/你的用户名/YOLOv11n-RDK-X5
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
```

你应该看到：
- ✅ README.md内容显示在首页
- ✅ 所有文件和文件夹都在
- ✅ License显示为MIT
- ✅ 项目描述正确

### 5.2 检查README渲染

确保README.md正确渲染：
- 图片显示正常
- 链接可点击
- 表格格式正确
- 代码块高亮

---

## 🎨 第六步：美化项目（可选）

### 6.1 添加项目Logo

1. 创建或找一个Logo图片（推荐500x500px）
2. 保存为 `logo.png`
3. 上传到项目：

```bash
# 创建assets目录
mkdir -p assets
cp /path/to/logo.png assets/

# 在README.md顶部添加Logo
# 编辑README.md，在顶部添加：
# ![Logo](assets/logo.png)

# 提交更改
git add assets/logo.png README.md
git commit -m "docs: add project logo"
git push
```

### 6.2 添加Badges（徽章）

在README.md顶部添加更多徽章：

```markdown
![Python](https://img.shields.io/badge/python-3.10+-blue)
![Platform](https://img.shields.io/badge/platform-RDK%20X5-green)
<<<<<<< HEAD
![Stars](https://img.shields.io/github/stars/你的用户名/RDKX5-YOLOv11n-)
![Forks](https://img.shields.io/github/forks/你的用户名/RDKX5-YOLOv11n-)
![Issues](https://img.shields.io/github/issues/你的用户名/RDKX5-YOLOv11n-)
=======
![Stars](https://img.shields.io/github/stars/你的用户名/YOLOv11n-RDK-X5)
![Forks](https://img.shields.io/github/forks/你的用户名/YOLOv11n-RDK-X5)
![Issues](https://img.shields.io/github/issues/你的用户名/YOLOv11n-RDK-X5)
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
```

### 6.3 添加GitHub Topics

在GitHub仓库页面：
1. 点击右侧的 ⚙️ 设置（About旁边）
2. 在Topics中添加：
   - `yolov11`
   - `object-detection`
   - `rdk-x5`
   - `edge-ai`
   - `computer-vision`
   - `deep-learning`

---

## 🔄 第七步：日常更新

### 7.1 添加新功能

```bash
# 创建新分支
git checkout -b feature/new-feature

# 修改代码...

# 提交更改
git add .
git commit -m "feat: add new feature"

# 推送分支
git push origin feature/new-feature

# 在GitHub创建Pull Request，合并到main
```

### 7.2 修复Bug

```bash
# 创建修复分支
git checkout -b fix/bug-name

# 修复代码...

# 提交
git add .
git commit -m "fix: resolve bug description"
git push origin fix/bug-name
```

### 7.3 直接在main分支更新

```bash
# 确保在main分支
git checkout main

# 拉取最新代码
git pull

# 修改文件...

# 提交
git add .
git commit -m "docs: update documentation"
git push
```

---

## 📢 第八步：推广项目

### 8.1 写一个好的README

确保README包含：
- ✅ 清晰的项目描述
- ✅ 安装步骤
- ✅ 使用示例
- ✅ 性能数据
- ✅ 截图或Demo视频
- ✅ 贡献指南

### 8.2 发布Release

当项目达到一个里程碑时：

1. 在GitHub仓库页面点击 **Releases**
2. 点击 **Create a new release**
3. 填写信息：
   - Tag: `v1.0.0`
   - Title: `v1.0.0 - Initial Release`
   - Description: 列出主要功能和改进
4. 点击 **Publish release**

### 8.3 分享项目

- CSDN博客：发布部署教程，附上GitHub链接
- B站视频：录制演示视频
- 知乎专栏：写技术分析文章
- Reddit: r/computervision, r/MachineLearning
- Twitter/微博：分享项目

---

## 🆘 常见问题

### Q1: 推送时提示"Permission denied"

**解决方案：**
```bash
# 检查远程地址
git remote -v

# 如果是SSH地址但你没配置SSH Key，改为HTTPS
<<<<<<< HEAD
git remote set-url origin git@github.com:你的用户名/RDKX5-YOLOv11n-.git
=======
git remote set-url origin https://github.com/你的用户名/YOLOv11n-RDK-X5.git
>>>>>>> 7936bda8c16ede98a8b7e2b878154dd7cba33ed6
```

### Q2: 文件太大无法推送

Git默认限制单个文件100MB。如果有大文件：

**解决方案1：** 使用Git LFS
```bash
# 安装Git LFS
git lfs install

# 追踪大文件
git lfs track "*.bin"
git lfs track "*.onnx"

# 提交.gitattributes
git add .gitattributes
git commit -m "chore: add Git LFS"
```

**解决方案2：** 不上传大文件
```bash
# 在.gitignore中添加
echo "*.bin" >> .gitignore
echo "*.onnx" >> .gitignore

# 取消追踪已添加的大文件
git rm --cached large_file.bin
```

### Q3: 不小心提交了密码或Token

**立即行动：**
```bash
# 从历史中完全删除（危险操作，谨慎使用）
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch path/to/secret" \
  --prune-empty --tag-name-filter cat -- --all

# 强制推送
git push origin --force --all
```

**然后：**
1. 立即更改泄露的密码/Token
2. 检查GitHub上是否还有历史记录

### Q4: 如何删除仓库

1. 进入仓库页面
2. 点击 **Settings**
3. 滚动到最下方 **Danger Zone**
4. 点击 **Delete this repository**
5. 输入仓库名确认

---

## 📚 推荐学习资源

- **GitHub官方教程**: https://docs.github.com/cn
- **Git简明指南**: https://rogerdudler.github.io/git-guide/index.zh.html
- **Git Pro电子书**: https://git-scm.com/book/zh/v2
- **GitHub Skills**: https://skills.github.com/

---

## 🎓 Git命令速查表

```bash
# 初始化
git init                    # 初始化仓库
git clone <url>            # 克隆仓库

# 基本操作
git status                 # 查看状态
git add <file>            # 添加文件
git add .                 # 添加所有文件
git commit -m "message"   # 提交
git push                  # 推送到远程
git pull                  # 拉取远程更新

# 分支操作
git branch                # 查看分支
git branch <name>         # 创建分支
git checkout <branch>     # 切换分支
git checkout -b <branch>  # 创建并切换分支
git merge <branch>        # 合并分支
git branch -d <branch>    # 删除分支

# 远程仓库
git remote -v             # 查看远程仓库
git remote add origin <url>  # 添加远程仓库
git remote remove origin  # 删除远程仓库

# 撤销操作
git reset HEAD <file>     # 取消暂存
git checkout -- <file>    # 撤销修改
git revert <commit>       # 撤销提交
git reset --hard <commit> # 回退到某个提交（危险）

# 查看历史
git log                   # 查看提交历史
git log --oneline        # 简洁历史
git diff                 # 查看差异
```

---

**恭喜！你已经学会如何在GitHub上开源项目了！** 🎉

如有问题，欢迎在Issues中提问。

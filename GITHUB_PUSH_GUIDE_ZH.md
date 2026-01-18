# GitHub 推送指南 🚀

完整的将 YOLOv11n-RDK-X5 项目推送到 GitHub 的详细指南

---

## 📋 目录

1. [前置准备](#前置准备)
2. [方法一：快速开始（新手推荐）](#方法一快速开始新手推荐)
3. [方法二：使用 GitHub Desktop](#方法二使用-github-desktop)
4. [方法三：高级 Git 工作流](#方法三高级-git-工作流)
5. [故障排查](#故障排查)
6. [后续步骤](#后续步骤)

---

## 前置准备

### 1. 安装 Git

**Ubuntu/Linux:**
```bash
sudo apt update
sudo apt install git
```

**Windows:**
- 从 https://git-scm.com/download/win 下载
- 运行安装程序（使用默认设置）

**macOS:**
```bash
brew install git
# 或安装 Xcode 命令行工具
xcode-select --install
```

### 2. 配置 Git

```bash
# 设置你的名字（会出现在提交记录中）
git config --global user.name "你的名字"

# 设置你的邮箱（应与 GitHub 账号匹配）
git config --global user.email "your.email@example.com"

# 验证配置
git config --list
```

### 3. 创建 GitHub 账号

- 访问 https://github.com/signup
- 按照注册流程操作
- 验证你的邮箱

### 4. 生成个人访问令牌 (Personal Access Token)

GitHub 不再接受密码进行 Git 操作，你需要个人访问令牌：

1. 访问 https://github.com/settings/tokens
2. 点击 **Generate new token** → **Generate new token (classic)**
3. 设置令牌名称：`YOLOv11n-RDK-X5`
4. 选择权限：勾选 `repo`（完全控制）
5. 点击 **Generate token**
6. **重要**：立即复制令牌（只显示一次！）
7. 安全保存（比如密码管理器）

---

## 方法一：快速开始（新手推荐）

### 第1步：准备项目文件

```bash
# 进入项目目录
cd /path/to/RDKX5-YOLOv11n--master

# 验证文件存在
ls -la

# 应该看到：README.md, README_ZH.md, LICENSE 等
```

### 第2步：初始化 Git 仓库

```bash
# 初始化 git 仓库
git init

# 检查状态
git status

# 你应该看到未跟踪的文件
```

### 第3步：暂存文件

```bash
# 添加所有文件到暂存区
git add .

# 或添加特定文件
git add README.md LICENSE requirements.txt

# 验证暂存的文件
git status
```

### 第4步：创建首次提交

```bash
# 创建带有描述性消息的提交
git commit -m "Initial commit: YOLOv11n RDK X5 deployment project"

# 验证提交
git log
```

### 第5步：在 GitHub 上创建仓库

**方式 A：通过网页界面**

1. 访问 https://github.com/new
2. 填写详细信息：
   - **仓库名称**：`YOLOv11n-RDK-X5`
   - **描述**：`在地平线RDK X5上部署YOLOv11n，实现47 FPS实时目标检测`
   - **可见性**：Public（公开）或 Private（私有）
   - **不要**勾选初始化 README、.gitignore 或许可证
3. 点击 **Create repository**

**方式 B：通过 GitHub CLI（如果已安装）**

```bash
# 安装 GitHub CLI
# Ubuntu: sudo apt install gh
# macOS: brew install gh
# Windows: 从 https://cli.github.com/ 下载

# 登录 GitHub
gh auth login

# 创建仓库
gh repo create YOLOv11n-RDK-X5 --public --description "在地平线RDK X5上部署YOLOv11n，实现47 FPS实时检测"
```

### 第6步：关联本地仓库到 GitHub

```bash
# 添加 GitHub 仓库为远程仓库
git remote add origin https://github.com/你的用户名/YOLOv11n-RDK-X5.git

# 将 "你的用户名" 替换为你实际的 GitHub 用户名

# 验证远程仓库
git remote -v
```

### 第7步：推送到 GitHub

```bash
# 重命名分支为 main（如果需要）
git branch -M main

# 推送代码到 GitHub
git push -u origin main

# 系统会提示输入：
# Username: 你的_github_用户名
# Password: 粘贴你的个人访问令牌
```

**认证提示：**
- Username：你的 GitHub 用户名
- Password：粘贴你的个人访问令牌（不是 GitHub 密码！）
- 令牌会被缓存用于未来的推送

### 第8步：验证上传

1. 访问 `https://github.com/你的用户名/YOLOv11n-RDK-X5`
2. 你应该看到：
   - ✅ README.md 显示在主页
   - ✅ 所有文件已上传
   - ✅ 提交历史可见

---

## 方法二：使用 GitHub Desktop

### 第1步：安装 GitHub Desktop

- 从 https://desktop.github.com/ 下载
- 安装并使用 GitHub 账号登录

### 第2步：添加仓库

1. 点击 **File** → **Add Local Repository**
2. 浏览到你的项目文件夹：`RDKX5-YOLOv11n--master`
3. 点击 **Add Repository**

如果未初始化：
1. 点击 **Create a repository**
2. 设置路径为项目文件夹
3. 点击 **Create Repository**

### 第3步：提交更改

1. 在左侧面板查看更改的文件
2. 添加提交摘要：`Initial commit: YOLOv11n RDK X5 deployment`
3. 添加描述（可选）
4. 点击 **Commit to main**

### 第4步：发布到 GitHub

1. 点击 **Publish repository** 按钮
2. 设置仓库名称：`YOLOv11n-RDK-X5`
3. 添加描述
4. 选择 **Public**（公开）或 **Private**（私有）
5. 点击 **Publish Repository**

### 第5步：验证

- 点击 **View on GitHub** 在浏览器中打开
- 确认所有文件已上传

---

## 方法三：高级 Git 工作流

### 分支策略

```bash
# 创建开发分支
git checkout -b develop

# 创建功能分支
git checkout -b feature/add-documentation

# 进行更改...
git add .
git commit -m "docs: add detailed tutorial"

# 合并回主分支
git checkout main
git merge feature/add-documentation

# 删除功能分支
git branch -d feature/add-documentation
```

### 增量提交

```bash
# 第一次提交：仅核心文件
git add README.md README_ZH.md LICENSE .gitignore requirements.txt
git commit -m "docs: add core documentation and license"
git push origin main

# 第二次提交：添加脚本
git add scripts/
git commit -m "feat: add model conversion scripts"
git push

# 第三次提交：添加部署代码
git add rdk_deployment/
git commit -m "feat: add RDK X5 deployment code"
git push

# 第四次提交：添加文档
git add docs/
git commit -m "docs: add comprehensive tutorials"
git push
```

### 提交消息规范

遵循约定式提交格式：

```bash
# 格式：<type>(<scope>): <subject>

# 类型：
feat:     # 新功能
fix:      # Bug 修复
docs:     # 文档更改
style:    # 代码风格（格式化等）
refactor: # 代码重构
test:     # 添加测试
chore:    # 构建过程、依赖项

# 示例：
git commit -m "feat(deployment): add one-click deployment script"
git commit -m "fix(quantization): resolve Softmax operator issue"
git commit -m "docs(readme): update performance benchmarks"
git commit -m "refactor(detector): optimize postprocessing pipeline"
```

---

## 故障排查

### 问题1：认证失败

**问题：**
```
remote: Support for password authentication was removed.
fatal: Authentication failed
```

**解决方案：**
- 你使用了密码而不是个人访问令牌
- 在 https://github.com/settings/tokens 生成新令牌
- 推送时使用令牌作为密码

### 问题2：仓库已存在

**问题：**
```
remote: Repository not found.
fatal: repository 'https://github.com/...' not found
```

**解决方案：**
```bash
# 检查远程 URL
git remote -v

# 如果错误，更新远程 URL
git remote set-url origin https://github.com/你的用户名/YOLOv11n-RDK-X5.git

# 验证 URL 中的用户名与你的 GitHub 账号匹配
```

### 问题3：大文件错误

**问题：**
```
remote: error: File is too large
remote: error: See http://git.io/iEPt8g for more information.
```

**解决方案：**

**选项 A：使用 Git LFS（用于 >50MB 的文件）**
```bash
# 安装 Git LFS
# Ubuntu: sudo apt install git-lfs
# macOS: brew install git-lfs
# Windows: 从 https://git-lfs.github.com/ 下载

# 初始化 Git LFS
git lfs install

# 跟踪大文件
git lfs track "*.bin"
git lfs track "*.pt"
git lfs track "*.onnx"

# 添加 .gitattributes
git add .gitattributes

# 提交并推送
git add .
git commit -m "chore: add Git LFS for large files"
git push
```

**选项 B：排除大文件**
```bash
# 添加到 .gitignore
echo "*.bin" >> .gitignore
echo "*.pt" >> .gitignore
echo "models/" >> .gitignore

# 在 README 中提供下载链接
```

### 问题4：权限被拒绝（SSH）

**问题：**
```
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.
```

**解决方案：**

**设置 SSH 密钥：**
```bash
# 生成 SSH 密钥
ssh-keygen -t ed25519 -C "your.email@example.com"

# 按 Enter 接受默认位置
# 设置密码短语（可选）

# 启动 SSH 代理
eval "$(ssh-agent -s)"

# 添加密钥到代理
ssh-add ~/.ssh/id_ed25519

# 复制公钥
cat ~/.ssh/id_ed25519.pub
# 将输出复制到剪贴板

# 添加到 GitHub：
# 1. 访问 https://github.com/settings/keys
# 2. 点击 "New SSH key"
# 3. 粘贴密钥
# 4. 点击 "Add SSH key"

# 更新远程仓库使用 SSH
git remote set-url origin git@github.com:你的用户名/YOLOv11n-RDK-X5.git

# 测试连接
ssh -T git@github.com
```

### 问题5：合并冲突

**问题：**
```
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

**解决方案：**
```bash
# 查看冲突文件
git status

# 编辑文件解决冲突
# 查找冲突标记：
# <<<<<<< HEAD
# 你的更改
# =======
# 他们的更改
# >>>>>>> branch-name

# 解决冲突后
git add .
git commit -m "fix: resolve merge conflicts"
git push
```

### 问题6：推送被拒绝（非快进）

**问题：**
```
! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs
```

**解决方案：**

**选项 A：拉取并合并**
```bash
# 拉取远程更改
git pull origin main

# 解决任何冲突
# 然后推送
git push origin main
```

**选项 B：强制推送（危险 - 仅在确定时使用）**
```bash
# 强制推送（覆盖远程）
git push -f origin main

# 谨慎使用 - 可能丢失历史记录
```

---

## 后续步骤

### 1. 增强仓库

**添加主题标签：**
1. 访问仓库页面
2. 点击 "About" 旁边的 ⚙️
3. 添加主题：`yolov11`、`rdk-x5`、`object-detection`、`edge-ai`、`computer-vision`
4. 保存更改

**添加描述：**
```
在地平线RDK X5上部署YOLOv11n，实现47 FPS实时目标检测。
解决Softmax性能瓶颈，性能提升11.6倍。
```

**添加网站：**
- 链接到文档或演示视频

### 2. 创建发布版本

```bash
# 标记当前版本
git tag -a v1.0.0 -m "Initial release: YOLOv11n RDK X5 deployment"

# 推送标签
git push origin v1.0.0

# 或推送所有标签
git push --tags
```

在 GitHub 上：
1. 转到 **Releases** → **Create new release**
2. 选择标签 `v1.0.0`
3. 添加发布说明
4. 附加编译的二进制文件（可选）
5. 发布版本

### 3. 启用 GitHub Pages（可选）

用于文档网站：

1. 转到 **Settings** → **Pages**
2. 来源：从分支部署
3. 分支：`main` → `/docs`
4. 保存

你的文档将在：`https://你的用户名.github.io/YOLOv11n-RDK-X5`

### 4. 设置 CI/CD（可选）

创建 `.github/workflows/test.yml`：

```yaml
name: Test

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
        with:
          python-version: '3.10'
      - run: pip install -r requirements.txt
      - run: python -m pytest tests/
```

### 5. 在 README 中添加徽章

```markdown
![Build](https://github.com/你的用户名/YOLOv11n-RDK-X5/workflows/Test/badge.svg)
![License](https://img.shields.io/github/license/你的用户名/YOLOv11n-RDK-X5)
![Stars](https://img.shields.io/github/stars/你的用户名/YOLOv11n-RDK-X5?style=social)
```

---

## 维护你的仓库

### 日常工作流程

```bash
# 开始工作
git pull origin main                    # 获取最新更改

# 进行更改...
git status                              # 检查更改了什么
git add .                               # 暂存更改
git commit -m "feat: add new feature"   # 提交
git push origin main                    # 推送到 GitHub

# 创建功能分支
git checkout -b feature/new-feature
# 进行更改...
git commit -m "feat: implement new feature"
git push origin feature/new-feature
# 在 GitHub 上创建 Pull Request
```

### 处理 Issues

当用户报告问题时：

```bash
# 创建修复分支
git checkout -b fix/issue-123

# 进行修复...
git add .
git commit -m "fix: resolve issue #123 - camera initialization error"
git push origin fix/issue-123

# 创建 Pull Request
# 合并后，通过评论关闭 issue："Fixed in #PR_NUMBER"
```

### 版本更新

```bash
# 更新版本
git add .
git commit -m "chore: bump version to 1.1.0"
git tag -a v1.1.0 -m "Release version 1.1.0"
git push origin main --tags
```

---

## Git 常用命令参考

```bash
# 状态与日志
git status                  # 显示工作目录状态
git log                     # 显示提交历史
git log --oneline          # 紧凑日志
git diff                   # 显示未暂存的更改
git diff --staged          # 显示已暂存的更改

# 分支
git branch                 # 列出分支
git branch new-branch      # 创建分支
git checkout branch-name   # 切换分支
git checkout -b new-branch # 创建并切换
git merge branch-name      # 合并分支
git branch -d branch-name  # 删除分支

# 撤销更改
git checkout -- file       # 丢弃未暂存的更改
git reset HEAD file        # 取消暂存文件
git reset --soft HEAD~1    # 撤销最后一次提交（保留更改）
git reset --hard HEAD~1    # 撤销最后一次提交（丢弃更改）
git revert commit-hash     # 创建新提交来撤销更改

# 远程操作
git remote -v              # 列出远程仓库
git remote add name url    # 添加远程仓库
git pull origin main       # 获取并合并
git fetch origin           # 仅获取不合并
git push origin main       # 推送到远程
git push -u origin branch  # 推送并设置上游

# 暂存
git stash                  # 临时保存更改
git stash list             # 列出暂存
git stash pop              # 应用并移除最新暂存
git stash apply            # 应用最新暂存
```

---

## 额外资源

- [Git 文档](https://git-scm.com/doc)
- [GitHub 文档](https://docs.github.com/cn)
- [Pro Git 书籍](https://git-scm.com/book/zh/v2)
- [GitHub Skills](https://skills.github.com/)
- [Git 速查表](https://training.github.com/downloads/zh_CN/github-git-cheat-sheet.pdf)

---

## 🎉 成功检查清单

推送到 GitHub 后，验证：

- [ ] README.md 在仓库主页正确显示
- [ ] 所有文件和目录已上传
- [ ] 许可证显示为 MIT
- [ ] README 中的所有链接有效
- [ ] 提交中没有敏感信息（密码、令牌）
- [ ] .gitignore 有效（没有上传大文件/构建产物）
- [ ] 仓库描述和主题已添加
- [ ] 创建了第一个发布版本（可选）

---

**恭喜！你的项目现在在 GitHub 上了！🚀**

分享你的仓库链接，开始围绕你的项目建立社区！

仓库地址：`https://github.com/你的用户名/YOLOv11n-RDK-X5`

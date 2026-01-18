# GitHub Push Guide 🚀

Complete guide to pushing your RDKX5-YOLOv11n- project to GitHub

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Method 1: Quick Start (Recommended for Beginners)](#method-1-quick-start-recommended-for-beginners)
3. [Method 2: Using GitHub Desktop](#method-2-using-github-desktop)
4. [Method 3: Advanced Git Workflow](#method-3-advanced-git-workflow)
5. [Troubleshooting](#troubleshooting)
6. [Next Steps](#next-steps)

---

## Prerequisites

### 1. Install Git

**Ubuntu/Linux:**
```bash
sudo apt update
sudo apt install git
```

**Windows:**
- Download from https://git-scm.com/download/win
- Run installer (use default settings)

**macOS:**
```bash
brew install git
# Or install Xcode Command Line Tools
xcode-select --install
```

### 2. Configure Git

```bash
# Set your name (appears in commits)
git config --global user.name "Your Name"

# Set your email (should match GitHub account)
git config --global user.email "your.email@example.com"

# Verify configuration
git config --list
```

### 3. Create GitHub Account

- Visit https://github.com/signup
- Follow registration process
- Verify your email

### 4. Generate Personal Access Token (PAT)

GitHub no longer accepts passwords for Git operations. You need a Personal Access Token:

1. Go to https://github.com/settings/tokens
2. Click **Generate new token** → **Generate new token (classic)**
3. Set token name: `RDKX5-YOLOv11n-`
4. Select scopes: Check `repo` (full control)
5. Click **Generate token**
6. **IMPORTANT**: Copy the token immediately (shown only once!)
7. Save it securely (e.g., password manager)

---

## Method 1: Quick Start (Recommended for Beginners)

### Step 1: Prepare Project Files

```bash
# Navigate to project directory
cd /path/to/RDKX5-YOLOv11n--master

# Verify files are present
ls -la

# Should see: README.md, README_ZH.md, LICENSE, etc.
```

### Step 2: Initialize Git Repository

```bash
# Initialize git repository
git init

# Check status
git status

# You should see untracked files
```

### Step 3: Stage Files

```bash
# Add all files to staging area
git add .

# Or add specific files
git add README.md LICENSE requirements.txt

# Verify staged files
git status
```

### Step 4: Create First Commit

```bash
# Create commit with descriptive message
git commit -m "Initial commit: YOLOv11n RDK X5 deployment project"

# Verify commit
git log
```

### Step 5: Create GitHub Repository

**Option A: Via Web Interface**

1. Visit https://github.com/new
2. Fill in details:
   - **Repository name**: `RDKX5-YOLOv11n-`
   - **Description**: `Deploy YOLOv11n on Horizon RDK X5 with 47 FPS real-time object detection`
   - **Visibility**: Public (or Private if preferred)
   - **DO NOT** initialize with README, .gitignore, or license
3. Click **Create repository**

**Option B: Via GitHub CLI (if installed)**

```bash
# Install GitHub CLI
# Ubuntu: sudo apt install gh
# macOS: brew install gh
# Windows: Download from https://cli.github.com/

# Login to GitHub
gh auth login

# Create repository
gh repo create RDKX5-YOLOv11n- --public --description "Deploy YOLOv11n on Horizon RDK X5 with 47 FPS"
```

### Step 6: Link Local Repository to GitHub

```bash
# Add GitHub repository as remote
git remote add origin git@github.com:YOUR_USERNAME/RDKX5-YOLOv11n-.git

# Replace YOUR_USERNAME with your actual GitHub username

# Verify remote
git remote -v
```

### Step 7: Push to GitHub

```bash
# Rename branch to main (if needed)
git branch -M main

# Push code to GitHub
git push -u origin main

# You'll be prompted for:
# Username: your_github_username
# Password: paste_your_personal_access_token_here
```

**Authentication Tips:**
- Username: Your GitHub username
- Password: Paste your Personal Access Token (NOT your GitHub password)
- Token will be cached for future pushes

### Step 8: Verify Upload

1. Visit `https://github.com/YOUR_USERNAME/RDKX5-YOLOv11n-`
2. You should see:
   - ✅ README.md displayed on homepage
   - ✅ All files uploaded
   - ✅ Commit history visible

---

## Method 2: Using GitHub Desktop

### Step 1: Install GitHub Desktop

- Download from https://desktop.github.com/
- Install and sign in with GitHub account

### Step 2: Add Repository

1. Click **File** → **Add Local Repository**
2. Browse to your project folder: `RDKX5-YOLOv11n--master`
3. Click **Add Repository**

If not initialized:
1. Click **Create a repository**
2. Set path to project folder
3. Click **Create Repository**

### Step 3: Commit Changes

1. Review changed files in left panel
2. Add commit summary: `Initial commit: YOLOv11n RDK X5 deployment`
3. Add description (optional)
4. Click **Commit to main**

### Step 4: Publish to GitHub

1. Click **Publish repository** button
2. Set repository name: `RDKX5-YOLOv11n-`
3. Add description
4. Choose **Public** or **Private**
5. Click **Publish Repository**

### Step 5: Verify

- Click **View on GitHub** to open in browser
- Confirm all files are uploaded

---

## Method 3: Advanced Git Workflow

### Branching Strategy

```bash
# Create development branch
git checkout -b develop

# Create feature branch
git checkout -b feature/add-documentation

# Make changes...
git add .
git commit -m "docs: add detailed tutorial"

# Merge back to main
git checkout main
git merge feature/add-documentation

# Delete feature branch
git branch -d feature/add-documentation
```

### Incremental Commits

```bash
# First commit: Core files only
git add README.md README_ZH.md LICENSE .gitignore requirements.txt
git commit -m "docs: add core documentation and license"
git push origin main

# Second commit: Add scripts
git add scripts/
git commit -m "feat: add model conversion scripts"
git push

# Third commit: Add deployment code
git add rdk_deployment/
git commit -m "feat: add RDK X5 deployment code"
git push

# Fourth commit: Add documentation
git add docs/
git commit -m "docs: add comprehensive tutorials"
git push
```

### Commit Message Conventions

Follow conventional commits format:

```bash
# Format: <type>(<scope>): <subject>

# Types:
feat:     # New feature
fix:      # Bug fix
docs:     # Documentation changes
style:    # Code style (formatting, etc.)
refactor: # Code refactoring
test:     # Adding tests
chore:    # Build process, dependencies

# Examples:
git commit -m "feat(deployment): add one-click deployment script"
git commit -m "fix(quantization): resolve Softmax operator issue"
git commit -m "docs(readme): update performance benchmarks"
git commit -m "refactor(detector): optimize postprocessing pipeline"
```

---

## Troubleshooting

### Issue 1: Authentication Failed

**Problem:**
```
remote: Support for password authentication was removed.
fatal: Authentication failed
```

**Solution:**
- You're using password instead of Personal Access Token
- Generate new token at https://github.com/settings/tokens
- Use token as password when pushing

### Issue 2: Repository Already Exists

**Problem:**
```
remote: Repository not found.
fatal: repository 'https://github.com/...' not found
```

**Solution:**
```bash
# Check remote URL
git remote -v

# Update remote URL if wrong
git remote set-url origin git@github.com:YOUR_USERNAME/RDKX5-YOLOv11n-.git

# Verify username in URL matches your GitHub account
```

### Issue 3: Large Files Error

**Problem:**
```
remote: error: File is too large
remote: error: See http://git.io/iEPt8g for more information.
```

**Solution:**

**Option A: Use Git LFS (for files >50MB)**
```bash
# Install Git LFS
# Ubuntu: sudo apt install git-lfs
# macOS: brew install git-lfs
# Windows: Download from https://git-lfs.github.com/

# Initialize Git LFS
git lfs install

# Track large files
git lfs track "*.bin"
git lfs track "*.pt"
git lfs track "*.onnx"

# Add .gitattributes
git add .gitattributes

# Commit and push
git add .
git commit -m "chore: add Git LFS for large files"
git push
```

**Option B: Exclude Large Files**
```bash
# Add to .gitignore
echo "*.bin" >> .gitignore
echo "*.pt" >> .gitignore
echo "models/" >> .gitignore

# Provide download links in README instead
```

### Issue 4: Permission Denied (SSH)

**Problem:**
```
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.
```

**Solution:**

**Setup SSH key:**
```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Press Enter to accept default location
# Set passphrase (optional)

# Start SSH agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub
# Copy output to clipboard

# Add to GitHub:
# 1. Go to https://github.com/settings/keys
# 2. Click "New SSH key"
# 3. Paste key
# 4. Click "Add SSH key"

# Update remote to use SSH
git remote set-url origin git@github.com:YOUR_USERNAME/RDKX5-YOLOv11n-.git

# Test connection
ssh -T git@github.com
```

### Issue 5: Merge Conflicts

**Problem:**
```
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

**Solution:**
```bash
# View conflicting files
git status

# Edit files to resolve conflicts
# Look for conflict markers:
# <<<<<<< HEAD
# your changes
# =======
# their changes
# >>>>>>> branch-name

# After resolving conflicts
git add .
git commit -m "fix: resolve merge conflicts"
git push
```

### Issue 6: Rejected Push (Non-Fast-Forward)

**Problem:**
```
! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs
```

**Solution:**

**Option A: Pull and merge**
```bash
# Pull remote changes
git pull origin main

# Resolve any conflicts
# Then push
git push origin main
```

**Option B: Force push (DANGEROUS - only if you're sure)**
```bash
# Force push (overwrites remote)
git push -f origin main

# Use with caution - can lose history
```

---

## Next Steps

### 1. Enhance Repository

**Add Topics:**
1. Go to repository page
2. Click ⚙️ next to "About"
3. Add topics: `yolov11`, `rdk-x5`, `object-detection`, `edge-ai`, `computer-vision`
4. Save changes

**Add Description:**
```
Deploy YOLOv11n on Horizon RDK X5 with 47 FPS real-time object detection. 
Resolves Softmax performance bottleneck with 11.6x speedup.
```

**Add Website:**
- Link to documentation or demo video

### 2. Create Releases

```bash
# Tag current version
git tag -a v1.0.0 -m "Initial release: YOLOv11n RDK X5 deployment"

# Push tags
git push origin v1.0.0

# Or push all tags
git push --tags
```

On GitHub:
1. Go to **Releases** → **Create new release**
2. Choose tag `v1.0.0`
3. Add release notes
4. Attach compiled binaries (optional)
5. Publish release

### 3. Enable GitHub Pages (Optional)

For documentation website:

1. Go to **Settings** → **Pages**
2. Source: Deploy from branch
3. Branch: `main` → `/docs`
4. Save

Your docs will be at: `https://YOUR_USERNAME.github.io/RDKX5-YOLOv11n-`

### 4. Set Up CI/CD (Optional)

Create `.github/workflows/test.yml`:

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

### 5. Add Badges to README

```markdown
![Build](https://github.com/YOUR_USERNAME/RDKX5-YOLOv11n-/workflows/Test/badge.svg)
![License](https://img.shields.io/github/license/YOUR_USERNAME/RDKX5-YOLOv11n-)
![Stars](https://img.shields.io/github/stars/YOUR_USERNAME/RDKX5-YOLOv11n-?style=social)
```

---

## Maintaining Your Repository

### Daily Workflow

```bash
# Start working
git pull origin main                    # Get latest changes

# Make changes...
git status                              # Check what changed
git add .                               # Stage changes
git commit -m "feat: add new feature"   # Commit
git push origin main                    # Push to GitHub

# Create feature branch
git checkout -b feature/new-feature
# Make changes...
git commit -m "feat: implement new feature"
git push origin feature/new-feature
# Create Pull Request on GitHub
```

### Handling Issues

When users report issues:

```bash
# Create fix branch
git checkout -b fix/issue-123

# Make fixes...
git add .
git commit -m "fix: resolve issue #123 - camera initialization error"
git push origin fix/issue-123

# Create Pull Request
# After merging, close issue with comment: "Fixed in #PR_NUMBER"
```

### Version Updates

```bash
# Update version
git add .
git commit -m "chore: bump version to 1.1.0"
git tag -a v1.1.0 -m "Release version 1.1.0"
git push origin main --tags
```

---

## Useful Git Commands Reference

```bash
# Status & Logs
git status                  # Show working directory status
git log                     # Show commit history
git log --oneline          # Compact log
git diff                   # Show unstaged changes
git diff --staged          # Show staged changes

# Branching
git branch                 # List branches
git branch new-branch      # Create branch
git checkout branch-name   # Switch branch
git checkout -b new-branch # Create and switch
git merge branch-name      # Merge branch
git branch -d branch-name  # Delete branch

# Undoing Changes
git checkout -- file       # Discard unstaged changes
git reset HEAD file        # Unstage file
git reset --soft HEAD~1    # Undo last commit (keep changes)
git reset --hard HEAD~1    # Undo last commit (discard changes)
git revert commit-hash     # Create new commit that undoes changes

# Remote Operations
git remote -v              # List remotes
git remote add name url    # Add remote
git pull origin main       # Fetch and merge
git fetch origin           # Fetch without merging
git push origin main       # Push to remote
git push -u origin branch  # Push and set upstream

# Stashing
git stash                  # Save changes temporarily
git stash list             # List stashes
git stash pop              # Apply and remove latest stash
git stash apply            # Apply latest stash
```

---

## Additional Resources

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Docs](https://docs.github.com/)
- [Pro Git Book](https://git-scm.com/book/en/v2)
- [GitHub Skills](https://skills.github.com/)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)

---

## 🎉 Success Checklist

After pushing to GitHub, verify:

- [ ] README.md displays correctly on repository homepage
- [ ] All files and directories uploaded
- [ ] License shows as MIT
- [ ] All links in README work
- [ ] No sensitive information (passwords, tokens) in commits
- [ ] .gitignore working (no large files/build artifacts)
- [ ] Repository description and topics added
- [ ] First release created (optional)

---

**Congratulations! Your project is now on GitHub! 🚀**

Share your repository link and start building a community around your project!

Repository URL: `https://github.com/YOUR_USERNAME/RDKX5-YOLOv11n-`

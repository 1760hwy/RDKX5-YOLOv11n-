@echo off
chcp 65001 >nul
echo ========================================
echo YOLOv11n-RDK-X5 个人信息替换脚本
echo ========================================
echo.

REM 获取用户输入
set /p GITHUB_USERNAME="请输入你的GitHub用户名: "
set /p EMAIL="请输入你的邮箱: "
set /p NAME="请输入你的名字: "

echo.
echo 正在替换以下信息：
echo   GitHub用户名: %GITHUB_USERNAME%
echo   邮箱: %EMAIL%
echo   名字: %NAME%
echo.

pause

echo 开始替换...
echo.

REM 使用PowerShell进行替换
powershell -Command "(Get-Content README.md -Raw) -replace 'your-username', '%GITHUB_USERNAME%' -replace 'your-email@example.com', '%EMAIL%' -replace '\[Your Name\]', '%NAME%' | Set-Content README.md -NoNewline"
echo ✓ README.md 已更新

powershell -Command "(Get-Content LICENSE -Raw) -replace 'your-email@example.com', '%EMAIL%' -replace '\[Your Name\]', '%NAME%' | Set-Content LICENSE -NoNewline"
echo ✓ LICENSE 已更新

powershell -Command "(Get-Content CONTRIBUTING.md -Raw) -replace 'your-email@example.com', '%EMAIL%' | Set-Content CONTRIBUTING.md -NoNewline"
echo ✓ CONTRIBUTING.md 已更新

echo.
echo ========================================
echo ✅ 替换完成！
echo ========================================
echo.
echo 下一步：
echo 1. 检查文件内容是否正确
echo 2. 如果使用GitHub Desktop：
echo    - 打开GitHub Desktop
echo    - File → Add Local Repository
echo    - 选择此文件夹
echo    - Commit changes
echo    - Publish repository
echo.
echo 3. 如果使用命令行：
echo    git init
echo    git add .
echo    git commit -m "Initial commit"
echo    git remote add origin https://github.com/%GITHUB_USERNAME%/YOLOv11n-RDK-X5.git
echo    git push -u origin main
echo.

pause

@echo off

REM Go to your project folder
cd /d "C:\Users\anshs\OneDrive\Desktop\automatic"

:loop
git add .

REM Only commit if there are staged changes
git diff --cached --quiet
IF ERRORLEVEL 1 (
    git commit -m "auto: changes on %date% %time%"
    git push origin main
    echo ✅ Pushed to GitHub at %date% %time%
) ELSE (
    echo ⏳ No changes to commit at %time%
)

REM Wait 60 seconds before repeating
timeout /t 60 > nul
goto loop

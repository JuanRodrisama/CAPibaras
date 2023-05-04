@echo off
for /f "tokens=1-3 delims=/" %%d in ("%date%") do set fecha=%%d-%%e-%%f
git clone https://github.com/JuanRodrisama/CAPibaras.git "%USERPROFILE%\OneDrive - Capgemini\Desktop\%fecha%"
git clone https://github.com/JuanRodrisama/CAPibaras.wiki.git "%USERPROFILE%\OneDrive - Capgemini\Desktop\%fecha%\wiki"
@echo OFF
RMDIR /s /q "c:\Family\cache\files"
XCOPY c:\Family c:\Family-backup\ /m /e /y
echo ----------------------------------
echo ---
echo Pour relancer Family Games, faites CTRL + C puis "runserver"
echo ---
echo ----------------------------------
echo -
echo Appuyez sur une TOUCHE pour lancer votre serveur
echo -
pause > nul
CLS
cd c:\Family
cmd /k run.cmd +exec server.cfg
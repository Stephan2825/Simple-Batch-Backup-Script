@echo off
title Datensicherung



:hauptmenu
cls
echo.
echo Willkommen %username%. Heute ist der %date%
echo Bitte auswaehlen:
echo.
echo 1. Datensicherung komplett
echo 2. Datensicherung Inkrementell
echo 3. Datensicherung Differenziell
echo 4. Beenden
echo.
set /p menu= Option waehlen:
echo.
if %menu% == 1 goto Datensicherungkomplett
if %menu% == 2 goto DatensicherungInkrementell
if %menu% == 3 goto DatensicherungDifferenziell
if %menu% == 4 goto Beenden






:Datensicherungkomplett
cls

echo ***************************
echo * Datensicherung komplett *
echo ***************************

echo Welches Laufwerk soll gesichert werden? 
echo.
echo.
set /p LaufwerkQuelle= Quelllaufwerk angeben:

rem md %LaufwerkQuelle%:\Datensicherung\%date%
echo.
echo.
set /p LaufwerkZiel= Ziellaufwerk angeben:
xcopy %LaufwerkQuelle%:\*.* %LaufwerkZiel%:\Datensicherung+k\*.* /s /e
echo.
if errorlevel == 1 (goto fehler)
if errorlevel == 0 (goto erfolgreich)
pause

:fehler
echo Fehler bei der Datensicherung.
pause
goto hauptmenu
:erfolgreich
echo Datensicherung war erfolgreich
echo.
pause
goto hauptmenu


:DatensicherungInkrementell
cls

echo *******************************
echo * Datensicherung Inkrementell *
echo *******************************

echo Welches Laufwerk soll gesichert werden? 
echo.
echo.
set /p LaufwerkQuelle= Quelllaufwerk angeben:

rem md %LaufwerkQuelle%:\Datensicherung\%date%
echo.
echo.
set /p LaufwerkZiel= Ziellaufwerk angeben:
xcopy %LaufwerkQuelle%:\*.* %LaufwerkZiel%:\Datensicherung+i\*.* /e /m /s
echo.
if errorlevel == 1 (goto fehler)
if errorlevel == 0 (goto erfolgreich)
echo.
pause
goto hauptmenu

:fehler
echo Fehler bei der Datensicherung.
pause
goto hauptmenu
:erfolgreich
echo Datensicherung war erfolgreich
pause
goto hauptmenu


:DatensicherungDifferenziell
cls

echo ********************************
echo * Datensicherung Differenziell *
echo ********************************

echo Welches Laufwerk soll gesichert werden? 
echo.
echo.
set /p LaufwerkQuelle= Quelllaufwerk angeben:

rem md %LaufwerkQuelle%:\Datensicherung\%date%
echo.
echo.
set /p LaufwerkZiel= Ziellaufwerk angeben:
xcopy %LaufwerkQuelle%:\*.* %LaufwerkZiel%:\Datensicherung+d\*.* /e /a /s /e
echo.
if errorlevel == 1 (goto fehler)
if errorlevel == 0 (goto erfolgreich)
echo.
pause
goto hauptmenu

:fehler
echo Fehler bei der Datensicherung.
pause
goto hauptmenu
:erfolgreich
echo Datensicherung war erfolgreich
pause
goto hauptmenu


:Beenden
exit


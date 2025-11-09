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
set /p menu=Option waehlen: 
echo.

if "%menu%"=="1" goto DatensicherungKomplett
if "%menu%"=="2" goto DatensicherungInkrementell
if "%menu%"=="3" goto DatensicherungDifferenziell
if "%menu%"=="4" goto Beenden
goto hauptmenu

:DatensicherungKomplett
cls
echo ***************************
echo * Datensicherung komplett *
echo ***************************

set /p LaufwerkQuelle=Quelllaufwerk angeben (z.B. C:\Ordner):
set /p LaufwerkZiel=Ziellaufwerk angeben (z.B. D:\Backup):

xcopy "%LaufwerkQuelle%\*" "%LaufwerkZiel%\Datensicherung_komplett\" /s /e /y
goto Ergebnis

:DatensicherungInkrementell
cls
echo *******************************
echo * Datensicherung Inkrementell *
echo *******************************

set /p LaufwerkQuelle=Quelllaufwerk angeben (z.B. C:\Ordner):
set /p LaufwerkZiel=Ziellaufwerk angeben (z.B. D:\Backup):

xcopy "%LaufwerkQuelle%\*" "%LaufwerkZiel%\Datensicherung_inkrementell\" /s /e /m /y
goto Ergebnis

:DatensicherungDifferenziell
cls
echo ********************************
echo * Datensicherung Differenziell *
echo ********************************

set /p LaufwerkQuelle=Quelllaufwerk angeben (z.B. C:\Ordner):
set /p LaufwerkZiel=Ziellaufwerk angeben (z.B. D:\Backup):

xcopy "%LaufwerkQuelle%\*" "%LaufwerkZiel%\Datensicherung_differenziell\" /s /e /a /y
goto Ergebnis

:Ergebnis
if errorlevel 1 (
    echo Fehler bei der Datensicherung.
) else (
    echo Datensicherung war erfolgreich.
)
pause
goto hauptmenu

:Beenden
exit

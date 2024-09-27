@echo off
title Win-Tools - by Dev12ju
chcp 65001 >nul
mode 120,45

:checkPerm
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto :admin
    ) else (
        start /min powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Vous devez exécuter ce script en tant qu''administrateur!', 'Admin', 'OK', 'none')}"
		exit
    )

:admin
mode 120,45

	:start
		call :banner
		call :menu
		pause >nul

	:menu
		for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
		echo.
		echo.
		echo  ╔═(1)Programme de protection des ressources Windows
		echo  ║
		echo  ╠═══(2)Outil de diagnostic de la mémoire
		echo  ║
		echo  ╠════(3)Rapport sur l'autonomie de la batterie
		echo  ║
		echo  ╠═════(4)Vider le cache DNS
		echo  ║
		echo  ╠══════(5)Supprimer les fichiers temporaires
		echo  ║
		echo  ╠═══════(6)Informations système
		echo  ║
		echo  ╠════════(7)Outil de nettoyage de disque
		echo  ║
		echo  ╠═════════(8)Outil de suppression de logiciels malveillants
		echo  ║
		echo  ╠══════════(9)Afficher la version du système
		echo  ║
		echo  ╠═══════════(10)Check Disk
		echo  ║
		echo  ╠════════════(11)Réinitialiser le cache du Microsoft Store
		echo  ║
		echo  ╠═════════════(12)Réparer les fichiers systèmes et images de Windows
		echo  ║
		echo  ╠══════════════(13)Supprimer le Xbox Game Bar
		echo  ║
		echo  ╚══╦════════════(14)Effets visuels Windows
		echo     ║
		set /p input=.%BS%    ╚═══════^>
		rem ╣ ║ ╗ ╝ ╚ ╔ ╩ ╦ ╠═ ╬ ═
		if /I %input% EQU 1 sfc /scannow 
		if /I %input% EQU 2 mdsched
		if /I %input% EQU 3 powercfg /batteryreport && pause
		if /I %input% EQU 4 ipconfig /flushdns
		if /I %input% EQU 5 del /q /f /s %temp%\*
		if /I %input% EQU 6 msinfo32
		if /I %input% EQU 7 cleanmgr
		if /I %input% EQU 8 mrt
		if /I %input% EQU 9 winver1
		if /I %input% EQU 10 chkdsk
		if /I %input% EQU 11 wsreset
		if /I %input% EQU 12 goto Dism
		if /I %input% EQU 13 goto ms-gaming-overlay
		if /I %input% EQU 14 SystemPropertiesPerformance.exe
		cls
		goto start

		:Dism
		dism /online /cleanup-image /checkHealth && dism /online /cleanup-image /scanHealth
		pause
		cls
		goto start
		
		:ms-gaming-overlay
		PowerShell.exe -command "Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage"
		start /min powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Win-Tools vas Fermer', 'Win-Tools', 'OK', 'none')}"
		exit
		

		:banner
			echo.
			echo.
			echo     [38;5;36m    __      __                  __                                  ______                ___              [0m
			echo     [38;5;30m   /\ \  __/\ \  __            /\ \                                /\__  _\              /\_ \             [0m
			echo     [38;5;24m   \ \ \/\ \ \ \/\_\    ___    \_\ \    ___   __  __  __    ____   \/_/\ \/   ___     ___\//\ \     ____   [0m
			echo     [38;5;27m    \ \ \ \ \ \ \/\ \ /' _ `\  /'_` \  / __`\/\ \/\ \/\ \  /',__\     \ \ \  / __`\  / __`\\ \ \   /',__\  [0m
			echo     [38;5;33m     \ \ \_/ \_\ \ \ \/\ \/\ \/\ \ \ \/\ \ \ \ \ \_/ \_/ \/\__, `\     \ \ \/\ \L\ \/\ \L\ \\_\ \_/\__, `\ [0m
			echo     [38;5;39m      \ `\___ ___/\ \_\ \_\ \_\ \___,_\ \____/\ \___ ___/'\/\____/      \ \_\ \____/\ \____//\____\/\____/ [0m
			echo     [38;5;45m       '\/__//__/  \/_/\/_/\/_/\/__,_ /\/___/  \/__//__/   \/___/        \/_/\/___/  \/___/ \/____/\/___/  [0m

		
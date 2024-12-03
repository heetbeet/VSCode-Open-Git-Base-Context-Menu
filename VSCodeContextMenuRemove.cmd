@echo off
SETLOCAL

:: Remove context menu entries
reg delete "HKEY_CURRENT_USER\Software\Classes\Directory\shell\VSCodeOpenGitBase" /f > nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\VSCodeOpenGitBase" /f > nul 2>&1

echo VSCode Open Git Base has been removed
echo:

:: Pause if double clicked
if /i "%comspec% /c %~0 " equ "%cmdcmdline:"=%" pause
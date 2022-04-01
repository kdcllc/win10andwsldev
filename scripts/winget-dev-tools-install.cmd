    @echo off  
    Echo Install Powertoys and Terminal  
    REM Powertoys  
    winget install Microsoft.Powertoys  
    if %ERRORLEVEL% EQU 0 Echo Powertoys installed successfully.  
 
    REM Terminal  
    winget install Microsoft.WindowsTerminal  
    if %ERRORLEVEL% EQU 0 Echo Terminal installed successfully.   %ERRORLEVEL%

    REM Microsoft.WindowsTerminalPreview
    winget install Microsoft.WindowsTerminalPreview
    if %ERRORLEVEL% EQU 0 Echo Terminal Preview installed successfully.   %ERRORLEVEL%

    REM Captura  
    winget install captura  
    if %ERRORLEVEL% EQU 0 Echo Captura installed successfully.   %ERRORLEVEL%

    REM code-insiders  
    winget install code-insiders  
    if %ERRORLEVEL% EQU 0 Echo code-insiders installed successfully.   %ERRORLEVEL%
    
    REM azure-cli  
    winget install Microsoft.AzureCLI
    if %ERRORLEVEL% EQU 0 Echo azure-cli installed successfully.   %ERRORLEVEL%
   

    REM ueli  
    winget install ueli
    if %ERRORLEVEL% EQU 0 Echo ueli installed successfully.   %ERRORLEVEL%
 

    REM voidtools.Everything  https://github.com/oliverschwendener/ueli/issues/504
    winget install voidtools.Everything
    if %ERRORLEVEL% EQU 0 Echo voidtools.Everything installed successfully.   %ERRORLEVEL%
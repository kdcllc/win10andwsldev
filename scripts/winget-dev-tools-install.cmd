    @echo off  

    Echo Tools
    
    REM Powertoys  
    winget install Microsoft.Powertoys  
    if %ERRORLEVEL% EQU 0 Echo Powertoys installed successfully.  
 
    REM Terminal  
    winget install Microsoft.WindowsTerminal  
    if %ERRORLEVEL% EQU 0 Echo Terminal installed successfully.   %ERRORLEVEL%

    REM Microsoft.WindowsTerminalPreview
    winget install Microsoft.WindowsTerminalPreview
    if %ERRORLEVEL% EQU 0 Echo Terminal Preview installed successfully.   %ERRORLEVEL%

    REM Git.Git  
    winget install Git.Git  
    if %ERRORLEVEL% EQU 0 Echo Git.Git.  

    REM Microsoft.VisualStudioCode.Insiders  
    winget install Microsoft.VisualStudioCode.Insiders 
    if %ERRORLEVEL% EQU 0 Echo Microsoft.VisualStudioCode.Insiders installed successfully.   %ERRORLEVEL%
    
    REM Microsoft.AzureCLI  
    winget install Microsoft.AzureCLI
    if %ERRORLEVEL% EQU 0 Echo Microsoft.AzureCLI installed successfully.   %ERRORLEVEL%

    REM Microsoft.AzureDataStudio.Insiders 
    winget install Microsoft.AzureDataStudio.Insiders  
    if %ERRORLEVEL% EQU 0 Echo Microsoft.AzureDataStudio.Insiders.  

    REM Microsoft.AzureStorageExplorer  
    winget install Microsoft.AzureStorageExplorer  
    if %ERRORLEVEL% EQU 0 Echo Microsoft.AzureStorageExplorer.  
    
    REM CoreyButler.NVMforWindows  
    winget install CoreyButler.NVMforWindows  
    if %ERRORLEVEL% EQU 0 Echo CoreyButler.NVMforWindows.  

    REM Captura  
    winget install captura  
    if %ERRORLEVEL% EQU 0 Echo Captura installed successfully.   %ERRORLEVEL%   

    REM ueli  
    winget install ueli
    if %ERRORLEVEL% EQU 0 Echo ueli installed successfully.   %ERRORLEVEL%
 
    REM voidtools.Everything  https://github.com/oliverschwendener/ueli/issues/504
    winget install voidtools.Everything
    if %ERRORLEVEL% EQU 0 Echo voidtools.Everything installed successfully.   %ERRORLEVEL%
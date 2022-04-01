# Clean Uninstall Visual Studio.NET 2017

In case when Uninstall fails on the UI components of the VS Installer then this utility can be used:

```cmd
     %ProgramFiles(x86)%\Microsoft Visual Studio\Installer\resources\app\layout\installcleanup.exe
```

Or use manual delete of the following:

```txt
    
    %ProgramData%\Microsoft\VisualStudio\15.0

    %ProgramData%\Microsoft\VisualStudio\Packages

    %AppData%\Microsoft\VisualStudio\15.0*

    %AppData%\Microsoft\VisualStudio\Packages

    %ProgramFiles(x86)%\Microsoft Visual Studio\2017

    HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\15.0*

    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\15.0*
```

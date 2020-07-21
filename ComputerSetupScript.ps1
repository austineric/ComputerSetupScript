

####################################
# Author:       Eric Austin
# Create date:  May 2020
# Description:  Computer setup script
####################################

Try {

    <#
    #list all available packages alphabetically
    winget search | Select-Object -Skip 3 -Property @{label="Name"; expression={$_.Substring(0, 24)}}, @{label="Id"; expression={$_.Substring(24, 35)}}, @{label="Version"; expression={$_.Substring(59)}} | Sort-Object -Property Name

    #search for a specific package
    winget search SearchTermHere

    #get info on a specific package
    winget show PackageName
    #>

    #other applications:
    #DevArt SQL Complete
    #if PowerToys can take over volume control then include PowerToys
    #mssql-scripter (https://github.com/microsoft/mssql-scripter)

    #may need to force this to run in admin mode since some applications (ie WinDirStat, probably others require that for install)

    [int]$InstallIndicator=0

    Clear-Host
    Write-Host ""
    Write-Host ""

    #get install indicator
    Do {
        $InstallIndicator=(Read-Host "Is this install for work (1) or personal (2)?")
    } Until ($InstallIndicator -eq"1" -or $InstallIndicator -eq "2")


    #check for Windows Package Manager, install if not present


    #.Net Core
    winget install .NET Core
    
    #7Zip
    winget install 7Zip

    #Chrome
    winget install Chrome

    #Greenshot
    #probably create a repo for the settings file a la https://getgreenshot.org/faq/how-can-i-backup-my-greenshot-configuration-or-transfer-it-to-another-machine/
    winget install Greenshot

    #Git for Windows
    winget install Git --Exact

    #Notepad++
    winget install Notepad++

    #PowerToys
    winget install PowerToys

    #SQL Complete (this is hopeful that the package will be added someday)
    #winget install DevArt SQL Complete
    #set the snippets manager to the local version of https://github.com/austineric/Snippets
    #probably create a repo for the xml profile file at C:\Users\EAustin\AppData\Roaming\Devart\dbForge SQL Complete\FormatProfiles

    #SQL Server Management Studio
    winget install SQL Server Management Studio
    #probably create a repo for settings a la https://blog.greglow.com/2018/03/01/shortcut-import-export-settings-sql-server-management-studio/

    #Visual Studio Code
    winget install Visual Studio Code

    #Visual Studio
    if ($InstallIndicator -eq 1)
    {
        winget install Visual Studio Professional
    }
    else
    {
        winget install Visual Studio Community
    }

    #VLC Media Player
    winget install VLC media player

    #WinDirStat
    winget install WinDirStat
    
    #Windows Terminal
    winget install Windows Terminal

    #WinSCP
    winget install WinSCP

}

Catch {

    Write-Host $Error[0]
    
}

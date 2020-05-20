

####################################
# Author:       Eric Austin
# Create date:  May 2020
# Description:  Computer setup script
####################################

Try {

    <#
    #list all available packages alphabetically
    (winget search) | Select-Object -Property @{label="Name"; expression={$_.Substring(0, 29)}} | Sort-Object -Property Name

    #search for a specific package
    (winget search) | Where-Object {$_ -like "*SearchTermHere*"}

    #get info on a specific package
    winget show PackageName
    #>

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

    #Notepad++
    winget install Notepad++

    #PowerToys
    winget install PowerToys

    #SQL Server Management Studio
    winget install SQL Server Management Studio

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
    
    #Windows Terminal
    winget install Windows Terminal

}

Catch {

    Write-Host $Error[0]
    
}
<#
Create a .PS1 template and open in visual studio code.
By: Alan Newingham
Date: 12/4/2020
Initial Commit: 12/4/2020
Git: 
Notes: Writing this as I am tired of manually doing this work for multiple scripts daily.
- Make sure $location matches where you keep your repos
- Modifing the .ps1 file extension in the $location variable you can auto-create any number of different files with autopopulated data. 

Site: https://automateanddeploy.com

Example creates a "NewPowerShell-File.ps1" and opens VSCode with "NewPowerShell-File.ps1": 
createPowershellTemplate -Name NewPowerShell-File
#>

function createPowershellTemplate
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name
    )

    Process
    {
        $location = "C:\scripts\XXXXXX\Test\$Name.ps1"
        $code_path="${Env:LOCALAPPDATA}\Programs\Microsoft VS Code\Code.exe"
        $date = (get-date).ToString(‘M/d/y’)
        $data = @"
<#
Title:
By: Alan Newingham
Date: $date
Initial Commit: 
Git: 
Notes: 
Site: https://automateanddeploy.com
#>
"@
        #Create the document 
        New-Item $location # This creates a new 0kb file. 
        #Add data
        Add-Content -Path $location $data # This adds the $data variable to the new file in $location we just created. 
        #Open Document in Visual Studio Code
        Start-Process -FilePath $code_path -ArgumentList "$location" #Open VSCode, and the new file we just created. 
    }
}

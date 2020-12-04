<#
Create a .PS1 template and open in visual studio code.
By: Alan Newingham
Date: 12/4/2020
Initial Commit: 12/4/2020
Git: 
Notes: Writing this as I am tired of manually doing this work for multiple scripts daily.
Site: https://automateanddeploy.com
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
        New-Item $location
        #Add data
        Add-Content -Path $location $data
        #Open Document in Visual Studio Code
        Start-Process -FilePath $code_path -ArgumentList "$location"
    }
}

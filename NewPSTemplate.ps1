<#
Create a .PS1 template and open in visual studio code.
By: Alan Newingham
Date: 10/9/2022
Initial Commit: 12/4/2020
Git: https://github.com/01000001-01001110/PowerShell-VSC-New-Script-Template/blob/main/NewPSTemplate.ps1
Notes: Writing this as I am tired of manually doing this work for multiple scripts daily.
- Make sure $location matches where you keep your repos
- Modifing the .ps1 file extension in the $location variable you can auto-create any number of different files with autopopulated data. 
Site: https://automateanddeploy.com
Example creates a "NewPowerShell-File.ps1" and opens VSCode with "NewPowerShell-File.ps1": 
Set-Template -Name NewPowerShell-File
Example creates a "PowerShellFile01" and opens VSCode with "PowerShellFile01.PS1" with -Author and -Note set as well. 
Set-Template -Name PowerShellFile01 -Title PowerShellFile01 -Author "Alan Newingham" -Note "This is a test of the script automation"
#>

function Set-Template
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name,
        [Parameter(Mandatory=$true)]
        [string] $Title,
        [Parameter(Mandatory=$true)]
        [string] $Author,
        [Parameter(Mandatory=$true)]
        [string] $Note
    )

    begin {
       Write-Host 'Calling Begin Block'
       Write-Host 'Setting Variable Information'
        $location = "C:\scripts\$Name.ps1"
        $code_path="${Env:LOCALAPPDATA}\Programs\Microsoft VS Code\Code.exe"
        $date = (get-date).ToString(‘M/d/y’)
        $path = "C:\scripts"
        $data = @"
<#
     Title: $Title
     By: $Author
     Date: $date
     Initial Commit: 
     Git: 
     File Name: $Name".ps1"
     Notes: $Note
     Site: https://automateanddeploy.com
#>

#Begin - Only things that happen once

begin
{

}

#Process - Do work

process
{
    try
    {

    } 
    catch 
    {

    }
}

#End - End Script

end
{

}



"@
    }
    
    process 
    {
        try 
        { 
            Write-Host "Calling Process Block"
            Write-Host "Logic Gets Computed Here"

            Write-Host "Verifying Staging Directory"
            #If directory is there cool, if not make it. 
            If(!(test-path $path)) 
                { 
                    Write-Host "The defined file path $path was not found. Creating the file path now."
                    New-Item -ItemType Directory -Path $path 
                }


            Write-Host "Creating the file with path: $location"
            #Create the document 
            New-Item $location # This creates a new 0kb file. 


            Write-Host "Add data to the file we created here: $location"
            #Add data
            Add-Content -Path $location $data # This adds the $data variable to the new file in $location we just created. 


            Write-Host "Open Visual Studio Code & the newly created PS1 file."
            #Open Document in Visual Studio Code
            Start-Process -FilePath $code_path -ArgumentList "$location" #Open VSCode, and the new file we just created. 
        }
        catch {
        Write-Host "An error occurred: " -NoNewLine
        Write-Host $_
        }
    }    
    
    end {
       Write-Host 'Calling End Block'

       Write-Host "Housekeeping, clearing variables."
       Clear-Variable -Name  "Title"
       Clear-Variable -Name  "Author"
       Clear-Variable -Name  "date"
       Clear-Variable -Name  "path"
       Clear-Variable -Name  "data"
       Clear-Variable -Name  "location"
       Clear-Variable -Name  "code_path"
       Clear-Variable -Name  "Note"
       return
    }

}

$location = Get-Location # get current location
$location # show as output 
Write-Output "hello!" # prompt "hello"
$Age = Read-Host -Prompt "Please enter your age" # variable
$Age # show output
New-Item -Path 'D:\temp\Test Folder' -ItemType Directory # create directory
New-Item -Path 'D:\temp\Test Folder\Test File.txt' -ItemType File # create file
Set-Content D:\temp\test\test.txt 'Hello' # set text
Add-Content D:\temp\test\test.txt 'World!' # add/append text
switch(3){
    1 {"One"}
    2 {"Two"}
    3 {"Three"; break }
    4 {"Four"}
    3 {"Three Again"}
} # switch statement

function Show-Menu
{
     param (
           [string]$Title = 'My Menu'
     )
     cls
     Write-Host "================ $Title ================"
    
     Write-Host "1: Press '1' for this option."
     Write-Host "2: Press '2' for this option."
     Write-Host "3: Press '3' for this option."
     Write-Host "q: Press 'q' to quit."
} # function to prompt the menu

Show-Menu –Title 'My Menu'
$selection = Read-Host "Please make a selection"
switch ($selection){
    '1' {
        'You chose option #1'
    } '2' {
        'You chose option #2'
    } '3' {
        'You chose option #3'
    } 'q' {
        return
    }
} # full menu program

write-output
write-warning
write-error




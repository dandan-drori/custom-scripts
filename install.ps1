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






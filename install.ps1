$project_name = Read-Host -Prompt "Project name" 

function C-Init
{
    New-Item -Path "$project_name" -ItemType Directory
    New-Item -Path "$project_name\main.c" -ItemType File 
    Add-Content $project_name\main.c '#include <stdio.h>' 
    Add-Content $project_name\main.c '#include "header.h"' 
    Add-Content $project_name\main.c '' 
    Add-Content $project_name\main.c 'int main() {' 
    Add-Content $project_name\main.c '' 
    Add-Content $project_name\main.c '  return 0;' 
    Add-Content $project_name\main.c '}' 
    $header_file_name = Read-Host -Prompt "Name of header file (without .h)" 
    New-Item -Path "$project_name\$header_file_name.h" -ItemType File
    Add-Content $project_name\$header_file_name.h '#ifndef HEADER_H'
    Add-Content $project_name\$header_file_name.h '#define HEADER_H'
    Add-Content $project_name\$header_file_name.h '#include <stdio.h>' 
    Add-Content $project_name\$header_file_name.h '' 
    Add-Content $project_name\$header_file_name.h '#endif // HEADER_H'
    $code_file_name = Read-Host -Prompt "Name of code file (without .c)" 
    New-Item -Path "$project_name\$code_file_name.c" -ItemType File
    Add-Content $project_name\$code_file_name.c '#include <stdio.h>'
    Add-Content $project_name\$code_file_name.c '#include "main.c"'
    Write-Output "Project created SUCCESSFULLY at $PWD/$project_name"
}

function Show-Menu
{
     param (
           [string]$Title = 'Choose a language'
     )
     Write-Output "================ $Title ================"
     Write-Output "1: c"
     Write-Output "2: c++"
     Write-Output "3: java"
     Write-Output "4: python"
     Write-Output "5: react"
     Write-Output "q: quit"
}

Show-Menu –Title 'Choose a language'
$selection = Read-Host "Choose a language"
switch ($selection){
    '1' {
        C-Init
        return
    } '2' {
        'You chose c++'
    } '3' {
        'You chose java'
    } '4' {
        'You chose python' 
    } '5' {
        'You chose react' 
    } 'q' {
        return
    } * {
        'Error: Please choose a number betweem 1-5' 
    }
} 




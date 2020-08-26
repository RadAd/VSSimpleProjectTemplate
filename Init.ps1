$project = $args[0]
$this = "Init.ps1"
if ($project -eq $null) {
    Write-Output "Init.ps1 [project]"
}
else {
    [string] $rootPathForFiles = "."
    [string[]] $listOfFilesToRename = Get-ChildItem -Path $rootPathForFiles -File
    $listOfFilesToRename | ForEach-Object {
        if ($_ -ne $this) {
            $oldContent = Get-Content -Path $_
            $newContent = $oldContent
            $newContent = $newContent -replace "\`$project", "$project"
            if ($newContent -ne $oldContent) {
                Write-Output "Replace content $_"
                $newContent | Set-Content -Path $_
            }

            $newName = $_
            $newName = $newName -replace "\`$project", "$project"
            #Write-Output "Rename-Item -Path $_ -NewName $newName"
            if ($newName -ne $_) {
                Write-Output "Rename $_ -> $newName"
                Rename-Item -Path $_ -NewName $newName
            }
        }
    }
    Remove-Item -Path $this
}

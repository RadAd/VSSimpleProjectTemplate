$project = "Foo"
[string] $rootPathForFiles = "."
[string[]] $listOfFilesToRename = Get-ChildItem -Path $rootPathForFiles -File
$listOfFilesToRename | ForEach-Object {
    if ($_ -ne "Init.ps1") {
        $oldContent = Get-Content -Path $_
        $newContent = $oldContent
        $newContent = $newContent -replace "`$project", "$project"
        if ($newContent -ne $oldContent) {
            $newContent | Set-Content -Path $_
        }

        $newName = $_
        $newName = $newName -replace "`$project", "$project"
        if ($newName -ne $_) {
            Rename-Item -Path $_ -NewName $newName
        }
    }
}

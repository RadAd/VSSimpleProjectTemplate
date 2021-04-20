$project = $args[0]
$this = "Init.ps1"
if ($project -eq $null) {
    Write-Output "Init.ps1 [project]"
}
else {
    [string] $rootPathForFiles = "."
    [string[]] $listOfFilesToRename = Get-ChildItem -Path $rootPathForFiles -File
    # [string] $guid1 = [GUID]::NewGUID().ToString('B')
    # [string] $guid2 = [GUID]::NewGUID().ToString('B')
    $listOfFilesToRename | ForEach-Object {
        if ($_ -ne $this) {
            $oldContent = Get-Content -Path $_
            $newContent = $oldContent
            $newContent = $newContent -replace "\`$project", $project
            # $newContent = $newContent -replace "{8BC9CEB8-8B4A-11D0-8D11-00A0C91BC942}", $guid1
            # $newContent = $newContent -replace "{B55B0C97-2A14-4076-9174-6A137134AF51}", $guid2
            if ($newContent -ne $oldContent) {
                Write-Output "Replace content $_"
                $newContent | Set-Content -Path $_
            }

            $newName = $_
            $newName = $newName -replace "\`$project", $project
            #Write-Output "Rename-Item -Path $_ -NewName $newName"
            if ($newName -ne $_) {
                Write-Output "Rename $_ -> $newName"
                Rename-Item -Path $_ -NewName $newName
            }
        }
    }
    Remove-Item -Path $this
}

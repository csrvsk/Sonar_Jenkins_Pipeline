$folders=Get-ChildItem -Name
$key="V12_"
foreach ($folder in $folders) {
$proname=$key+$folder
$contentToAdd = @"
sonar.projectKey=$proname
sonar.projectName=$proname
sonar.login=c1566905ddf4a26f5db614f4209262ed73367afb
sonar.sources=. 
sonar.java.binaries=.
sonar.inclusions=/$folder/**
"@
Set-Content ./sonar-project.properties $contentToAdd
$content = Get-Content sonar-project.properties
$content | Foreach {$_.TrimEnd()} | Set-Content sonar-project.properties
sonar-scanner
}
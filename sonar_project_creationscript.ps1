$folders=Get-ChildItem -Directory -Name
$key="V12_AP"
foreach ($folder in $folders) {
$proname=$key+$folder
$contentToAdd = @"
sonar.projectKey=$proname
sonar.projectName=$proname
sonar.login=c1566905ddf4a26f5db614f4209262ed73367afb
sonar.sources=. 
sonar.java.binaries=.
sonar.inclusions=/$folder/**
sonar.exclusions=Jenkins-sonar.groovy,sonar_project_creationscript.ps1,README.md,sonar-project.properties
"@
Set-Content ./sonar-project.properties $contentToAdd
$content = Get-Content sonar-project.properties
$content | Foreach {$_.TrimEnd()} | Set-Content sonar-project.properties
sonar-scanner
}

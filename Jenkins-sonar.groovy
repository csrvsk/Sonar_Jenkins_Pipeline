pipeline {
    agent {
	label "Node_machine"
}
	stages {
		stage("checkout"){
			steps{
				script{
					powershell 'Write-Output "Hello, World!"'
					//powershell 'svn checkout https://cmicsvn.cmic.ca/erp/R12/Development/Trunk/V12/AP . --username ShivaKumar.Vardhamaan@cmic.ca --password Shanmukh@2020'
					//powershell(returnStatus: true, script: 'sonar_project_creationscript.ps1') 
				}
			}
		}
		stage("Sonar"){
			steps{
				script{
					powershell 'Get-Childitem -Include .scannerwork -Recurse -force | Remove-Item -Force -Recurse'
					//powershell './sonar_project_creationscript.ps1' 
				}
			}
		}
	}
}

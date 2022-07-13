pipeline {
    agent {
	label "Node_machine"
}
	stages {
		stage("checkout"){
			steps{
				script{
					powershell 'svn checkout https://cmicsvn.cmic.ca/erp/R12/Development/Trunk/V12/AP --username ShivaKumar.Vardhamaan@cmic.ca --password Shanmukh@2020'
					//powershell(returnStatus: true, script: 'sonar_project_creationscript.ps1') 
				}
			}
		}
		stage("Sonar"){
			steps{
				script{
					powershell 'Write-Output "Hello, World!"'
					//powershell(returnStatus: true, script: 'sonar_project_creationscript.ps1') 
				}
			}
		}
	}
}

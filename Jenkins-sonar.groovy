pipeline {
    agent {
	label "Node_machine"
}
	stages {
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

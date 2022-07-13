pipeline {
    agent {
	label "Node_machine"
}
	stages {
		stage("Sonar"){
			steps{
				script{
					//powershell(returnStatus: true, script: 'sonar_project_creationscript.ps1') 
				}
			}
		}
	}
}

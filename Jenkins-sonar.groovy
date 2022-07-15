pipeline {
    agent {
	label "Node_machine"
}
	stages {
		stage("checkout"){
			steps{
				script{
					powershell 'svn checkout https://cmicsvn.cmic.ca/erp/R12/Development/Trunk/V12/AP . --username ShivaKumar.Vardhamaan@cmic.ca --password Shanmukh@2020'					 
				}
			}
		}
		stage("Sonar"){
			steps{
				script{
					powershell 'perl sonar_project_creation_in_perl.pl' 
				}
			}
		}
		
	}
}

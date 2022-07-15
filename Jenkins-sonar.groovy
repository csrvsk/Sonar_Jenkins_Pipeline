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
		stage("cleaning workspace"){
			steps{
				script{
					powershell 'Get-Childitem -Include .scannerwork -Recurse -force | Remove-Item -Force -Recurse'
					powershell 'Get-Childitem -Include .svn -Recurse -force | Remove-Item -Force -Recurse'
					powershell 'Get-Childitem -Include .git -Recurse -force | Remove-Item -Force -Recurse'
					powershell 'Get-Childitem -Include sonar-project.properties -Recurse -force | Remove-Item -Force -Recurse'
					powershell 'Get-Childitem -Include sonar_project_creationscript.ps1 -Recurse -force | Remove-Item -Force -Recurse'
					powershell 'Get-Childitem -Include Jenkins-sonar.groovy -Recurse -force | Remove-Item -Force -Recurse'
				}
			}
		}
	}
}

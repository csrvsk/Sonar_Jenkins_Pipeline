use warnings;
use strict;
use Cwd qw();
my $proname;
my $powershell = 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe';
my $path = Cwd::cwd();
my $rmcommand1= 'Get-Childitem -Include .scannerwork -Recurse -force | Remove-Item -Force -Recurse';
my $rmcommand2= 'Get-Childitem -Include .svn -Recurse -force | Remove-Item -Force -Recurse';
my $rmcommand3= 'Get-Childitem -Include .git -Recurse -force | Remove-Item -Force -Recurse';
`$powershell -command "$rmcommand1"`;
`$powershell -command "$rmcommand2"`;
`$powershell -command "$rmcommand3"`;
opendir my $dh, $path
	or die "$0: opendir: $!";
	
my @dirs = grep {-d "$path/$_" && ! /^\.{1,2}$/} readdir($dh);
my $name="V12_AP_";
foreach ( @dirs ) {
	$proname=$name.$_;
	my $file = "sonar-project.properties";
	unless(open FILE, '>'.$file) {
    		die "\nUnable to create $file\n";
	}
	print FILE "sonar.projectKey=$proname\nsonar.projectName=$proname\nsonar.sources=.\nsonar.java.binaries=.\nsonar.inclusions=/$_/**\nsonar.exclusions=Jenkins-sonar.groovy,sonar_project_creationscript.ps1,sonar_project_creation_in_perl.pl,README.md,sonar-project.properties\n";
	close FILE;
	my $commandin = 'sonar-scanner';
	my $result = `$powershell -command "$commandin"`;
	print "$result"
}

use warnings;
use strict;
use File::Path;
use Cwd qw();
my $proname;
my $path = Cwd::cwd();
rmtree ".svn";
rmtree  ".git";
rmtree ".scannerwork"
opendir my $dh, $path

my @dirs = grep {-d "$path/$_" && ! /^\.{1,2}$/} readdir($dh);
my $name="V12_AP_";
foreach ( @dirs ) {
	$proname=$name.$_;
	my $file = "sonar-project.properties";
	unless(open FILE, '>'.$file) {
    		die "\nUnable to create $file\n";
	}
	print FILE "sonar.projectKey=$proname\nsonar.projectName=$proname\nsonar.login=c1566905ddf4a26f5db614f4209262ed73367afb\nsonar.sources=.\nsonar.java.binaries=.\nsonar.inclusions=/$_/**\nsonar.exclusions=Jenkins-sonar.groovy,sonar_project_creationscript.ps1,sonar_project_creation_in_perl.pl,README.md,sonar-project.properties\n";
	close FILE;
	my $powershell = 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe';
	my $commandin = 'sonar-scanner';
	my $result = `$powershell -command "$commandin"`;
	print "$result"
}

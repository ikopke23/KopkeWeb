#!/usr/bin/perl  -w

use Getopt::Long;
my %opts;


GetOptions(\%opts, 'name|n=s');

if(exists $opts{"name"}){
	print($opts{"name"} . "\n");
} else {
	die "This progam is used\n\tperl new_route.pl -name INSERTNAME_HERE\n";
}


##########################################
#				Main Execution
##########################################

edit_pm_file();

create_routing_t();

##########################################
#				END Main Execution
##########################################

############### ADDING TO .PM #################

sub edit_pm_file () {
	chdir('./lib') or die "$!";
	
	my $filename = 'KopkeWeb.pm';
	open(my $fh, ">>$filename") or die "Could not open file $filename for appending: $!";
	
	my $str = 'get ' . "'/" . $opts{"name"} . '\' => sub {';
	my $str2 = "\ttemplate 'about' => { 'title' => 'Kopkeweb' }; ";
	my $str3 = "};";
	
	print $fh $str . "\n";
	print $fh $str2 . "\n";
	print $fh $str3 . "\n";
	
	close($fh);
	chdir('./..') or die "$!";
	#print "cwd()\n";
}

################ Adding Template Route ###

sub create_routing_t(){
		
	my $filename = './t/002_base.t';
	open(my $fh, "<$filename") or create_routing_manual();
	 
	my $line = $fh;
	
	$line =~ s/\//\/$opts{"name"}/ag;
	print($line);
	close($fh);

	my $num = get_route_num();

	open($fh, ">./t/00" . $num . "_" .$opts{"name"}.".t");
	print $fh $line;



}  # end create_routing_t

sub create_routing_manual(){

}

sub get_route_num(){
	return 5;
}

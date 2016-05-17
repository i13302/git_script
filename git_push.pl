#!/usr/bin/perl

$github_path="/home/Main/github/";

#=== exclusion ===#
@exclusion=(
#	["html","./tweet/main/user.php"],
#	["html","./streaming/main/user.php"],
#	["myscript","./rename_*.sh"],
#	["myscript","./git.pl"],
);
#=== exclusion ===#

chdir $github_path;
@file=glob "*";

foreach my $my_file (@file){
	if($my_file=~m/.+\..+/){
		next;	
	}elsif($my_file=~m/\./){
		next;
	}elsif($my_file=~m/\.\./){
		next;
	}

	chdir $my_file;
	print "NOW DIR : ".$my_file;
#	print "ARE YOU OK?:";
#	$que=<STDIN>;
	print "\n";


	#=== watch commit ===#
	my $git_log=`git log`;
	my @r_git_log=split(/\n/,$git_log);

	QUTESTION:
	{
		print $my_file;
		print @r_git_log[4]."\n";

		print "Do you exchange ? [YES/NO/END] :";
		$change=<STDIN>;
		chomp($change);
	}

	if($change eq "YES"){

		#===git add all file ===#
		system("git add -u *");

		#= option u =
		#for(my $i=0;$exclusion[$i][0];$i++){
		#	if($my_file eq $exclusion[$i][0]){
		#		$s=sprintf("git rm --cached %s",$exclusion[$i][1]);
		#		#print $s;
		#		system($s);
		#	}
		#}

	
		#=== new commit ===#	
		print "What sentence commit ? : ";
		$commit_sentence=<STDIN>;
		chomp($commit_sentence);
	
		$git_commit="git commit -m \'".$commit_sentence."\'";
		print $git_commit."\n";
		system($git_commit);
		
		#=== push ===#
		$git_push="git push -u ".$my_file." master";
		print $git_push."\n";
		system($git_push);
		
		print "\n";
		chdir "../";
	}elsif($change eq "END"){
		last;	
	}elsif($change eq "NO"){
		chdir "../";
		next;	
	}else{
		goto QUTESTION;	
	}
	

}

print "END\n";

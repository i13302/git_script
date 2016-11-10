#!/usr/bin/perl

#
# 1st argument is local path where you want to init .
# 2nd argument is remote path where you want to init . 
#
#my $init_Lpath="/mnt/c/Users/Takehara/Documents/kenkyu_Github/Server_Script";
#my $remote_path="";

my $init_Lpath=$ARGV[0];
chdir $init_Lpath;

my $remote_path=$ARGV[1];

if($init_Lpath eq ""){
	exit 1;
}elsif($remote_path eq ""){
	exit 2;
}

$USER="xxx";
$PASS="xxx";

#=== git init ===#
$git_init="git init";
#=== git init ===#

#=== git remote add ===#
$github_prev="://github";
$github_next=sprintf("://%s\:%s\@github",$USER,$PASS);
$remote_path=~s!$github_prev!$github_next!;
$dir_name=`pwd`;
$dir_name=~s!^.*/!!;
chomp($dir_name);

$git_remote_add=sprintf("git remote add %s %s",$dir_name,$remote_path);
#=== git remote add ===#

#=== git add * ===#
$git_add="git add *";
#=== git add * ===#

#=== git commit ===#
print "WHAT SENTENCE ?:";
$cmmt=<STDIN>;
chomp($cmmt);
$git_commit="git commit -m \"$cmmt\"";
#=== git commit ===#

#=== git push ===#
$git_push=sprintf("git push %s master",$dir_name);
#=== git push ===#

#=== Execute ===#
system($git_init);
system($git_remote_add);
system($git_add);
system($git_commit);
system($git_push);

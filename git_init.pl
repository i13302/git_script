#!/usr/bin/perl

#
# 1st argument is local path where you want to init .
# 2nd argument is remote path where you want to init . 
#

$init_Lpath=$ARGV[0];
chdir $init_Lpath;

$remote_path=$ARGV[1];

if($init_Lpath eq ''){
	exit;
}elsif($remote_path eq ''){
	exit;
}

$USER="i13302";
$PASS="f15c4f0768a6ddc603f9435a76ddb697f575213d";

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

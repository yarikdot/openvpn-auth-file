#!/usr/bin/env perl

use Apache::Htpasswd;

#
# Get username and password
#

my $username = $ENV{'username'};
my $password = $ENV{'password'};

if ($username eq "") { print 'Empty username'; exit(1); }

#
# Get password file and check it's existence
#

my $filename = $ARGV[0];
if (! -e $filename) { print 'File doesn\'t exist.'; exit(1); }

#
# Check if username matches the password
#

$file = new Apache::Htpasswd({passwdFile => $filename, ReadOnly => 1});
if ($file->htCheckPassword($username, $password) eq 1) { exit(0); }

#
# User not found
#
print 'User not found.'; exit(1);

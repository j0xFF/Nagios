#!/usr/bin/perl
my $receiver = '';
my $type = '';
my $host = '';
my $status = '';
my $ip = '';
my $message = '';
my $date = '';
my $smtp = '';

use Net::SMTP;
$receiver=$ARGV[0];
$type=$ARGV[1];
$host=$ARGV[2];
$status=$ARGV[3];
$ip=$ARGV[4];
$message=$ARGV[5];
$date=$ARGV[6];

$smtp= Net::SMTP->new('server.domain');
$smtp->auth('no-reply@domain', 'passwd');
$smtp->mail('no-reply@domain');
$smtp->to("$receiver");
$smtp->data();
$smtp->datasend("To: $receiver\n");
$smtp->datasend("Subject: NAGIOS - $type: $host , status $status\n");
$smtp->datasend("\n");
$smtp->datasend("Notification type: $type\n");
$smtp->datasend("Host: $host ($ip)\n");
$smtp->datasend("Current status: $status\n");
$smtp->datasend("Message body: $message\n");
$smtp->datasend("Date: $date\n");
$smtp->datasend();
$smtp->quit;

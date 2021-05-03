BEGIN {
count = 0;
Delay =0.0;
start_time=0;
}
{
if(start_time==0)
{ 
intial=$1
}
if($2 == "tx"){
start_time = $1;
}
if($2 == "rx") {
count = count +1 ;
end_time = $1;
Delay = Delay + (end_time - start_time);
}
}
END {
final = $1
print "Average End-to-End Delay = ", Delay/count;
print "Throughput in kbps = " , count*1024*8/((final-intial)*1024);
}

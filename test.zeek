global mycount=0;
global x : table[addr] of string;
global y :set[string];

event http_resquest(c: connection, version: string, code: count, reason: string)
{



}



event http_header(c: connection, is_orig: bool, name: string, value: string) 
{



}



event zeek_done()

{

    print x;
    print " is a proxy";

}

type UaMsg:record
{

    mycount:int;

    name:set[string];

};



global srcIP:table[addr] of UaMsg;


event http_header(c:connection,is_orig:bool,name:string,value:string)
{

    if (name=="USER-AGENT"){

        if (c$id$orig_h in srcIP){

            for (i,j in srcIP){

                if (value !in j$name){

                    add j$name[value];

                    ++srcIP[c$id$orig_h]$mycount;

                    if (srcIP[c$id$orig_h]$mycount==4){

                        print fmt("%s is proxy",c$id$orig_h);

                        break;

                    }

                }

            }

            

        }

        else {

            local x:UaMsg;

            x$mycount=1;

            add x$name[value];

            srcIP[c$id$orig_h]=x;

        }

        

    }

}



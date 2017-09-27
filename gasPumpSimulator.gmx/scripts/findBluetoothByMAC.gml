
inMAC = argument0;
numOFBLuetooth = instance_number(bluethoothDevice)

for(i = 0; i < numOFBLuetooth; i+=1)
{
    idd = instance_find(bluethoothDevice,i)
    with(idd)
    {
        distance = point_distance(global.playerX,global.playerY,x,y)
        dbmRange = distance/10;
        if(range == 1){dbmRange = distance/2;}
    }
    //show_message(string(inMAC)+":"+string(idd.idd ))
    if(idd.dbmRange < 100 && idd.idd == inMAC)
    {
        return idd;   
    }
   
}
return -1

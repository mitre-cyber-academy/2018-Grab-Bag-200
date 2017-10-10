
inMAC = argument0;

deviceType = bluethoothDevice
numOFBLuetooth = instance_number(deviceType)

for(i = 0; i < numOFBLuetooth; i+=1)
{
    idd = instance_find(deviceType,i)
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


deviceType = wifiDevice
numOFBLuetooth = instance_number(deviceType)

for(i = 0; i < numOFBLuetooth; i+=1)
{
    idd = instance_find(deviceType,i)
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

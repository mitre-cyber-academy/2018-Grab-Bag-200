var input = string_lower(argument0)
if( found("scan",input) == true )
{
    if( found("bluetooth",input) == true )
    {
        with(bluethoothDevice){alarm[0] = 10+round(random(120))}
        numOfDevicesAtTime = instance_number(bluethoothDevice)
        global.BTScancheck = 0;
        return
        ("Scanning for Bluetooth devices#----------------------------")
        
    }
    else if( found("wifi",input) == true )
    {
        return
        ("Scanning for WiFi devices")
    }  
    else
    {
         return
        ("usage: scan [bluetooth|wifi]")
    }  
}
else if( found("connect",input) == true )
{   
    input = string_replace_all(input,"connect","");
    input = string_replace_all(input," ","");
    input = string_replace_all(input,"$","");
    idd = findBluetoothByMAC(string_upper(input))
    
    if(idd != -1)
    {
        netread("connect/"+input);
        return("");
    }
    else
    {
        return("Unable To Connect To "+input);
    }
    
}
else if( found("time",input) == true )
{
    return(string(current_hour)+":"+string(current_minute)+":"+string(current_second))
}
else if( found("date",input) == true )
{
    return(string(current_month)+":"+string(current_day)+":"+string(current_year))
}
else
{
    return("command not found")
}

return("command not found")


yy = phoneScreenY+phoneScreenHeight
for(i = 1; i < ds_list_size(listOfCommands)+1; i+=1)
{
   if(yy > (phoneScreenY))
   {
       line = ds_list_find_value(listOfCommands,ds_list_size(listOfCommands)-i)
       yy = yy-string_height_ext(line,-1,phoneScreenWidth)
       draw_text_ext(phoneScreenX,yy,line,-1,phoneScreenWidth)
   }else{break;}
}

draw_set_color(c_lime)
draw_text_ext(phoneScreenX,phoneScreenY+phoneScreenHeight,keyboard_string,200,phoneScreenWidth)

if(keyboard_check_pressed(vk_up))
{
    keyboard_string = lastCommand;
}
if(keyboard_check_pressed(vk_down))
{
    keyboard_string = "";
}

if(keyboard_check(vk_lcontrol))
{ 
    if(keyboard_check_pressed(ord("V")) )
    {
        keyboard_string += clipboard_get_text();
    }
    if(keyboard_check_pressed(ord("C")) )
    {
        keyboard_string = "";
        connectedTo = -1; // discconect
    }
}


if(keyboard_check_pressed(vk_enter) )
{
    lastCommand = keyboard_string 
    ds_list_add(listOfCommands,keyboard_string)
    returnCommand = string(interpretCommad(string(keyboard_string)))
    ds_list_add(listOfCommands,returnCommand)
    keyboard_string = "";
}


if(connectedTo  == -1)
{
    if(keyboard_string == ""){keyboard_string = "$ "}   
}
else
{
    if(keyboard_string == "")
    {
        displayName = "ERROR";
        if(instance_exists(connectedTo)){displayName = connectedTo.name}
        keyboard_string = "@"+string(displayName)+"$"
    }   
    if(current_time-timeOut > 1000 )
    {
        if(instance_exists(connectedTo))
        {
            with(connectedTo)
            {
                distance = point_distance(global.playerX,global.playerY,x,y)
                dbmRange = distance/10;
                if(range == 1){dbmRange = distance/2;}
            }
            if(connectedTo.dbmRange > 100)
            {
                println("LOST CONNECTION TO "+string(connectedTo.name))
                keyboard_string = "";
                connectedTo = -1; // dissconnected
            }
        }
        timeOut = current_time;
    }
}












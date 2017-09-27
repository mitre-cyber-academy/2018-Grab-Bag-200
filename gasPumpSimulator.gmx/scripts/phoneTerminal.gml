
yy = phoneScreenY+phoneScreenHeight
for(i = 1; i < ds_list_size(listOfCommands)+1; i+=1)
{
   if(yy > (phoneScreenY))
   {
       line = ds_list_find_value(listOfCommands,ds_list_size(listOfCommands)-i)
       yy = yy-string_height_ext(line,-1,phoneScreenWidth)
       draw_text_ext(phoneScreenX,yy,line,-1,phoneScreenWidth)
   }
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
if(keyboard_check_pressed(vk_enter) )
{
    lastCommand = keyboard_string 
    ds_list_add(listOfCommands,keyboard_string)
    returnCommand = string(interpretCommad(string(keyboard_string)))
    ds_list_add(listOfCommands,returnCommand)
    keyboard_string = "$ ";
}
if(keyboard_string == ""){keyboard_string = "$ "}

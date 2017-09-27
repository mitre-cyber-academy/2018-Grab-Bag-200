/////draw apps
for(i = 0; i < sprite_get_number(spritePhoneIcons); i+=1 )
{
    draw_sprite(spritePhoneIcons,i,phoneX+57,phoneY+360+(i*50))
    if(mouse_check_button_pressed(mb_left) == 1)
    {
        if(mouse_pos(phoneX+57,phoneY+360+(i*50),phoneX+57+32,phoneY+360+32+(i*50)) == 1)
        {
            phoneApp = i+1
            keyboard_string = "";
        }
    }
}
/////draw clock 151 170
draw_set_font(largeFont)
draw_set_halign(fa_center)
draw_text(phoneX+160,phoneY+170,string(current_hour)+":"+string(current_minute)+":"+string(current_second) )
draw_set_halign(fa_left)
draw_set_font(normalFont)

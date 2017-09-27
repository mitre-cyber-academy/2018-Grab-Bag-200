
relativeMouseX = device_mouse_x_to_gui(0)
relativeMouseY = device_mouse_y_to_gui(0)

if(relativeMouseX > argument0)
{
    if(relativeMouseY > argument1)
    {
         if(relativeMouseX < argument2)
         {
            if(relativeMouseY < argument3)
            {
                return 1
            }         
         }
    }
}
return 0;

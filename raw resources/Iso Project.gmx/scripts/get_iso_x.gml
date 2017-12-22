//get_iso_x(x,y)
//gets the isometric coordinates of an orthographic point
var xx,yy,px,py;
xx=(x - room_width/2)/global.width_ortho 
yy=(y - room_height/2)/global.height_ortho

px=(xx-yy)*(global.width_iso/2) + room_width/2
py=(yy+xx)*(global.height_iso/2) + room_height/2

return px

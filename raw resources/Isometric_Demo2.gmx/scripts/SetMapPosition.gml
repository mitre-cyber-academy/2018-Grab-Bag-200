/// SetMapPosition(x,y,id)
var xx = argument0 >> 4;   // Get GRID coord 
var yy = argument1 >> 4;   // >>4 is divide by 16 and floor quickly

global.Map.Objects[# xx,yy] = argument2;

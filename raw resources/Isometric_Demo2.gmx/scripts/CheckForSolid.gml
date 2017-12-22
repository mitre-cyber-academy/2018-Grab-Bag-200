/// CheckForSolid(x,y)
var xx = argument0 >> 4;   // Get GRID coord 
var yy = argument1 >> 4;   // >>4 is divide by 16 and floor quickly

var m = global.Map.Map[0];
var c = m[# xx,yy]
if( c>=32 ) return c;
return global.Map.Objects[# xx,yy];

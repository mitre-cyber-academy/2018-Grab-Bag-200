/// DrawLevel()
var xx,yy,destx,desty, opx,opy,px,py,tile,o,sp, m,h,offy, tileset;


/// Draw the complete isometric level
tileset = global.tiles;


// End point in map drawing (map coordinates)
destx = MapX+MapDrawX;
desty = MapY+MapDrawY;

// Start drawing position - center in the middle of the screen - and just above a little
opx = surface_get_width(application_surface)/2;
opy = 150;

// X and Y loop to print all cells.
for( xx=destx-1;xx>=MapX;xx--)
{
    px = opx;
    py = opy;
    for( yy=MapY;yy<desty;yy++)
    {
        // First draw the column of tiles in this cell, bottom to top.
        offy=0;        
        for(var h=0;h<4;h++){
            m = Map[h];         // get 2D map grid from level array (Z axis)
            tile = m[# xx,yy];  // get tile from 2D grid (x,y axis)
            if( tile>=0 ){
                // if we have a tile, then draw it.
                draw_sprite(tileset,tile,px,py-offy);
            }
            offy+=27;
        }

        // Next, get the object in this cell, and draw it on top. 
        // If allowing height for the player, you'd need to add on 27 for each block up.
        o = Objects[# xx,yy];
        if( o!=0 ){
            // Get the object sprite to draw (could also do frames etc)
            sp=o.Sprite;

            // get a 0 to 1 value into the isometric cell.
            var dx = (1.0/15.0) * ((o.x&15));
            var dy = (1.0/15.0) * ((o.y&15));
            
            // Move to top left of Isometrix grid cell
            var ox = px - TileRowDX;
            var oy = py - TileRowDY;
            
            // Now convert into an isometric offset on X and Y
            ox = ox + (dy*TileRowDX);                   //Y axis first
            oy = oy + (dy*TileRowDY);
            ox = ox - (dx*TileColumnDX);                // now X axis
            oy = oy - (dx*TileColumnDY);
            
            // and draw this sprite
            draw_sprite(sp,0,ox,oy);
            
        }
                
        // Move down and right
        px += TileRowDX;      
        py += TileRowDY;    
    }
    // Back up to top, and move left and down.
    opx += TileColumnDX;
    opy += TileColumnDY;
}


// Create Map
var w,h,i,ids,xx,yy,uu,vv,m;

// Get the number of tiles on X and Y axis
w = room_width >> 4;
h = room_height >> 4;

// Create a single object layer
Objects = ds_grid_create(w,h);


// Now get all level tiles
var layer=0;
for(var level=100;level>=70;level-=10)
{
    // Get all tiles at the current level
    ids = tile_get_ids_at_depth(level);
    
    // Was there any?
    if( array_length_1d(ids)>0 )
    {
        // If so, create this layer, and wipe it
        Map[layer] = ds_grid_create(w,h);
        m = Map[layer];                         // get grid into a local - faster access quicker
        for(yy=0;yy<h;yy++){
            for(xx=0;xx<w;xx++){
                m[# xx,yy] = -1;                // use ds_grid accessors for much cleaner looking code
            }
        }
        
        // Now loop through all the tiles we got, and add them to our map
        for(i=0;i<array_length_1d(ids);i++){
            xx = tile_get_x(ids[i]) >> 4;       // tiles are 16x16 in size
            yy = tile_get_y(ids[i]) >> 4;       // >>4 is the same as floor(val/16), but much quicker
            uu = tile_get_left(ids[i]) >> 4;    // Get the pixel into the tile background, 
            vv = tile_get_top(ids[i])&$fffffff0;// and work out the X,Y tile index  (ANDing is like /16, floor then *16)
            tile = uu + vv;                     // work out the tile number (16 tiles per row)            
            m[# xx,yy] = tile;                  // Store tile
        }
    }
    layer++;                                    // Next layer in map storage
    tile_layer_hide(level);                     // Hide the tile level we just processed
}




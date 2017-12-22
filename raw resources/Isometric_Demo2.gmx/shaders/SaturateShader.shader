//
// Simple saturation vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
//  Simple saturation fragment shader
//
//  Uses the sprite ALPHA as a 0 to 1 saturation value, 0 being completely saturated, 1 being not at all.
//  This has the added bonus that if we don't have WebGL, then things "fade on" rather than flash on.
//  We then use the sprite colour as the saturation colour, allowing simple variations
//  Because this uses standard sprite data, we can set the shader once, and everything is still batched fully.
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    // Get the sprite pixel
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    
    // Now saturate with vertex colour, but using the sprite alpha (so it maintains the sprite shape)
    // Use the vertex ALPHA as the 0 to 1 saturate value
    gl_FragColor = mix( vec4(v_vColour.r, v_vColour.g, v_vColour.b, col.a), col, v_vColour.a);
}


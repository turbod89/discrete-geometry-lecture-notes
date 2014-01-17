#version 3.5;

#include "colors.inc"
#include "textures.inc"

global_settings {
  assumed_gamma 1.0
  max_trace_level 50
}

// ----------------------------------------


sky_sphere {
  pigment {
    gradient y
    color_map {
      [ (1-cos(radians(-30)))/2 color CornflowerBlue ]
      [ (1-cos(radians(160)))/2 color MidnightBlue ]
    }
    scale 2
    translate -1
  }
}



// first, the camera position
camera {
  //  orthographic
  location <-2.5,-2.5,5>
  sky <0,0,1>
  look_at <2,1,0.5>
}

// now, some light
light_source {
  <-20,-20,20>
  color rgb <1,1,1>
}

light_source {
  <0,0,20>
  color rgb <1,1,1>
}

// the spheres
#declare lightblue_sphere =
sphere {
  <0, 0, 0>, 0.70710678
  pigment {
    color rgbt<0,0,1,0.9>
  }
}

#macro colored_sphere(RA, R, G, B, T)
  sphere {
    <0,0,0>, RA
    pigment { color rgbt<R,G,B,T> }
  }
#end
    
#declare blue_sphere   = colored_sphere(0.433013, 0,0,1,0.7)
#declare yellow_sphere = colored_sphere(0.433012, 1,1,0,0.7)

#macro fcc (the_sphere)
  union {
    object { the_sphere translate<0,0,0> } 
    object { the_sphere translate<0,2,0> } 
    object { the_sphere translate<1,-1,0> } 
    object { the_sphere translate<1,1,0> } 
    object { the_sphere translate<1,3,0> } 
    object { the_sphere translate<2,0,0> } 
    object { the_sphere translate<2,2,0> } 
    object { the_sphere translate<3,-1,0> } 
    object { the_sphere translate<3,1,0> } 
    object { the_sphere translate<3,3,0> } 
    object { the_sphere translate<4,0,0> } 
    object { the_sphere translate<4,2,0> } 
    
    object { the_sphere translate<0,1,1> } 
    object { the_sphere translate<1,0,1> } 
    object { the_sphere translate<1,2,1> } 
    object { the_sphere translate<2,-1,1> } 
    object { the_sphere translate<2,1,1> } 
    object { the_sphere translate<2,3,1> } 
    object { the_sphere translate<3,0,1> } 
    object { the_sphere translate<3,2,1> } 
    object { the_sphere translate<4,1,1> } 
    
    object { the_sphere translate<0,0,2> } 
    object { the_sphere translate<0,2,2> } 
    object { the_sphere translate<1,-1,2> } 
    object { the_sphere translate<1,1,2> } 
    object { the_sphere translate<1,3,2> } 
    object { the_sphere translate<2,0,2> } 
    object { the_sphere translate<2,2,2> } 
    object { the_sphere translate<3,-1,2> } 
    object { the_sphere translate<3,1,2> } 
    object { the_sphere translate<3,3,2> } 
    object { the_sphere translate<4,0,2> } 
    object { the_sphere translate<4,2,2> } 
  }
#end

fcc(blue_sphere)
object {
  fcc(yellow_sphere) translate<0.5,0.5,0.5>
}
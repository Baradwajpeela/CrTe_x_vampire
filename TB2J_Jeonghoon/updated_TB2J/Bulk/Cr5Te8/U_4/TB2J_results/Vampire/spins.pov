//-------------------------------------------------------------------------
// Povray file generated using vampire
//-------------------------------------------------------------------------
#version 3.5;
#include "colors.inc"
#include "metals.inc"
#include "screen.inc"
//-----------------------------------------------------------------------------------
// Camera parameters
//-----------------------------------------------------------------------------------
#declare LX = 0; // camera looking position
#declare LY = 0;
#declare LZ = 0;
// camera location
#declare cam_theta  = 54.5326; // angle from z in degrees
#declare cam_phi    = 45; // angle from x in degrees
#declare cam_radius = 532.328; // distance from origin
#declare CX = cam_radius * cos(cam_phi*pi/180.0) * sin(cam_theta*pi/180.0);
#declare CY = cam_radius * sin(cam_phi*pi/180.0) * sin(cam_theta*pi/180.0);
#declare CZ = cam_radius * cos(cam_theta*pi/180.0);
Set_Camera(<CX,CY,CZ>, <LX,LY,LZ>, 15)
Set_Camera_Aspect(4,3)
Set_Camera_Sky(<0,0,1>)
//-----------------------------------------------------------------------------------
// Global constants and appearance
//-----------------------------------------------------------------------------------
global_settings { assumed_gamma 2.0 }
background { color Gray30 } // background  colour
light_source { <2*CX, 2*CY, 2*CZ> color White} // lights
#declare Initial_Frame = 0;
#declare Final_Frame = 99999999;

//------------------------------------------
// Global settings for appearance
//------------------------------------------

#declare ref = 0.05; // reflection level of objects
#declare dif = 1.0; // diffuse level of objects
#declare amb = 0.1; // ambient level of objects

// spin scale (default 2.0)
#declare global_spin_scale = true;
#declare sscale = 2.0;

// radius scale (default 1.2)
#declare global_radius_scale = true;
#declare rscale = 1.2;

// cube scale (default 1.2)
#declare global_cube_scale = true;
#declare cscale = 3.54;

// global objects
#declare global_cones   = false;
#declare global_arrows  = true;
#declare global_spheres = true;
#declare global_cubes   = false;

// non-magnetic element colours
#declare global_non_magnet_colour = true;
#declare nmcolour = pigment {color rgb < 0.2 0.2 0.2 >};

//-----------------------------------------------------------------------------------
// Colour macro
// The default is vdc generated and takes rgb values, but can be overridden to
// apply non-linear colour scales, colour maps etc.
//-----------------------------------------------------------------------------------
#macro spinrgb(sx, sy, sz, cr, cg, cb)
   pigment {color rgb <cr cg cb>}
#end

// alternative colour schemes
//#include "util/povray_colours/jet.inc"
//#include "util/povray_colours/purple_white.inc"
//#include "util/povray_colours/blue_gold.inc"
//#include "util/povray_colours/color_wheel.inc"

//-----------------------------------------------------------------------------------
// Material 1	Name: Cr	Element: Cr
//-----------------------------------------------------------------------------------
#if(global_spin_scale) #declare sscale1 = sscale;
#else #declare sscale1 = 2; #end
#if(global_radius_scale) #declare rscale1 = rscale;
#else #declare rscale1 = 1.2; #end
#if(global_cube_scale) #declare cscale1 = cscale;
#else #declare cscale1 = 3.54; #end
#if(global_cones)   #declare cones1 = global_cones;   #else #declare cones1 = false; #end
#if(global_cubes)   #declare arrows1 = global_arrows;  #else #declare arrows1 = true;  #end
#if(global_spheres) #declare spheres1 = global_spheres; #else #declare spheres1 = true;  #end
#if(global_cubes)   #declare cubes1 = global_cubes;   #else #declare cubes1 = false; #end
#declare spincolors1 = true; // enable colours defined in vdc
#declare spincolor1  = pigment {color rgb < 0.1 0.1 0.1 >};
//-------------------------------------
#macro spinm1(cx,cy,cz,sx,sy,sz, cr,cg,cb)
union{
   #if(spheres1) sphere {<cx,cy,cz>,0.5*rscale1} #end
   #if(cubes1) box {<cx-cscale1*0.5,cy-cscale1*0.5,cz-cscale1*0.5>,<cx+cscale1*0.5,cy+cscale1*0.5,cz+cscale1*0.5>} #end
   #if(cones1) cone {<cx+0.5*sx*sscale1,cy+0.5*sy*sscale1,cz+0.5*sz*sscale1>,0.0 <cx-0.5*sx*sscale1,cy-0.5*sy*sscale1,cz-0.5*sz*sscale1>,sscale1*0.5} #end
   #if(arrows1)
      cylinder {<cx+sx*0.5*sscale1,    cy+sy*0.5*sscale1,    cz+sz*0.5*sscale1>
                <cx-sx*0.5*sscale1,    cy-sy*0.5*sscale1,    cz-sz*0.5*sscale1>,sscale1*0.12}
      cone     {<cx+sx*0.5*1.6*sscale1,cy+sy*0.5*1.6*sscale1,cz+sz*0.5*1.6*sscale1>,sscale1*0.0
                <cx+sx*0.5*sscale1,    cy+sy*0.5*sscale1,    cz+sz*0.5*sscale1    >,sscale1*0.2}
   #end
   #if(spincolors1) texture { spinrgb(sx,sy,sz,cr,cg,cb) finish {reflection ref diffuse dif ambient amb } }
   #else texture { spincolor1 finish {reflection ref diffuse dif ambient amb }} #end
}
#end

//-----------------------------------------------------------------------------------
// Material 2	Name: Cr	Element: Cr
//-----------------------------------------------------------------------------------
#if(global_spin_scale) #declare sscale2 = sscale;
#else #declare sscale2 = 2; #end
#if(global_radius_scale) #declare rscale2 = rscale;
#else #declare rscale2 = 1.2; #end
#if(global_cube_scale) #declare cscale2 = cscale;
#else #declare cscale2 = 3.54; #end
#if(global_cones)   #declare cones2 = global_cones;   #else #declare cones2 = false; #end
#if(global_cubes)   #declare arrows2 = global_arrows;  #else #declare arrows2 = true;  #end
#if(global_spheres) #declare spheres2 = global_spheres; #else #declare spheres2 = true;  #end
#if(global_cubes)   #declare cubes2 = global_cubes;   #else #declare cubes2 = false; #end
#declare spincolors2 = true; // enable colours defined in vdc
#declare spincolor2  = pigment {color rgb < 0.1 0.1 0.1 >};
//-------------------------------------
#macro spinm2(cx,cy,cz,sx,sy,sz, cr,cg,cb)
union{
   #if(spheres2) sphere {<cx,cy,cz>,0.5*rscale2} #end
   #if(cubes2) box {<cx-cscale2*0.5,cy-cscale2*0.5,cz-cscale2*0.5>,<cx+cscale2*0.5,cy+cscale2*0.5,cz+cscale2*0.5>} #end
   #if(cones2) cone {<cx+0.5*sx*sscale2,cy+0.5*sy*sscale2,cz+0.5*sz*sscale2>,0.0 <cx-0.5*sx*sscale2,cy-0.5*sy*sscale2,cz-0.5*sz*sscale2>,sscale2*0.5} #end
   #if(arrows2)
      cylinder {<cx+sx*0.5*sscale2,    cy+sy*0.5*sscale2,    cz+sz*0.5*sscale2>
                <cx-sx*0.5*sscale2,    cy-sy*0.5*sscale2,    cz-sz*0.5*sscale2>,sscale2*0.12}
      cone     {<cx+sx*0.5*1.6*sscale2,cy+sy*0.5*1.6*sscale2,cz+sz*0.5*1.6*sscale2>,sscale2*0.0
                <cx+sx*0.5*sscale2,    cy+sy*0.5*sscale2,    cz+sz*0.5*sscale2    >,sscale2*0.2}
   #end
   #if(spincolors2) texture { spinrgb(sx,sy,sz,cr,cg,cb) finish {reflection ref diffuse dif ambient amb } }
   #else texture { spincolor2 finish {reflection ref diffuse dif ambient amb }} #end
}
#end

//-----------------------------------------------------------------------------------
// Material 3	Name: Cr	Element: Cr
//-----------------------------------------------------------------------------------
#if(global_spin_scale) #declare sscale3 = sscale;
#else #declare sscale3 = 2; #end
#if(global_radius_scale) #declare rscale3 = rscale;
#else #declare rscale3 = 1.2; #end
#if(global_cube_scale) #declare cscale3 = cscale;
#else #declare cscale3 = 3.54; #end
#if(global_cones)   #declare cones3 = global_cones;   #else #declare cones3 = false; #end
#if(global_cubes)   #declare arrows3 = global_arrows;  #else #declare arrows3 = true;  #end
#if(global_spheres) #declare spheres3 = global_spheres; #else #declare spheres3 = true;  #end
#if(global_cubes)   #declare cubes3 = global_cubes;   #else #declare cubes3 = false; #end
#declare spincolors3 = true; // enable colours defined in vdc
#declare spincolor3  = pigment {color rgb < 0.1 0.1 0.1 >};
//-------------------------------------
#macro spinm3(cx,cy,cz,sx,sy,sz, cr,cg,cb)
union{
   #if(spheres3) sphere {<cx,cy,cz>,0.5*rscale3} #end
   #if(cubes3) box {<cx-cscale3*0.5,cy-cscale3*0.5,cz-cscale3*0.5>,<cx+cscale3*0.5,cy+cscale3*0.5,cz+cscale3*0.5>} #end
   #if(cones3) cone {<cx+0.5*sx*sscale3,cy+0.5*sy*sscale3,cz+0.5*sz*sscale3>,0.0 <cx-0.5*sx*sscale3,cy-0.5*sy*sscale3,cz-0.5*sz*sscale3>,sscale3*0.5} #end
   #if(arrows3)
      cylinder {<cx+sx*0.5*sscale3,    cy+sy*0.5*sscale3,    cz+sz*0.5*sscale3>
                <cx-sx*0.5*sscale3,    cy-sy*0.5*sscale3,    cz-sz*0.5*sscale3>,sscale3*0.12}
      cone     {<cx+sx*0.5*1.6*sscale3,cy+sy*0.5*1.6*sscale3,cz+sz*0.5*1.6*sscale3>,sscale3*0.0
                <cx+sx*0.5*sscale3,    cy+sy*0.5*sscale3,    cz+sz*0.5*sscale3    >,sscale3*0.2}
   #end
   #if(spincolors3) texture { spinrgb(sx,sy,sz,cr,cg,cb) finish {reflection ref diffuse dif ambient amb } }
   #else texture { spincolor3 finish {reflection ref diffuse dif ambient amb }} #end
}
#end

//-----------------------------------------------------------------------------------
// Material 4	Name: Cr	Element: Cr
//-----------------------------------------------------------------------------------
#if(global_spin_scale) #declare sscale4 = sscale;
#else #declare sscale4 = 2; #end
#if(global_radius_scale) #declare rscale4 = rscale;
#else #declare rscale4 = 1.2; #end
#if(global_cube_scale) #declare cscale4 = cscale;
#else #declare cscale4 = 3.54; #end
#if(global_cones)   #declare cones4 = global_cones;   #else #declare cones4 = false; #end
#if(global_cubes)   #declare arrows4 = global_arrows;  #else #declare arrows4 = true;  #end
#if(global_spheres) #declare spheres4 = global_spheres; #else #declare spheres4 = true;  #end
#if(global_cubes)   #declare cubes4 = global_cubes;   #else #declare cubes4 = false; #end
#declare spincolors4 = true; // enable colours defined in vdc
#declare spincolor4  = pigment {color rgb < 0.1 0.1 0.1 >};
//-------------------------------------
#macro spinm4(cx,cy,cz,sx,sy,sz, cr,cg,cb)
union{
   #if(spheres4) sphere {<cx,cy,cz>,0.5*rscale4} #end
   #if(cubes4) box {<cx-cscale4*0.5,cy-cscale4*0.5,cz-cscale4*0.5>,<cx+cscale4*0.5,cy+cscale4*0.5,cz+cscale4*0.5>} #end
   #if(cones4) cone {<cx+0.5*sx*sscale4,cy+0.5*sy*sscale4,cz+0.5*sz*sscale4>,0.0 <cx-0.5*sx*sscale4,cy-0.5*sy*sscale4,cz-0.5*sz*sscale4>,sscale4*0.5} #end
   #if(arrows4)
      cylinder {<cx+sx*0.5*sscale4,    cy+sy*0.5*sscale4,    cz+sz*0.5*sscale4>
                <cx-sx*0.5*sscale4,    cy-sy*0.5*sscale4,    cz-sz*0.5*sscale4>,sscale4*0.12}
      cone     {<cx+sx*0.5*1.6*sscale4,cy+sy*0.5*1.6*sscale4,cz+sz*0.5*1.6*sscale4>,sscale4*0.0
                <cx+sx*0.5*sscale4,    cy+sy*0.5*sscale4,    cz+sz*0.5*sscale4    >,sscale4*0.2}
   #end
   #if(spincolors4) texture { spinrgb(sx,sy,sz,cr,cg,cb) finish {reflection ref diffuse dif ambient amb } }
   #else texture { spincolor4 finish {reflection ref diffuse dif ambient amb }} #end
}
#end

//-----------------------------------------------------------------------------------
// Material 5	Name: Cr	Element: Cr
//-----------------------------------------------------------------------------------
#if(global_spin_scale) #declare sscale5 = sscale;
#else #declare sscale5 = 2; #end
#if(global_radius_scale) #declare rscale5 = rscale;
#else #declare rscale5 = 1.2; #end
#if(global_cube_scale) #declare cscale5 = cscale;
#else #declare cscale5 = 3.54; #end
#if(global_cones)   #declare cones5 = global_cones;   #else #declare cones5 = false; #end
#if(global_cubes)   #declare arrows5 = global_arrows;  #else #declare arrows5 = true;  #end
#if(global_spheres) #declare spheres5 = global_spheres; #else #declare spheres5 = true;  #end
#if(global_cubes)   #declare cubes5 = global_cubes;   #else #declare cubes5 = false; #end
#declare spincolors5 = true; // enable colours defined in vdc
#declare spincolor5  = pigment {color rgb < 0.1 0.1 0.1 >};
//-------------------------------------
#macro spinm5(cx,cy,cz,sx,sy,sz, cr,cg,cb)
union{
   #if(spheres5) sphere {<cx,cy,cz>,0.5*rscale5} #end
   #if(cubes5) box {<cx-cscale5*0.5,cy-cscale5*0.5,cz-cscale5*0.5>,<cx+cscale5*0.5,cy+cscale5*0.5,cz+cscale5*0.5>} #end
   #if(cones5) cone {<cx+0.5*sx*sscale5,cy+0.5*sy*sscale5,cz+0.5*sz*sscale5>,0.0 <cx-0.5*sx*sscale5,cy-0.5*sy*sscale5,cz-0.5*sz*sscale5>,sscale5*0.5} #end
   #if(arrows5)
      cylinder {<cx+sx*0.5*sscale5,    cy+sy*0.5*sscale5,    cz+sz*0.5*sscale5>
                <cx-sx*0.5*sscale5,    cy-sy*0.5*sscale5,    cz-sz*0.5*sscale5>,sscale5*0.12}
      cone     {<cx+sx*0.5*1.6*sscale5,cy+sy*0.5*1.6*sscale5,cz+sz*0.5*1.6*sscale5>,sscale5*0.0
                <cx+sx*0.5*sscale5,    cy+sy*0.5*sscale5,    cz+sz*0.5*sscale5    >,sscale5*0.2}
   #end
   #if(spincolors5) texture { spinrgb(sx,sy,sz,cr,cg,cb) finish {reflection ref diffuse dif ambient amb } }
   #else texture { spincolor5 finish {reflection ref diffuse dif ambient amb }} #end
}
#end

//----------------------------------------------------------------
// Include spin and sticks data
//----------------------------------------------------------------
#include concat("spins-", str(frame_number, -8, 0) ".inc")

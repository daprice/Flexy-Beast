/**
 * Configuration settings for Flexy Beast, required to generate correctly sized STLs of the printed parts. See the Configuration File Assembly instructions to set this up.
 * @id config_file
 * @name Configuration File
 * @category Prerequisites!
 * @step Open config.scad in your favorite text editor.
 * @step As per the normal Cyborg Beast instructions, measure the width of the knuckles in the non-affected hand and convert to millimeters.
 * @step Add 5 to that result and then divide by 55.
 * @step Replace the x-, y-, and zScaleFactor variables in config.scad with that number.
 * @step If desired, adjust the proportions of the hand by changing those variables individually. xScaleFactor controls the width of the hand, yScaleFactor controls the length, and zScaleFactor controls the height.
 * @step Open assembly.scad in OpenSCAD to check that the flexy joint holes are not too large for the hand (should only be necessary for small children). If necessary, reduce the jointDia and jointThick variables. jointDia=5 and jointThick=2 is a good amount for smaller hands.
 * @step Set the fingerPads variable to true or false depending on whether you want to cast silicone finger pads for improved grip.
 * @step Open palm.scad, finger_base.scad, finger_tip.scad, and thumb_tip.scad in OpenSCAD, render each part (F6), and export as STL, then print. Suggested print settings are 0.2mm or smaller layer height, 3 perimeters, and 25% rectilinear or hexagonal infill.
 */

knuckleR = 4.85;
knucklePadding = 0.5;
knuckleW = 9.5;
wristH = 10;
palmH = 20;
palmW = 64;
th = 3;
fn = 32;

//flexy joint parameters
jointDia = 7;
jointThick = 4;

//finger settings
fingerPads = true; //whether or not to hollow the finger tips slightly for molding pads
fingerLength = 1; //multiply the length of all fingers by this amount
thumbProp = 0.8; //proportion of thumb length relative to other fingers (note that the thumb is a segment shorter than the other fingers already)
indexProp = 0.8; //proportion of index finger length relative to other fingers
middleProp = 1; //proportion of middle finger length relative to other fingers
ringProp = 0.8; //proportion of ring finger length relative to other fingers
pinkyProp = 0.7; //proportion of pinky finger length relative to other fingers

//misc settings
thermoform = true; //whether or not to generate a thermoformable mesh for the palm

//desired scale factor for hand based on the standard Cyborg Beast/Robohand sizing guide
xScaleFactor = 1.65; // [1.05:1.60]
yScaleFactor = 1.55; // [1.05:1.60]
zScaleFactor = 1.65; // [1.05:1.60]

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
 * @step In palm.scad, finger_base.scad, finger_tip.scad, and thumb_tip.scad, uncomment the first line that renders the part.
 * @step Render each part (F6) and export as STL, then print.
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

//finger pad settings
fingerPads = true; //whether or not to hollow the finger tips slightly for molding pads

//desired scale factor for hand based on the standard Cyborg Beast/Robohand sizing guide
xScaleFactor = 1.5; // [1.05:1.60]
yScaleFactor = 1.5; // [1.05:1.60]
zScaleFactor = 1.6; // [1.05:1.60]

include <config.scad>

use <parts/palm.scad>
use <parts/finger_base.scad>
use <parts/finger_mid.scad>
use <parts/finger_tip.scad>
use <parts/finger_tip_mold.scad>
use <parts/thumb_tip.scad>

handlayout();

/**
 * The Flexy Beast is a wrist-powered prosthetic hand for the e-NABLE Project. This is a mashup of the Parametric Cyborg Beast by MakerBlock and the Flexy Hand by Steve Wood/Gyrobot. Like the Flexy-Hand, the Flexy Beast uses flexible joints to replace the Chicago screws and elastics used on previous e-NABLE designs. This makes the hand lightweight, less expensive, better looking, more adaptable for smaller sizes, and easier to assemble and use.
 * @id assembly
 * @name Flexy Beast
 * @image assembly.png
 * @root
 * @assembled
 * @using config_file
 * @using 1 palm
 * @using 4 finger_assembly
 * @using 1 thumb_assembly
 * @step Print the palm, thumb base, thumb tip, and four each of the finger base and tip. These can be scaled as needed in each dimension using the x-, y-, and zScaleFactor variables in the OpenSCAD code.
 * @step Insert a string through each fingertip (the hole may need to be drilled slightly to deburr) and tie it off on the end. [[hand_assembly/Fingertip with string.jpg]]
 * @step After making the 3D printed parts and flexible joints, slide a flex joint into the proximal end of each finger. [[hand_assembly/Inserting joint.jpg]]
 * @step Use a flat screwdriver or other thin, flat tool to insert the other end of the joint into the corresponding slot on the next inner segment. [[hand_assembly/Inserting joint with screwdriver.jpg]]
 * @step Route the string through all the finger segments. [[hand_assembly/String routing.jpg]]
 * @step Route the string through the palm. [[hand_assembly/String routing through palm.jpg]]
 */

module handlayout(sp = 14)
	{
	cyborgbeastpalm();
	translate([20.5*xScaleFactor,33*yScaleFactor,7*zScaleFactor]) rotate([0,180,0]) 
		{
		translate([0*xScaleFactor,7.5*yScaleFactor,0]) fingerlayout(length=0);		//	Index finger
		translate([sp*xScaleFactor,7.5*yScaleFactor,0]) fingerlayout(length=7);	//	Middle finger
		translate([sp*2*xScaleFactor,7.5*yScaleFactor,0]) fingerlayout(length=5);	//	Ring finger
		translate([sp*3*xScaleFactor,7.5*yScaleFactor,0]) fingerlayout(length=-7.5);	//	Little finger
		}
	translate([36*xScaleFactor,-15.5*yScaleFactor,0.5*zScaleFactor]) rotate([50,-20,90]) 
		{
		thumbmid();	//	Thumb mid
		translate([0,-22*yScaleFactor,0*zScaleFactor]) rotate([0,0,-90]) thumbtip();	//	Thumb tip
		}
	translate([-100,0,0])
		if(fingerPads) fingertip_mold();
	}

module fingerlayout(length=0)
	{
	//rotate([180,-15,90]) translate([44,-8,-5]) fingertip_solid(pad=fingerPads);
	rotate([180,-10,90]) translate([15,-8,-10]) fingertip_curved_solid(pad=fingerPads);
	rotate([180,-5,90]) translate([-20,-8,-12]) fingerbase();
	}


module thumbmid()
	{
	rotate([0,0,-90]) fingerbase(); }

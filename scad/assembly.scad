include <config.scad>

include <parts/palm.scad>
include <parts/finger_base.scad>
include <parts/finger_mid.scad>
include <parts/finger_tip.scad>
include <parts/finger_tip_mold.scad>
include <parts/thumb_tip.scad>

handlayout();

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
	{ rotate([0,0,-90]) fingerbase(); }

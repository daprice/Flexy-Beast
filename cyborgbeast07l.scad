//	To Do
//	- Add in support structures
//	- Optimize for scaling 105% to 150%

knuckleR = 4.85;
knucklePadding = 0.5;
knuckleW = 9.5;
wristH = 10;
palmH = 20;
palmW = 64;
th = 3;
fn = 32;

//desired scale factor for hand based on the standard Cyborg Beast/Robohand sizing guide
xScaleFactor = 1.5; // [1.05:1.60]
yScaleFactor = 1.6; // [1.05:1.60]
zScaleFactor = 1.6; // [1.05:1.60]

//	Scaling from 105% up to 150%

//translate([0,0,0.02/2]) cube(0.02, center=true); //what is this doing here?

include <parts/cyborgpalm001.scad>
include <parts/flexyfinger_base.scad>
include <parts/flexyfinger_mid.scad>
include <parts/flexyfinger_tip.scad>

//	translate([30,0,0]) fingertipexamples(1);

handlayout();
//cyborgbeastpalm();

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
	}

module fingerlayout(length=0)
	{
	rotate([180,-15,90]) translate([44,-8,-5]) fingertip();
	rotate([180,-10,90]) translate([15,-8,-10]) fingermid();
	rotate([180,-5,90]) translate([-20,-8,-12]) fingerbase();
	}


module thumbmid()
	{ rotate([0,0,-90]) fingerbase(); }

module thumbtip()
	{
	//	difference() {
	fingertip(length=20);
	//	translate([20/2,0,0]) cube([20,70,50], center=true); }
	}

//	To Do
//	- Add in support structures
//	- Optimize for scaling 105% to 150%

knuckleR = 4.85;
knuckleW = 10;
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

//handlayout();
cyborgbeastpalm();

module handlayout(sp = 14.4)
	{
	cyborgbeastpalm();
	translate([22*xScaleFactor,39*yScaleFactor,7*zScaleFactor]) rotate([0,180,0]) 
		{
		translate([0*xScaleFactor,10*yScaleFactor,0]) render() fingerlayout(length=0);		//	Index finger
		translate([sp*xScaleFactor,12.5*yScaleFactor,0]) render() fingerlayout(length=7);	//	Middle finger
		translate([sp*2*xScaleFactor,12*yScaleFactor,0]) render() fingerlayout(length=5);	//	Ring finger
		translate([sp*3*xScaleFactor,7.5*yScaleFactor,0]) render() fingerlayout(length=-7.5);	//	Little finger
		}
	translate([41*xScaleFactor,-9.5*yScaleFactor,-4*zScaleFactor]) rotate([50,-20,90]) 
		{
		thumbmid();	//	Thumb mid
		translate([0,-18*yScaleFactor,5*zScaleFactor]) rotate([30,180,180]) thumbtip();	//	Thumb tip
		}
	}

module fingerlayout(length=0)
	{
*	translate([0,40+length*2/3,1.5]) rotate([10,0,0]) fingertip(len=length);
*	translate([0,23+length*2/3,1.5]) fingermid(len=length);
*	mirror([0,0,1]) mirror([0,1,0]) translate([0,0,-10]) fingerbase(len=length);
	}

*	translate([30,0,0]) fingermid(len=10);
*	translate([50,0,0]) fingermid(len=0);
*	translate([70,0,0]) fingermid(len=30);

module thumbmid()
	{ fingerbase(len=-12); }

module thumbtip()
	{
	//	difference() {
	fingertip(len=-5);
	//	translate([20/2,0,0]) cube([20,70,50], center=true); }
	}

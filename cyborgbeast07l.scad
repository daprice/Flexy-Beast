//	To Do
//	- Add in support structures
//	- Optimize for scaling 105% to 150%

knuckleR = 4.85;
wristH = 10;
palmH = 20;
palmW = 64;
th = 3;
fn = 32;

//desired scale factor for hand based on the standard Cyborg Beast/Robohand sizing guide
scaleFactor = 1.5; // [1.05:1.60]

//	Scaling from 105% up to 150%

//translate([0,0,0.02/2]) cube(0.02, center=true); //what is this doing here?

include <parts/cyborgpalm001.scad>
include <parts/cyborgfingertip002.scad>
include <parts/cyborgfingermid002.scad>

//	translate([30,0,0]) fingertipexamples(1);

handlayout();
//cyborgbeastpalm();

module handlayout(sp = 14.4)
	{
	cyborgbeastpalm();
	translate([22*scaleFactor,39*scaleFactor,7*scaleFactor]) rotate([0,180,0]) 
		{
		translate([0*scaleFactor,10*scaleFactor,0]) render() fingerlayout(length=0);		//	Index finger
		translate([sp*scaleFactor,12.5*scaleFactor,0]) render() fingerlayout(length=7);	//	Middle finger
		translate([sp*2*scaleFactor,12*scaleFactor,0]) render() fingerlayout(length=5);	//	Ring finger
		translate([sp*3*scaleFactor,7.5*scaleFactor,0]) render() fingerlayout(length=-7.5);	//	Little finger
		}
	translate([41*scaleFactor,-9.5*scaleFactor,-4*scaleFactor]) rotate([50,-20,90]) 
		{
		thumbmid();	//	Thumb mid
		translate([0,-18*scaleFactor,5*scaleFactor]) rotate([30,180,180]) thumbtip();	//	Thumb tip
		}
	}

module fingerlayout(size=1, length=0)
	{
*	translate([0,23+length*2/3,1.5]) rotate([10,0,0]) fingertip(s=size, grip=1, len=length);
	mirror([0,0,1]) mirror([0,1,0]) translate([0,0,-10]) fingermid(s=size, len=length);
	}

*	translate([30,0,0]) fingermid(len=10);
*	translate([50,0,0]) fingermid(len=0);
*	translate([70,0,0]) fingermid(len=30);

module thumbmid()
	{ fingermid(len=-12); }

module thumbtip()
	{
	//	difference() {
	fingertip(len=-5, grip=1);
	//	translate([20/2,0,0]) cube([20,70,50], center=true); }
	}

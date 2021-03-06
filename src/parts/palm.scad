include <../config.scad>
use <util/thermoform.scad>

cyborgbeastpalm();

/**
 * Palm - rendered from parts/palm.scad
 * @id palm
 * @name Palm
 * @category Printed
 */

module cyborgbeastpalm()
{
	difference()
		{
		scale([xScaleFactor,yScaleFactor,zScaleFactor])
		{
			difference()
			{
			cyborgbeast07palm();
			cyborgbeast07palminsidespace();
			//	Finger connectors
	//		for(i=[-3,-1,1,3]) translate([i*7,28,0]) cube([5,15,21.6], center=true);
			for(i=[-3,-1,1,3]) translate([i*7,28,0]) 
				{
				//cutouts for finger knuckles
				translate([0,4.5,0]) {
					cube([knuckleW + knucklePadding,10,21.6], center=true);
					rotate([-45,0,0]) cube([knuckleW+knucklePadding,14,21.6], center=true);
				}
				//channels for strings through knuckles
				translate([0,0.1,0.5]) rotate([90,0,0]) cylinder(r=1.25, h=5, $fn=fn/2);
				translate([0,-4.5,0]) rotate([30,0,i*-6]) cylinder(r=1.25, h=100, center=false, $fn=fn/2);
				render() difference()
					{
					hull() translate([0,-4.5,0]) 
						{
						rotate([30,0,i*-6]) cylinder(r=1.25, h=100, center=false, $fn=fn/2);
						rotate([0,0,0]) cylinder(r=1.25, h=100, center=false, $fn=fn/2);
						}
					translate([0,0,-100/2 + 10]) cube(100, center=true);
					}
				}
			//	Thumb connector
			translate([40,-13,6.5]) {
				//channel for string to thumb
				translate([0,5.5,-5]) rotate([0,90,40]) translate([0,0,-7.5]) cylinder(r=1.25*(1/yScaleFactor), h=5, $fn=fn/2);
				//thumb cutout
				rotate([-70,20,0]) 
					translate([11,4.1,0]) {
						cube([21.6,15,knuckleW + knucklePadding], center=true);
						rotate([0,0,-50]) cube([50,19.5,knuckleW + knucklePadding], center=true);
					}
			}
			//	Making sure the bottom is flat
			translate([0,0,-100/2]) cube(100, center=true);
			}
		}
		hardwarecutouts();
		}
	
	//the thermoform mesh
	if(thermoform) intersection() {
		scale([xScaleFactor+0.1,yScaleFactor+0.1,zScaleFactor+0.1])
			cyborgbeast07palminsidespace();
		translate([-35*xScaleFactor,-22*yScaleFactor,0]) thermoform_mesh(size=[70*xScaleFactor,50*yScaleFactor]);
	}
}	
	
module cyborgthumbsolid()
	{
	translate([-1.5,-2.4,0]) rotate([91,90,20]) knuckleblock();
	hull() 
		{
		translate([-20,0,5]) rotate([0,30,0]) scale([1,1,0.5]) sphere(r=9);
		hull() 
			{
			cylinder(r=4.5, h=14-1, center=true, $fn=fn*2);
			translate([-10,-1,0]) cylinder(r=4.5, h=12, center=true, $fn=fn*2);
			rotate([-10,0,0]) translate([-10,-6,-1]) 
				cylinder(r=4.5, h=11, center=true, $fn=fn*2);
			}
		hull() 
			{
		rotate([-20,0,0]) translate([-10,-8,-3]) cylinder(r=5, h=7, center=true, $fn=fn*2);
		rotate([-10,0,0]) translate([-10,-6,-1]) cylinder(r=4.5, h=9, center=true, $fn=fn*2);
		rotate([-20,0,0]) translate([-16,-10,-1]) cylinder(r=4.5, h=9, center=true, $fn=fn*2);
			}
		}
	}


module cyborgbeast07palminsidespace()
	{
	//	Cutouts through the top of the palm - cosmetic and to reduce plastic?
	for(i=[0,1]) 
		{
		mirror([i,0,0])
			{
			hull()
				{
				translate([13,13,0]) cylinder(r=3, h=100, center=true, $fn=fn/2);
				translate([10,5,0]) cylinder(r=2, h=100, center=true, $fn=fn/2);
				}
			hull()
				{
				translate([10,5,0]) cylinder(r=2, h=100, center=true, $fn=fn/2);
				translate([5,-5,0]) cylinder(r=1.5, h=100, center=true, $fn=fn/2);
				}
			}
		}
	//	
//	translate([40,-13,5]) rotate([-72,0,0]) 

	//	Cutout of area inside the palm
	hull()
		{
		//	Rectangular cutout
		translate([0,-3.5,0]) cube([48,40,20], center=true);
		//	Cutout of the rounded bits on either side of the user's knucles
		for(i=[-1,1]) translate([17*i,4,0]) cylinder(r=11, h=20, center=true);
		//	Organic-y bits inside the hand
		translate([0,4,15]) rotate([-10,0,0]) scale([1,1,0.3]) sphere(r=10);
		translate([14,4,15]) rotate([-10,10,0]) scale([1,1,0.3]) sphere(r=10);
		translate([-14,4,15]) rotate([-10,-10,0]) scale([1,1,0.3]) sphere(r=10);
		translate([0,-24,19]) rotate([-10,0,0]) scale([1,1,0.3]) sphere(r=20);
		}
	}


module hardwarecutouts()
	{
	//	Three holes for putting in velcro straps
		for (i=[-1,0,1]) translate([18*i*xScaleFactor,(pow(i,2)*-12 +3)*yScaleFactor,0]) 
			cylinder(r=4/2, h=100, center=true, $fn=fn/2);
	//	Knuckle block hinge - used to hold the stretchy joint in Flexy Beast
		for(i=[-3,-1,1,3]) translate([i*7*xScaleFactor,0,0])
			translate([0,24.75*yScaleFactor,6*zScaleFactor]) {
				rotate([0,90,0]) cylinder(d=jointDia, h=knuckleW*xScaleFactor + knucklePadding*yScaleFactor, center=true, $fn=fn/2);
				translate([0,25,0]) cube([knuckleW*xScaleFactor + knucklePadding*yScaleFactor,50,jointThick], center=true);
			}
	//	Wrist hinges
		translate([0,-27*yScaleFactor,5.5*zScaleFactor]) rotate([0,90,0]) cylinder(r=4/2, h=100, center=true, $fn=fn/2);
	//	Holes for tying the elastic cord at knuckles - not needed in Flexy Beast
	//	for (i=[-1,1]) translate([7.3*2*i,22,0]) for(i=[-1,1]) translate([2*i,0,0])
	//		cylinder(r=1.25, h=100, center=true, $fn=fn/4);
	//	Holes for the tendons on wrist
		translate([0,-10*yScaleFactor,(palmW/2-5)*zScaleFactor]) rotate([-4,0,0]) 
			{
		*	for(i=[-4,-2,0,2,4]) translate([i*2*xScaleFactor,0,(pow(i,2)*-0.05)*zScaleFactor  ]) rotate([90,0,i*-2]) 
				cylinder(r=1, h=100, center=true, $fn=fn/4);
			for(i=[-3,-1,1,3]) translate([i*2*xScaleFactor,0,(pow(i,2)*-0.05)*zScaleFactor  ]) rotate([90,0,i*-2]) 
				cylinder(r=1, h=100, center=true, $fn=fn/4);
			translate([5*2*xScaleFactor,0,(pow(5,2)*-0.05)*zScaleFactor  ]) rotate([90,0,5*-2]) 
				union() translate([0,0,10*zScaleFactor]) {
				cylinder(r=1, h=100, center=false, $fn=fn/4);
				rotate([0,120,-15]) cylinder(r=1, h=100, center=false, $fn=fn/4);
				sphere(1.25);
				}
			}
	//	Holes for thumb knuckle - used to hold the stretchy joint in Flexy Beast
		translate([40*xScaleFactor,-13*yScaleFactor,5*zScaleFactor]) {
			rotate([-70,20,0]) translate([-4.75,-0.5*yScaleFactor,0.7]) {
				cylinder(d=7, h=knuckleW*yScaleFactor + knucklePadding*yScaleFactor, center=true, $fn=fn/2);
				translate([25,0,0]) cube([50,jointThick,knuckleW*yScaleFactor + knucklePadding*yScaleFactor], center=true);
			}
		}
	//	Elastic return cutout - not needed in Flexy Beast
	//	translate([31,-13,16]) rotate([-72,0,0]) cylinder(r=3/2, h=40, center=true, $fn=fn/2);
	//	Thumb tendon channel
		translate([33*xScaleFactor,-13*yScaleFactor,5*zScaleFactor]) rotate([90-72,-90,-30]) 
			rotate([0,-20,-0]) rotate([10,90,0]) translate([0,0,-4.5*xScaleFactor]) 
				cylinder(r=1, h=100, center=false, $fn=fn/2);
	//	Thumb tendon channel
		translate([33*xScaleFactor,-13*yScaleFactor,5*zScaleFactor]) rotate([90-72,-90,-30]) 
			rotate([0,-20,-0]) rotate([10,90,0]) translate([0,0,5*zScaleFactor]) 
				cylinder(r1=1, r2=20, h=100, center=false, $fn=fn/2);
		
	}

module knuckleblock(width=4.8)
	{
*	difference()
		{
		hull() for(j=[-1,1]) for(i=[-1,1]) translate([width*i,0,2.5*j]) rotate([90,0,0]) 
			cylinder(r=1.5, h=10, center=true, $fn=fn/2);
		cube([5,11,5.5], center=true);
	*	translate([0,7.8,-2]) cube(9, center=true);
		}
	}

module cyborgbeast07palm()
	{
	//	Thumb!!!
	translate([40,-13,5]) rotate([-72,0,0]) cyborgthumbsolid();
	//	Knuckle Block
	for(i=[-3,-1,1,3]) translate([i*7,23.9,4+4]) knuckleblock(width=knuckleW/2);

	//	Palm
	hull() 
		{
		//	Organic forms for back of knuckles
			//	Near thumb
		translate([20.5,10,15.7]) rotate([-18,10,0]) scale([1,1,0.4]) sphere(10);
			//	Center of back of hand
		translate([0,11,18.1]) rotate([-23,0,0]) scale([1,1,0.2]) sphere(10);
			//	Near pinky
		translate([-20,10,14.5]) rotate([-18,-20,0]) scale([1,1,0.4]) sphere(10);
		//	Knuckles
		translate([0,27,knuckleR]) rotate([0,90,0]) 
			cylinder(r=knuckleR, h=55, center=true, $fn=fn);
		//	Palm
		translate([0,2,0]) scale([1,0.8,1]) cylinder(r=palmW/2-0.5, h=wristH/2, $fn=fn*2);	
		difference()
			{
			translate([0,-1,wristH-1]) rotate([-10,-5,0]) scale([1,0.8,0.3]) 
				sphere(r=palmW/2+1.25, $fn=fn*2);
			translate([0,0,-1000/2]) cube(1000, center=true);
			}
		//	Wrist
		for(i=[-1,1]) translate([26.6*i,-12,wristH/2]) cube([th,10,wristH], center=true); 
		//	Back of wrist
		translate([0,-18,0]) 
			{
			translate([0,0,17]) scale([1,1,0.4]) rotate([90,0,0]) 
				cylinder(r=palmW/2-6, h=th, center=true, $fn=fn); 
			rotate([90,0,0]) intersection() 
				{ 
				cylinder(r=palmW/2-4, h=th, center=true, $fn=fn); 
				translate([0,palmW,0]) cube(palmW*2, center=true); 
				}
			}
		//	Back of wrist, end of tendons
		translate([0,-19,26]) intersection() 
			{ 
			rotate([-20,0,0]) scale([0.5,0.3,0.1]) sphere(r=palmW/2-6); 
			}
		}


	//	Wrist hinge
	for(i=[-1,1]) 
		translate([26.6*i,-12,wristH/2]) { 
			cube([th,30,wristH], center=true); 
			translate([0,-30+wristH*1.5,0]) rotate([0,90,0]) 
				cylinder(r=wristH/2, h=th, center=true, $fn=fn);
			}
	}

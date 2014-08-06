include <../config.scad>

//rotate([0,-90,0]) fingerbase();

/**
 * @id finger_base
 * @name Finger Base
 * @category Printed
 */

//	Base segment of finger, can be lengthened
module fingerbase(length=23, proximalHole=true, distalHole=true)
{
	difference() {
		scale([yScaleFactor,xScaleFactor,zScaleFactor]) {
			fingerbasesolid(length);
		}
		if(proximalHole) {
			translate([0,knucklePadding/2 * xScaleFactor,0]) fingerhardwarecutouts(jointDia, jointThick, knuckleW=knuckleW-knucklePadding, fingerLen=length);
		}
		if (distalHole) {
			translate([length * yScaleFactor,0,0]) mirror([1,0,0]) fingerhardwarecutouts(jointDia, jointThick, knuckleW=knuckleW, fingerLen=length);
		}
	}


	
}

module fingerhardwarecutouts(jointDia,jointThick,knuckleW,fingerLen,holeCutoff=100) {
	//slot for flex joint
	translate([7 - (15/jointDia),0,6*zScaleFactor - (1.8/jointThick)]) {
		rotate([90,0,0]) translate([-0.25,0,-knuckleW*xScaleFactor]) cylinder(d=jointDia, h=knuckleW*xScaleFactor, $fn=50);
		translate([-25,(knuckleW*xScaleFactor) / 2,0]) cube([50,knuckleW*xScaleFactor,jointThick], center=true);
	}
	//cubic parts
	translate([-100,0,0]) cube([100,knuckleW*xScaleFactor,100]);
	translate([-5.5*yScaleFactor,0,0]) rotate([0,45,0]) translate([-50,0,0]) cube([100,knuckleW * xScaleFactor, 10]);

	//channel for string/tendon
	translate([-fingerLen/2 * yScaleFactor, knuckleW/2 * xScaleFactor, 2.3]) rotate([0,90,0]) cylinder(d=2.5, h=holeCutoff, $fn=50);
}

//	base segment of finger, solid
module fingerbasesolid(length=50, cutout=true) {
	difference() {
		//cubic part
		translate([0,0.001 + knucklePadding/2,1]) cube([length, knuckleW - knucklePadding - 0.002, 8]);
	}
	
	//cylindrical-ish part around finger
	intersection() {
		//overly large shape to get the cross section in the XZ plane from
		difference() {
			union() {
				translate([length-4,-5,5]) rotate([-90,0,0]) cylinder(r=8,h=knuckleW + 10);
				translate([0,-5,-5]) cube([length,knuckleW + 10,20]);
			}
			//cutout for the side "guards" of the previous knuckle
			if(cutout) {
				translate([-4,-knuckleW+0.001,5.3]) rotate([-90,0,0]) cylinder(r=11,h=10);
				translate([-4,knuckleW - knucklePadding*(1/xScaleFactor),5.3]) rotate([-90,0,0]) cylinder(r=11,h=10);
			}
		}

		hull() {
			for(i=[-1,1], j=[-1,1]) {
				//angled cylinders to provide the outer shape of the finger
				translate([length/10,i*2.4 + knuckleW/2,j*2.2 + 5]) rotate([i*j*-4,j*86,0]) cylinder(d=6,h=20,center=true);
				translate([length+4, i*2.4 + knuckleW/2, j*2.2 + 5]) rotate([i*j*-4,j*-86,0]) cylinder(d=6,h=20,center=true);
			}
		}
	}
}

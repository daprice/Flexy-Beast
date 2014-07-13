include <flexyfinger_base.scad>
module fingertip_solid(length=15, pad=true) {
	if (!pad)
		fingertip(length=length);
	else {
		difference() {
			fingertip(length=length);
			scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
				//cutout for molded silicone(?) piece
				translate([0,0,-24.7]) cube([100,100,50], center=true);
				translate([length+2,0,-30]) rotate([0,-45,0]) cube([100,100,50], center=true);
				//side cutouts
				translate([18,-knuckleW/4,-8]) rotate([90,0,0]) cylinder(d=30,h=10,center=true);
				translate([18,knuckleW + knuckleW/4,-8]) rotate([90,0,0]) cylinder(d=30,h=10,center=true);
				//notches to hold the silicone piece on
				translate([length+1,-knuckleW/5 + 5.5 - 50,5]) rotate([0,-30,0]) cube([100,100,1], center=true);
				translate([length+1,knuckleW + knuckleW/5 - 5.5 + 50,5]) rotate([0,-30,0]) cube([100,100,1], center=true);
			}
		}
	}
}

//	tip segment of finger, can be lengthened
module fingertip(length=15)
{
	intersection() {
		difference() {
			scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
				fingerbasesolid(length);
			}
			translate([0,knucklePadding/2 * yScaleFactor,0]) fingerhardwarecutouts(jointDia, jointThick, knuckleW=knuckleW-knucklePadding, fingerLen=length, holeCutoff=(length-0.5)*2);
			translate([(length - 5) * xScaleFactor,(knuckleW/2) * yScaleFactor,0])
				rotate([0,30,0]) translate([0,0,2]) cylinder(d=2.5, h=100, $fn=50);
		}
		translate([(length-10)*yScaleFactor,0,21*zScaleFactor]) rotate([-90,0,0]) cylinder(d=70, h=100, center=true);
	}
}

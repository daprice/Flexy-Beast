include <flexyfinger_base.scad>

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

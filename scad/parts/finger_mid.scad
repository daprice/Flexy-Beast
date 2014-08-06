include <../config.scad>
include <finger_base.scad>

//rotate([0,-90,0]) fingermid();

//	Middle segment of finger, can be lengthened
module fingermid(length=19, proximalHole=true, distalHole=true)
{
	difference() {
		scale([yScaleFactor,xScaleFactor,zScaleFactor]) {
			fingerbasesolid(length);
		}
		if(proximalHole) {
			translate([0,knucklePadding/2 * xScaleFactor,0]) fingerhardwarecutouts(jointDia, jointThick, knuckleW=knuckleW-knucklePadding, fingerLen=length);
		}
		if(distalHole) {
			translate([length * yScaleFactor,0,0]) mirror([1,0,0]) fingerhardwarecutouts(jointDia, jointThick, knuckleW=knuckleW, fingerLen=length);
		}
	}
}

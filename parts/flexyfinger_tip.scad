include <flexyfinger_base.scad>

//	tip segment of finger, can be lengthened
module fingertip(length=15)
{
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			fingerbasesolid(length);
		}
		translate([0,knucklePadding/2 * yScaleFactor,0]) fingerhardwarecutouts(jointDia=5, jointThick=2.2, knuckleW=knuckleW-knucklePadding, fingerLen=length);
	}
}

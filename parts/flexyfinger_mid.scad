include <flexyfinger_base.scad>

//	Middle segment of finger, can be lengthened
module fingermid(length=20)
{
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			fingerbasesolid(length);
		}
		translate([0,knucklePadding/2 * yScaleFactor,0]) fingerhardwarecutouts(jointDia=5, jointThick=2.2, knuckleW=knuckleW-knucklePadding);
		translate([length * xScaleFactor,0,0]) mirror([1,0,0]) fingerhardwarecutouts(jointDia=5, jointThick=2.2, knuckleW=knuckleW);
	}
}

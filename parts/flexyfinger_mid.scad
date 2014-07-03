include <flexyfinger_base.scad>

//	Middle segment of finger, can be lengthened
module fingermid(length=19)
{
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			fingerbasesolid(length);
		}
		translate([0,knucklePadding/2 * yScaleFactor,0]) fingerhardwarecutouts(jointDia=7.5, jointThick=4, knuckleW=knuckleW-knucklePadding, fingerLen=length);
		translate([length * xScaleFactor,0,0]) mirror([1,0,0]) fingerhardwarecutouts(jointDia=7.5, jointThick=4, knuckleW=knuckleW, fingerLen=length);
	}
}

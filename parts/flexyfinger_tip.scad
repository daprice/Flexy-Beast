include <flexyfinger_base.scad>
module fingertip_curved_solid(length=17, pad=true, hole=true) {
//	if (!pad)
//		fingertip(length=length);
//	else {
		render() difference() {
			union() {
				fingermid(length=length+3, proximalHole=true, distalHole=false);
				translate([length*yScaleFactor,0,1.5*zScaleFactor]) rotate([0,30,0]) fingertip(length=length, proximalHole=false, cutout=false);
			}
			//hole for string
			if(hole) translate([0,xScaleFactor * knuckleW/2,2]) rotate([0,90,0]) cylinder(d=2.5,h=100, $fn=50);
			//hollow for soft pad
			if(pad) translate([length*yScaleFactor,0,1.5*zScaleFactor]) rotate([0,30,0]) fingertip_pad(length);
		}
//	}
}

module fingertip_solid(length=15, pad=true) {
	if (!pad)
		fingertip(length=length);
	else {
		render() difference() {
			fingertip(length=length);
			if(pad) fingertip_pad(length);
		}
	}
}

module fingertip_pad(length) {
	difference() {
		fingertip(length,pad=false, proximalHole=false, cutout=false);
		translate([0,-10,-10]) cube([length-7,50,50]);
		translate([0,0.2*xScaleFactor,4.5]) cube([length+5,xScaleFactor * (knuckleW - knucklePadding),8]);
		translate([0,xScaleFactor * knuckleW/2,0]) {
			rotate([0,60,0]) cylinder(d=8, h=100);
		}
	}
}

//	tip segment of finger, can be lengthened
module fingertip(length=15, proximalHole=true, cutout=true)
{
	intersection() {
		difference() {
			scale([yScaleFactor,xScaleFactor,zScaleFactor]) {
				fingerbasesolid(length,cutout);
			}
			if(proximalHole) {
				translate([0,knucklePadding/2 * xScaleFactor,0]) fingerhardwarecutouts(jointDia, jointThick, knuckleW=knuckleW-knucklePadding, fingerLen=length, holeCutoff=(length-0.5)*2);
				translate([(length - 5) * yScaleFactor,(knuckleW/2) * xScaleFactor,0])
					rotate([0,30,0]) translate([0,0,2]) cylinder(d=2.5, h=100, $fn=50);
			}
		}
		translate([(length-10)*xScaleFactor,0,21*zScaleFactor]) rotate([-90,0,0]) cylinder(d=70, h=100, center=true);
	}
}

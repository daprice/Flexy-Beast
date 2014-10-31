include <../config.scad>
use <finger_base.scad>
use <finger_mid.scad>

rotate([0,-90,0]) fingertip_curved_solid(pad=fingerPads);

/**
 * Distal phalanx of fingers - rendered from parts/finger_tip.scad
 * @id finger_tip
 * @name Finger Tip
 * @category Printed
 */

module fingertip_curved_solid(length=17, pad=true, hole=true) {
//	if (!pad)
//		fingertip(length=length);
//	else {
		render() difference() {
			union() {
				fingermid(length=length+3, proximalHole=true, distalHole=false);
				translate([length*yScaleFactor - 0.5,0,1.6*zScaleFactor]) rotate([0,30,0]) fingertip(length=length, proximalHole=false, cutout=false);
			}
			//hole for string
			if(hole) translate([0,xScaleFactor * knuckleW/2,2]) rotate([0,90,0]) cylinder(d=2.5,h=100, $fn=50);
			//hollow for soft pad
			if(pad) translate([length*yScaleFactor - 0.5,0,1.6*zScaleFactor]) rotate([0,30,0]) fingertip_pad(length);
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
		assign($fn = 16) difference() {
			translate([0,0.2*xScaleFactor,3.2*zScaleFactor]) cube([length+(3.3*yScaleFactor),xScaleFactor * (knuckleW - knucklePadding),5.75*zScaleFactor]);
			//grooves for attachment of silicone pad:
			translate([(length+(3.3*yScaleFactor))/3*2, 0.2*xScaleFactor, 3.2*zScaleFactor]) cylinder(d=2.5*yScaleFactor,h=5.75*zScaleFactor);
			translate([(length+(3.3*yScaleFactor))/3*2, 0.2*xScaleFactor + (xScaleFactor * (knuckleW - knucklePadding)), 3.2*zScaleFactor]) cylinder(d=2.5*yScaleFactor,h=5.75*zScaleFactor);
			translate([(length+(3.3*yScaleFactor))/3*2, 0.2*xScaleFactor, 3.2*zScaleFactor]) rotate([-90,0,0]) cylinder(d=2*zScaleFactor,h=xScaleFactor * (knuckleW - knucklePadding));
			translate([(length+(3.3*yScaleFactor))/3*2, 0.2*xScaleFactor, 3.2*zScaleFactor + 5.75*zScaleFactor]) rotate([-90,0,0]) cylinder(d=1.25*zScaleFactor,h=xScaleFactor * (knuckleW - knucklePadding));
		}
		//"fingernail":
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

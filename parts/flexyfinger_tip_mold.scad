include <flexyfinger_base.scad>

module fingertip_mold(length=15) {
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			cube([knuckleW + knucklePadding + 10, 18, 20]);
		}
		scale([1.05,1.05,1.05]) translate([knuckleW + knucklePadding + 10,2,35]) rotate([0,80,90]) fingertip(length, proximalHole=false, cutout=false);
	}
}

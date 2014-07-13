include <flexyfinger_base.scad>

module fingertip_mold(length=15) {
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			cube([knuckleW + knucklePadding + 10, length + 10, 10]);
		}
		translate([knuckleW + knucklePadding + 10,0,17.2]) rotate([0,30,90]) fingertip(length, holes=false);
	}
}

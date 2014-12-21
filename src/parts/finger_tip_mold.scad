include <../config.scad>
use <util/finger_tip.scad>

fingertip_mold();

/**
 * Mold for casting silicone finger tip grip - rendered from parts/finger_tip_mold.scad
 * @id finger_tip_mold
 * @name Finger Tip Mold
 * @category Printed
 */

module fingertip_mold(length=15) {
	difference() {
		scale([xScaleFactor,zScaleFactor,yScaleFactor]) {
			cube([knuckleW + knucklePadding + 10, 18, 20]);
		}
		scale([1.05,1.05,1.05]) translate([knuckleW + knucklePadding + 10,2,35]) rotate([0,80,90]) fingertip(length, proximalHole=false, cutout=false);
	}
}

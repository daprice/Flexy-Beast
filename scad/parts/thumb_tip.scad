include <../config.scad>
use <finger_tip.scad>

rotate([0,-90,0]) thumbtip();

/**
 * Distal phalanx of thumb - rendered from parts/thumb_tip.scad
 * @id thumb_tip
 * @name Thumb Tip
 * @category Printed
 */

module thumbtip()
	{
	//	difference() {
	fingertip_solid(length=20, pad=fingerPads);
	//	translate([20/2,0,0]) cube([20,70,50], center=true); }
	}

include <../config.scad>
include <finger_tip.scad>

rotate([0,-90,0]) thumbtip();

module thumbtip()
	{
	//	difference() {
	fingertip_solid(length=20, pad=fingerPads);
	//	translate([20/2,0,0]) cube([20,70,50], center=true); }
	}

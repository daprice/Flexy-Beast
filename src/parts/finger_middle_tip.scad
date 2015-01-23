include <../config.scad>
use <util/finger_tip.scad>

rotate([0,-90,0]) fingertip_curved_solid(length = 17*middleProp*fingerLength, pad=fingerPads);

/**
 * Distal phalanx of middle finger - rendered from parts/finger_middle_tip.scad
 * @id middle_tip
 * @name Middle Finger Tip
 * @category Printed
 */
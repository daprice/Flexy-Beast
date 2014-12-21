include <../config.scad>
use <util/finger_tip.scad>

rotate([0,-90,0]) fingertip_curved_solid(length = 17*ringProp*fingerLength, pad=fingerPads);

/**
 * Distal phalanx of ring finger - rendered from parts/finger_ring_tip.scad
 * @id ring_tip
 * @name Ring Finger Tip
 * @category Printed
 */
include <../config.scad>
use <util/finger_tip.scad>

rotate([0,-90,0]) fingertip_curved_solid(length = 17*pinkyProp*fingerLength, pad=fingerPads);

/**
 * Distal phalanx of pinky finger - rendered from parts/finger_pinky_tip.scad
 * @id pinky_tip
 * @name Pinky Finger Tip
 * @category Printed
 */
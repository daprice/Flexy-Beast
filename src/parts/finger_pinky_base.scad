include <../config.scad>
use <util/finger_base.scad>

rotate([0,-90,0]) fingerbase(length = 20 * pinkyProp * fingerLength);

/**
 * Proximal phalanx for pinky finger - rendered from parts/finger_pinky_base.scad
 * @id pinky_base
 * @name Pinky Finger Base
 * @category Printed
 */
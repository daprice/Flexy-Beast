include <../config.scad>
use <util/finger_base.scad>

rotate([0,-90,0]) fingerbase(length = 20 * ringProp * fingerLength);

/**
 * Proximal phalanx for ring finger - rendered from parts/finger_ring_base.scad
 * @id ring_base
 * @name Ring Finger Base
 * @category Printed
 */
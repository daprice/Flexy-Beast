include <../config.scad>
use <util/finger_base.scad>

rotate([0,-90,0]) fingerbase(length = 20 * middleProp * fingerLength);

/**
 * Proximal phalanx for middle finger - rendered from parts/finger_middle_base.scad
 * @id middle_base
 * @name Middle Finger Base
 * @category Printed
 */
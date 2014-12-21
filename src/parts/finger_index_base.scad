include <../config.scad>
use <util/finger_base.scad>

rotate([0,-90,0]) fingerbase(length = 20 * indexProp * fingerLength);

/**
 * Proximal phalanx for index finger - rendered from parts/finger_index_base.scad
 * @id index_base
 * @name Index Finger Base
 * @category Printed
 */
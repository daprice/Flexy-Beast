include <../config.scad>
use <util/finger_base.scad>

rotate([0,-90,0]) fingerbase(length = 20 * thumbProp * fingerLength);

/**
 * Proximal phalanx for thumb - rendered from parts/thumb_base.scad
 * @id thumb_base
 * @name Thumb Base
 * @category Printed
 */
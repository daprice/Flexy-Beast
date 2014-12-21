include <../config.scad>
use <util/finger_tip.scad>

rotate([0,-90,0]) fingertip_curved_solid(length = 17*indexProp*fingerLength, pad=fingerPads);

/**
 * Distal phalanx of index finger - rendered from parts/finger_index_tip.scad
 * @id index_tip
 * @name Index Finger Tip
 * @category Printed
 */
include <../config.scad>

//generates a thermoformable mesh (intended for printing in PLA, then heating and fitting to a patient)
// at the desired size and thickness

module thermoform_mesh(size = [50,50], thickness = 3, hole_spacing = 1) {
	hole_size = [1.5, 5]; //dimensions of the holes in the mesh

	difference() {
		cube([size[0], size[1], thickness/2], center=false);
		translate([hole_size[0]/2 + hole_spacing, hole_size[1]/2 + hole_spacing, -thickness])
			for( x = [0 : size[0] / (hole_size[0]+hole_spacing) - 1], y = [0 : size[1] / (hole_size[1]+hole_spacing) - 1]) {
				translate([x * (hole_size[0] + hole_spacing), y * (hole_size[1] + hole_spacing), 0])
					resize([hole_size[0], hole_size[1], thickness*2]) cylinder(d=1,h=thickness,$fn=8);
			}
	}
}

include <../../config.scad>

//generates a thermoformable mesh (intended for printing in PLA, then heating and fitting to a patient)
// at the desired size and thickness

thermoform_mesh();

module thermoform_mesh(size = [50,50], thickness = 5, hole_spacing = 1.5) {
	hole_size = [1.75, 5.5]; //dimensions of the holes in the mesh

	difference() {
		cube([size[0], size[1], thickness/2], center=false);
		translate([hole_size[0]/2 + hole_spacing, hole_size[1]/2 + hole_spacing, -thickness])
			for( x = [-1 : size[0] / (hole_size[0]+hole_spacing) ], y = [-1 : size[1] / (hole_size[1]+hole_spacing) ]) {
				translate([x * (hole_size[0] + hole_spacing), y * (hole_size[1] + hole_spacing) + (x % 2) * (hole_size[1]/2), 0])
					resize([hole_size[0], hole_size[1], thickness*2]) cylinder(d=1,h=thickness,$fn=8);
			}
	}
}

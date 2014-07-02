//rotate([0,-90,0]) fingerbase();

//	Base segment of finger, can be lengthened
module fingerbase(length=26)
{
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			fingerbasesolid(length);
		}
		translate([0,knucklePadding/2 * yScaleFactor,0]) fingerhardwarecutouts(jointDia=7.5, jointThick=4, knuckleW=knuckleW-knucklePadding);
		translate([length * xScaleFactor,0,0]) mirror([1,0,0]) fingerhardwarecutouts(jointDia=5, jointThick=2.2, knuckleW=knuckleW);
	}


	
}

module fingerhardwarecutouts(jointDia,jointThick,knuckleW) {
	//slot for flex joint
	translate([6.3 - (15/jointDia),0,6*zScaleFactor - (1.8/jointThick)]) {
		rotate([90,0,0]) translate([0,0,-knuckleW*yScaleFactor]) cylinder(d=jointDia, h=knuckleW*yScaleFactor, $fn=50);
		translate([-25,(knuckleW*yScaleFactor) / 2,0]) cube([50,knuckleW*yScaleFactor,jointThick], center=true);
	}
	//cubic parts
	translate([-100,0,0]) cube([100,knuckleW*yScaleFactor,100]);
	translate([-5.5*xScaleFactor,0,0]) rotate([0,45,0]) translate([-50,0,0]) cube([100,knuckleW * yScaleFactor, 10]);
}

//	base segment of finger, solid
module fingerbasesolid(length=50) {
	difference() {
		//cubic part
		translate([0,0.001 + knucklePadding/2,1]) cube([length, knuckleW - knucklePadding - 0.002, 8]);
	}
	
	//cylindrical-ish part around finger
	intersection() {
		//overly large shape to get the cross section in the XZ plane from
		difference() {
			union() {
				translate([length-4,-5,5]) rotate([-90,0,0]) cylinder(r=8,h=knuckleW + 10);
				translate([0,-5,-5]) cube([length,knuckleW + 10,20]);
			}
			//cutout for the side "guards" of the previous knuckle
			translate([-4,-knuckleW+0.001,5.3]) rotate([-90,0,0]) cylinder(r=11,h=10);
			translate([-4,knuckleW - knucklePadding*(1/yScaleFactor),5.3]) rotate([-90,0,0]) cylinder(r=11,h=10);
		}

		hull() {
			for(i=[-1,1], j=[-1,1]) {
				//angled cylinders to provide the outer shape of the finger
				translate([length/10,i*2.4 + knuckleW/2,j*2.2 + 5]) rotate([i*j*-4,j*86,0]) cylinder(d=6,h=20,center=true);
				translate([length+4, i*2.4 + knuckleW/2, j*2.2 + 5]) rotate([i*j*-4,j*-86,0]) cylinder(d=6,h=20,center=true);
			}
		}
	}
}

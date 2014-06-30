knuckleW = 10;
knucklePadding = 0.75;
xScaleFactor = 1.5; // [1.05:1.60]
yScaleFactor = 1.6; // [1.05:1.60]
zScaleFactor = 1.6; // [1.05:1.60]

$fn=50;

fingerbase();

//	Base segment of finger, can be lengthened
module fingerbase(length=30)
{
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			fingerbasesolid(length);
		}
		translate([0,knucklePadding/2 * yScaleFactor,0]) hardwarecutouts(jointDia=7.5, jointThick=4, knuckleW=knuckleW-knucklePadding);
		translate([length * xScaleFactor,0,0]) mirror([1,0,0]) hardwarecutouts(jointDia=5, jointThick=2.2, knuckleW=knuckleW);
	}


	module hardwarecutouts(jointDia,jointThick,knuckleW) {
		//slot for flex joint
		translate([7 - (15/jointDia),0,6*zScaleFactor - (1.8/jointThick)]) {
			rotate([90,0,0]) translate([0,0,-knuckleW*yScaleFactor]) cylinder(d=jointDia, h=knuckleW*yScaleFactor);
			translate([-25,(knuckleW*yScaleFactor) / 2,0]) cube([50,knuckleW*yScaleFactor,jointThick], center=true);
		}
		//cubic parts
		translate([-100,0,0]) cube([100,knuckleW*yScaleFactor,100]);
		translate([-5*xScaleFactor,0,0]) rotate([0,45,0]) translate([-50,0,0]) cube([100,knuckleW * yScaleFactor, 10]);
	}
}

//	base segment of finger, solid
module fingerbasesolid(length=50) {
	difference() {
		//cubic part with slots for joints
		translate([0,0.001 + knucklePadding/2,0]) cube([length, knuckleW - knucklePadding - 0.002, 10]);
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
			translate([-4,-knuckleW + knucklePadding*(1/yScaleFactor),5.3]) rotate([-90,0,0]) cylinder(r=11,h=10);
			translate([-4,knuckleW - knucklePadding*(1/yScaleFactor),5.3]) rotate([-90,0,0]) cylinder(r=11,h=10);
		}

		hull() {
			for(i=[-1,1], j=[-1,1]) {
				translate([4,i*4 + knuckleW/2,j*4.2 + 5]) rotate([i*j*-8,j*85,0]) cylinder(d=4,h=20,center=true);
				translate([length, i*4 + knuckleW/2, j*4.2 + 5]) rotate([i*j*-8,j*-85,0]) cylinder(d=4,h=20,center=true);
			}
		}
	}
}

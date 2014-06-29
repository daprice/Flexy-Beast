//	Base segment of finger, can be lengthened
module fingerbase(len=0, rad=5)
{
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			fingerbasesolid(len=len, rad=rad);
		}
	}
}

//	base segment of finger, solid
module fingerbasesolid(len=0, rad=5) {
	
}

//	tip segment of finger, can be lengthened
module fingertip(len=0, rad=5)
{
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			fingertipsolid(len=len, rad=rad);
		}
	}
}

//	Middle segment of finger, solid
module fingertipsolid(len=0, rad=5) {
	
}

//	Middle segment of finger, can be lengthened
module fingermid(len=0, rad=5)
{
	difference() {
		scale([xScaleFactor,yScaleFactor,zScaleFactor]) {
			fingermidsolid(len=len, rad=rad);
		}
	}
}

//	Middle segment of finger, solid
module fingermidsolid(len=0, rad=5) {
	
}

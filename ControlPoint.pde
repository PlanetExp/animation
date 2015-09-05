// TODO:
// move contolpoints in here so they move with eachother

class ControlPoint extends Handler {
	float r;
	color c, sc;
	private boolean locked = false;
	private boolean overPoint = false;

	float maxRadius, minRadius;

	ControlPoint(float ix, float iy, float iradius, color icolor, color iselectcolor) {
		x = ix;
		y = iy;
		r = iradius;
		c = icolor;
		sc = iselectcolor;

		minRadius = r;
		maxRadius = r + 3;
	}

	ControlPoint(float ix, float iy, float iradius, color icolor, color iselectcolor, boolean igrid) {

		this(ix, iy, iradius, icolor, iselectcolor);
		onGrid = igrid;
	}

	@Override
	void run() {
		update();
		display();
	}

	@Override
	void update() {

	  	if ( over(mouseX, mouseY) ) {

		    overPoint = true;

		    if(!locked) { 

		    	stroke(255); 

		    	if (r < maxRadius) {
		    		r += sq(1.1); // grow
		    	}
		    	
		    }
		} else {

		    overPoint = false;

		    if ( r > minRadius) {
		    	r -= sq(1.1); // shrink
			    	
		    }
		}

	}

	@Override
	void display() {
		
		
		if (this.selected) {
			stroke(sc);
		} else {
			stroke(c);
		}

	    fill(c);
		ellipse(x, y, (r * 2), (r * 2) );
	}

	@Override
	boolean over(float ix, float iy) {
		if ( dist(x, y, ix, iy) < r ) {
			return true;
		} else {
			return false;
		}
	}


}
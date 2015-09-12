/*
 * KeyPoint model for storing x and y values in the avar
 *
 */
/* class KeyPoint {

	int ID; // unique id for this object

	float value, minValue, maxValue; // y-axis
	int frame; // x-axis

	float x, y, r;
	float minRadius, maxRadius;

	color c;
	color sc;

	private KeyPoint controlPoint = null;
	private KeyPoint keyPoint = null;

	private boolean locked = false;
	private boolean overPoint = false;

	// TODO:
	// when its continous two points will become one and you have to mirror the controlpoint

	KeyPoint(int iFrame, float iValue, float iradius, float iMinValue, float iMaxValue, color icolor) {

		x = iFrame * (width / frames.size()); // lock to frame
		y = iValue;
		r = iradius;

		c = icolor;

		minRadius = r;
		maxRadius = r + 3;		

		frame = iFrame;
		value = iValue;
		minValue = iMinValue;
		maxValue = iMaxValue;

		// TODO: create at default location offset from keyPoint
		controlPoint = new KeyPoint(frame, y - 50, 5, 0, 0, color(200, 50, 50) );
		controlPoint.setKeyPoint( this ); // create relation between these two


	}

	KeyPoint(int iFrame, float iValue) {

		// this(iFrame, iValue, 0, 0);
	}

	KeyPoint getControlPoint() {
		return controlPoint;
	}

	void setKeyPoint( KeyPoint k ) {
		keyPoint = k;
	}	

	void run() {
		update();
		display();
	}

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

	void display() {
		
		
		/* if (this.selected) {
			stroke(sc);
		} else {
			stroke(c);
		} */

	/*    fill(c);
		ellipse(x, y, (r * 2), (r * 2) );
	}

	boolean over(float ix, float iy) {
		if ( dist(x, y, ix, iy) < r ) {
			return true;
		} else {
			return false;
		}
	}	

 } */


class Point {

	int ID;
	float x, y;
	float r = 6; // default radius

	float value; // relative y-axis
	float relativex;
	int frame;

	AVar avar = null; //parent avar

	color c = color(255, 150, 0); //default color
	color sc;

	private boolean locked = false;
	private boolean overPoint = false;	

	float maxRadius, minRadius;	

	Point() {

	}

	Point(int iframe, float ivalue) {
		
		// where the actual point is on the screen
		x = iframe * (width / frames.size() );

		// relative y axis to avars zero
		value = ivalue;


	}

	Point(float ix, float iy, float iradius) {
		x = ix;
		y = iy;
		r = iradius;

		value = iy;

		minRadius = r;
		maxRadius = r + 3;		
	}

	void init() {
		y = value + avar.y + avar.HEIGHT; 

		println("y: "+y);
	}

	void setAVar( AVar a ) {
		avar = a;
	}

	void setColor(color ic) {
		c = ic;
	}

	void move() {

		// only move within avar grid

	}

	boolean overCircular(float ix, float iy) {
		if ( dist(x, y, ix, iy) < r ) {
			return true;
		} else {
			return false;
		}
	}		

	void run() {
		this.update();
		this.display();
	}

	void update() {

	  	if ( overCircular(mouseX, mouseY) ) {

		    overPoint = true;

		    if(!locked) { 

		    	// stroke(255); 

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

	void display() {

		// draw both controlpoint and keypoint
		// draw line between them

	    fill(c);
		ellipse(x, y, (r * 2), (r * 2) );

	}

}

class KeyPoint extends Point {

	KontrolPoint controlPoint = null;

	KeyPoint() {

	}

	KeyPoint(int iframe, float ivalue) {
		super(iframe, ivalue);
		createControlPoint();
	}

	KeyPoint(float ix, float iy, float iradius) {
		super(ix * (width / frames.size()), iy, iradius);
	}

	void createControlPoint() {
		controlPoint = new KontrolPoint( this );
		controlPoint.setColor(color(200, 50, 50)); //red
	}

	void setControlPoint(KontrolPoint c) {
		controlPoint = c;
	}

	KontrolPoint getControlPoint() {
		return controlPoint;
	}

	@Override
	void display() {

	    fill(c);
	    noStroke();
		ellipse(x, y, (r * 2), (r * 2) );

		println("r: "+r);

		if (controlPoint != null) {
			controlPoint.display();
		}

	}

}

class KontrolPoint extends Point {

	KeyPoint keyPoint = null;

	KontrolPoint(KeyPoint k) {

		super(k.x, k.y + 50, k.r - 1);
		keyPoint = k;
	}

	void setKeyPoint( KeyPoint k ) {
		keyPoint = k;
	}

	KeyPoint getKeyPoint() {
		return keyPoint;
	}

	@Override
	void display() {


		strokeWeight(3);
  		stroke(color(200, 50 , 50)); // red
		line(x, y, keyPoint.x, keyPoint.y);

		fill(c);
		ellipse(x, y, (r * 2), (r * 2) );

	}
}

class KeyPointView extends KeyPoint {

	KeyPointView() {

	}


	void run() {
		this.update();
		this.display();
	}

	void update() {

	}

	void display() {

		// draw both controlpoint and keypoint
		// draw line between them

	    fill(c);
		ellipse(x, y, (r * 2), (r * 2) );

	}

}
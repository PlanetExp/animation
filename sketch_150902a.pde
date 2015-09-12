

final color HANDLER_COLOR = color(255, 150, 0);
final color HANDLER_COLOR_SELECTED = color(255);
final float HANDLER_RADIUS = 6;	
final float CONTROLPOINT_RADIUS = 5;	

float xOffset = 0.0; 
float yOffset = 0.0;

float t;
boolean bounce = true;

float mouseDragX, mouseDragY;

ArrayList<Handler> handlers;
ArrayList<Handler> controlpoints;

Handler selectedHandler;

// cloud probably be hashmap
ArrayList<Frame> frames;

AVarView avar;
ArrayList<AVarView> avars;

void setup() {
  	size(500, 500);
  	smooth();

  	frameRate(60);

  	ellipseMode(CENTER);

  	frames = new ArrayList<Frame>();

  	// create 10 frames to start with
  	for (int i = 0; i < 10; i++) {

  		Frame f = new Frame();
  		frames.add(f);

  	}

  	handlers = new ArrayList<Handler>();
  	controlpoints = new ArrayList<Handler>();

  	ControlPoint p = new ControlPoint(300, 250, HANDLER_RADIUS, HANDLER_COLOR, HANDLER_COLOR_SELECTED, true);
  	ControlPoint p2 = new ControlPoint(200, 250, HANDLER_RADIUS, HANDLER_COLOR, HANDLER_COLOR_SELECTED, true);
  	ControlPoint c = new ControlPoint(300, 200, CONTROLPOINT_RADIUS, color(200, 50, 50), HANDLER_COLOR_SELECTED);
  	ControlPoint c2 = new ControlPoint(200, 200, CONTROLPOINT_RADIUS, color(200, 50, 50), HANDLER_COLOR_SELECTED);

  	ControlPoint point = new ControlPoint(300, 250, 3, 255, HANDLER_COLOR_SELECTED);

  	handlers.add(p);
  	handlers.add(p2);
  	controlpoints.add(c);
  	controlpoints.add(c2);

  	t = 0.0;


  	// setting up the first aVar
  	avar = new AVarView();

  	// keep a list of all avars
  	avars = new ArrayList<AVarView>();

}

void draw() {
  
	background(100);
  
  	avar.run();

	// code for displayng the top bar

	stroke(0);
	line(0, height/2, width, width/2);

	// array of aVars and display them stacked with handlers

	int padding = width / frames.size();

	// draw keyframe grid system
	for (int i = 0; i < frames.size()+1; i++) {

		textAlign(CENTER);
		text(i, padding * i, width/2 - 25); // display number of frame 
		line(padding * i, width/2 - 10, padding * i, width/2 + 10); // display line under number
	}


  	noFill();
  	strokeWeight(4);
  	stroke(color(0, 0, 200));
  	bezier(handlers.get(0).x, handlers.get(0).y, // start point
  		controlpoints.get(0).x, controlpoints.get(0).y, // control point 1
  		controlpoints.get(1).x, controlpoints.get(1).y, // control point 2
  		handlers.get(1).x, handlers.get(1).y); // end point

  	// lines between controlpoint and handler
  	strokeWeight(3);
  	stroke(color(200, 50 , 50));
  	line(handlers.get(0).x, handlers.get(0).y, controlpoints.get(0).x, controlpoints.get(0).y);
  	line(handlers.get(1).x, handlers.get(1).y, controlpoints.get(1).x, controlpoints.get(1).y);

  	// cycle through all entities on screen and update
  	strokeWeight(2);
  	for (Handler h : handlers) {
  		h.run();
  	}

  	for (Handler h : controlpoints) {
  		h.run();
  	}

  	if (t >= 1) {
  		bounce = false;
  	} else if (t <= 0) {
  		bounce = true;
  	}
  	
  	if (t < 1 && bounce ) {
  		t += 0.01;
  	} else {
  		t -= 0.01;
  	} 
  	



  	float px = (1-t)*(1-t)*(1-t) * handlers.get(0).x + 
  		3*t*(1-t)*(1-t) * controlpoints.get(0).x + 
  		3*t*t*(1-t)*controlpoints.get(1).x + 
  		t*t*t*handlers.get(1).x;
  	float py = (1-t)*(1-t)*(1-t) * handlers.get(0).y + 
  		3*t*(1-t)*(1-t) * controlpoints.get(0).y + 
  		3*t*t*(1-t)*controlpoints.get(1).y + 
  		t*t*t*handlers.get(1).y;

  	fill(255);
  	noStroke();
  	ellipse(px, py, 5, 5);

  	//nSystem.out.println("px: "+px);


  	text(frameCount, 50, 50);

  	text("avar: "+ nf(py, 1, 2), 50, py);
  
}

// x axis
// holds the information of the keyframes
class Frame {
	int frame;
	int count;

	void createFrame() {

		count++;


	}

}

// grid system of frames the screen will play forward
class Frames {

}

/*

// TODO: rename to ControlPoint
// class for the controlpoint of a keyPoint
class ControlPoint2 {

	private KeyPoint keyPoint = null;

	void setKeyPoint( KeyPoint k ) {
		keyPoint = k;
	}

}



/*
 * class for displaying the curve between control points
 */
class BezierCurve {

	float x, y, x1, y1, x2, y2, x3, y3;


	void display() {

	}

}







class Button {

}

class Slider {

}

class Animation {
	int frame;
	int fCount;

}



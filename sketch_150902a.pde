

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
}

void draw() {
  
	background(100);
  

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

// class for saving the y value of an object
class KeyPoint {
	int ID; // unique id for this object
	float value, minValue, maxValue; // y-axis
	int frame; // x-axis

	

	KeyPoint(int iFrame, float iValue, float iMinValue, float iMaxValue) {

		frame = iFrame;
		value = iValue;
		minValue = iMinValue;
		maxValue = iMaxValue;

	}

	KeyPoint(int iFrame, float iValue) {

		this(iFrame, iValue, 0, 0);
	}
}



// class for storing the KeyFrames in a list
// possibly a KeyPointController
class AVar {
	int ID; // unique id for this avar
	
	ArrayList<KeyPoint> keypoints; // keep a list of the keypoints in this aVar

	AVar() {

		keypoints = new ArrayList<KeyPoint>();
	}

	void createKeyPoint(int iFrame, float iValue, float iMinValue, float iMaxValue) {

		KeyPoint k = new KeyPoint(iFrame, iValue, iMinValue, iMaxValue);
		keypoints.add(k);

	}

	void deleteKeyPoint(KeyPoint k) {

		// TODO:
		// check if exists

		keypoints.remove(k);

	}



}

// class for the interface of the aVar
class AVarView {

	void run() {
		this.update();
		this.display();
	}

	void update() {

	}

	void display() {


		// rectangle with top and bottom bar
		// little bit lighter background

		fill(200); // light grey
		rect(0, 300, width, 100); // background

		// separate with line
		line(0, 300, width, 300);

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



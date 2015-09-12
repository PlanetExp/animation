/* class for the interface of the aVar
 *
 *
 */
class AVarView {

	AVarController controller = null; // viewer
	AVar avar = null; //model

	AVarView() {

		controller = new AVarController();
		controller.initAll( this );

		this.init();
	}

	void init() {

		// stack them
		
		avar.x = 0;
		avar.y = avar.num * avar.HEIGHT;

		avar.num++; // give it a number

	}

	int closestVertextToMouse() {
		return 0;
	}

	void setModel( AVar m ) {
        avar = m;
    }

    // helper function for getting the xy out of a keypoint in the list
    float getKeyPointValue(int keyPoint) {

    	// stub
    	return 0.0;
    }

	void run() {
		this.update();
		this.display();
	}

	void update() {

	}

	void display() {




		fill(200); // light grey
		rect(avar.x, avar.y, width, avar.HEIGHT); // background

		// separate with line
		stroke(0); // black
		strokeWeight(1);
		line(avar.x, avar.y + avar.HEIGHT, width, avar.y + avar.HEIGHT);

		noStroke();
		KeyPoint pk = null;
		for (KeyPoint k : avar.getKeyPoints()) {

			// fill(0);
			// ellipse(k.frame * (width / frames.size()), k.value, 10, 10);

			

			// BUG: draw the curve after the points

			// draw a curve beteeen each keyPoint

			/* if (pk != null) {
  				noFill();
  				strokeWeight(4);
				stroke(color(0, 0, 200));				
				bezier(k.x, k.y, k.getControlPoint().x, k.getControlPoint().y, pk.getControlPoint().x, pk.getControlPoint().y, pk.x, pk.y);
			}

			*/

			pk = k;

			k.run();
		}

	}
}
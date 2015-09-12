/**
 * Avar model
 * 
 */
class AVar {

	public int ID; // unique id for this avarController
	int num;

	private AVarView viewer 			= null;
	private AVarController controller 	= null;

	private float minValue = 0, maxValue;

	float x, y; // got its own grid system

	int WIDTH = 200;
	int HEIGHT = 100;
	
	ArrayList<KeyPoint> keypoints; // keep a list of the keypoints in this aVarController

	AVar() {

		keypoints = new ArrayList<KeyPoint>();

		ID++;

		// TODO: create default values (50% of max?)

		// always start with two keypoints at each end
		// this.createKeyPoint( 0, 300, 6, 0, 0, color(200, 150, 0) ); // first frame
		// this.createKeyPoint( 10, 300, 6, 0, 0, color(200, 150, 0) ); // last frame

		this.createKeyPoint(5);
		this.createKeyPoint(7);


	}

	/* Mutator, sets the controller
	 * @param c
	 * 
	 */
	void setController( AVarController c ) { 

		controller = c;

	}

	void setViewer( AVarView v ) {

		viewer = v;

	}

	void createKeyPoint(int iFrame) {

		KeyPoint k = new KeyPoint( iFrame, 0.0 );

		k.setAVar( this );
		keypoints.add( k );
		
		k.init();
	}

	void createKeyPoint(int iFrame, float iValue, float iRadius, float iMinValue, float iMaxValue, color iColor) {

		// KeyPoint k = new KeyPoint(iFrame, iValue, iRadius, iMinValue, iMaxValue, iColor);
		// keypoints.add( k );

	}

	void deleteKeyPoint(KeyPoint k) {

		// TODO:
		// check if exists

		keypoints.remove(k);

	}

	KeyPoint getKeyPoint(int id) {

		return keypoints.get(id);

	}

	int getKeyPointCount() {
		return keypoints.size();
	}

	ArrayList<KeyPoint> getKeyPoints() {

		return keypoints;

	}

	int getHeight() {
		return HEIGHT;
	}

}
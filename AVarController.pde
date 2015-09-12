/* AVar controller
 * class for storing the KeyFrames in a list
 * 
 */  
class AVarController {

	AVarView viewer = null; // viewer
	AVar avar = null; //model

	AVarController() {

		// keypoints = new ArrayList<KeyPoint>();

		// ID++;

	}

	void setViewer( AVarView v ) {
		viewer = v;
	}

	void setModel( AVar m ) {
		avar = m;
	}

	void initAll( AVarView v ) {
		viewer = v; // init viewer

		avar = new AVar(); // create model

		// create references
		avar.setController( this );
		viewer.setModel( avar );
		avar.setViewer( viewer );

		// setup the graph
	}
	
	// called by viewer when the mouse is over a given vertex.
	void setVertexUnderMouse( int vertex ) {

        // display vertex name
        // viewer.displayVertexName( vertex );
        // display adjacency list
        // viewer.displayAdjacencyList( vertex );

	}


}
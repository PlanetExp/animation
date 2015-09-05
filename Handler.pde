class Handler {
	float x, y;
	PVector loc;

	boolean selectible = true;
	boolean selected = false;

	boolean onGrid = false;

	boolean selected() {
		if (selectible && over(mouseX, mouseY)) {
			selected = true;
			return true;
		}

		selected = false;
		return false;
	}

	void run() {

	}

	void update() {

	}

	void display() {

	}

	boolean over(float ix, float iy) {
		
		if ( dist(x, y, ix, iy) < 5 ) {
			return true;
		} else {
			return false;
		}
	}

	boolean onGrid() {
		return onGrid;
	}	

}
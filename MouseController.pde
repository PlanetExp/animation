

void mousePressed() {
	mouseDragX = mouseDragY = 0;  // The drag starts here

	// select stuff
	boolean selection = false;

	for (Handler h : handlers) {
		if (h.selected()) {
			selectedHandler = h;
			selection = true;

			break;

		}
	}

	for (Handler h : controlpoints) {
		if (h.selected()) {
			selectedHandler = h;
			selection = true;

			break;

		}
	}	

	if (!selection && selectedHandler != null) {
		selectedHandler = null; // clear the selection
	}

}

void mouseDragged() {
	mouseDragX += (mouseX - pmouseX);
	mouseDragY += (mouseY - pmouseY);

	if (selectedHandler != null) {

		// TODO:
		// only move key on the frame grid

		if (selectedHandler.onGrid()) {

			// lock to grid

			float drag = ( mouseX - selectedHandler.x ) % ( width / frames.size() );

			// TODO:
			// make sure they don't move out of the borders

			if (drag > ( width / frames.size() / 2 ) ) {
				// println("positive");

				drag = 0;

				if ( selectedHandler.x >= width ) {

					selectedHandler.x = width;

				} else {
					selectedHandler.x += width / frames.size(); // move forward
				}
				
				

			} else if (drag < -1 * ( width / frames.size() / 2 ) ) {
				// println("negative");

				drag = 0;

				if ( selectedHandler.x <= 0 ) {
					
					selectedHandler.x = 0;

				} else {

					selectedHandler.x -= width / frames.size(); // move back

				}

			}

			// println("drag: "+drag);	
			// println("selectedHandler.x % width: "+selectedHandler.x % width);		

		} else {

			// smooth movement
			selectedHandler.x += (mouseX - selectedHandler.x);
    					
		}

		selectedHandler.y += (mouseY - selectedHandler.y);

	}
  	
}

void mouseReleased() {
  	// Don't need to really do anything, but at this point, 
  	// mouseDragX and mouseDragY should equal the
  	// total X and Y distances dragged.

} 
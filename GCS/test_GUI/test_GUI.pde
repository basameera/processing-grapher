/**
 * ControlP5 Canvas
 * The ControlWindowCanvas allow you to add custom graphics to 
 * the default controlP5 renderer or a controlWindow rednerer.
 *
 * find a list of public methods available for the Canvas Controller 
 * at the bottom of this sketch's source code
 *
 * by Andreas Schlegel, 2011
 * www.sojamo.de/libraries/controlp5
 * 
 */


import controlP5.*;

ControlP5 cp5;
Canvas cc;

PlotClass p1, p2;


// Runs 1
void setup() {

  size(1000, 800);
  frameRate(60);
  cp5 = new ControlP5(this);
  

  // create a control window canvas and add it to
  // the previously created control window.  
  //cc = new MyCanvas();
  //cc.pre(); // use cc.post(); to draw on top of existing controllers.
  //cp5.addCanvas(cc); // add the canvas to cp5
  
  p1 = new PlotClass("Plot 1", "time", "data", 10, 10, 400, 200);
  p1.pre(); // use cc.post(); to draw on top of existing controllers.
  cp5.addCanvas(p1);
  
  p2 = new PlotClass("Plot 2", "time", "data", 420, 10, 400, 200);
  p2.pre(); // use cc.post(); to draw on top of existing controllers.
  cp5.addCanvas(p2);
}

// runs 3
void draw() {

  background(0);

}

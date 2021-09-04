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

GUI_Element p1;

Plot LinePlot = new Plot(90, 50, 400, 200, 3);

float ydata;

// Runs 1
void setup() {
  surface.setTitle("Real-time plotter");
  size(1200, 1000);
  frameRate(30);
  cp5 = new ControlP5(this);

  p1 = new GUI_Element("GUI Element 1", "time", "data", 800, 10, 100, 150);
  p1.pre();
  cp5.addCanvas(p1);

  LinePlot.Title = "The title";
  LinePlot.xLabel = "Time (s)";
  LinePlot.yLabel = "kg";
  LinePlot.yMax=20; 
  LinePlot.yMin=-20;
  LinePlot.init();
  LinePlot.setColor(color(255, 0, 0), 0);
  LinePlot.setColor(color(0, 255, 0), 1);
  LinePlot.setColor(color(0, 255, 200), 2);

}

// runs 3
void draw() {

  background(0);
  
  ydata = sin(frameCount*0.1)*10;

  LinePlot.DrawAxis();
  LinePlot.push(ydata, 0);
  LinePlot.push(-ydata*1.6, 1);
  LinePlot.push(-15, 2);
  LinePlot.drawLine();

  textAlign(LEFT);
}

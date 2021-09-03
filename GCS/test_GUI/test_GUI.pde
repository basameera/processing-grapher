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

PlotElement p1;


/*
  Don't write everything from scratch. It's too much work.
 See if GraphClass match with my reqs.
 If not only add/edit those features.
 */

Graph LineGraph = new Graph(96, 70, 600, 200, color(20, 20, 200));

Plot LinePlot = new Plot(96, 400, 600, 200);

float ydata;

// these below should be inside the class
int number_of_lines_per_graph = 1;
float[][] lineGraphValues = new float[number_of_lines_per_graph][100];
float[] lineGraphSampleNumbers = new float[100];



// Runs 1
void setup() {
  surface.setTitle("Real-time plotter");
  size(1000, 800);
  frameRate(30);
  cp5 = new ControlP5(this);

  p1 = new PlotElement("Plot 1", "time", "data", 800, 10, 50, 50);
  p1.pre(); // use cc.post(); to draw on top of existing controllers.
  cp5.addCanvas(p1);

  LineGraph.xLabel=" Samples ";
  LineGraph.yLabel="Value";
  LineGraph.Title="Title";  
  LineGraph.xDiv=20;  
  LineGraph.xMax=0; 
  LineGraph.xMin=-100;  
  LineGraph.yMax=10; 
  LineGraph.yMin=-10;
  
  LinePlot.yMax=10; 
  LinePlot.yMin=-10;


  // *** NOTE: Put the below stuff inside inside class.
  // build x axis values for the line graph
  for (int i=0; i<lineGraphValues.length; i++) {
    for (int k=0; k<lineGraphValues[0].length; k++) {
      lineGraphValues[i][k] = 0;
      if (i==0)
        lineGraphSampleNumbers[k] = k;
    }
  }
}

int i=0;


// runs 3
void draw() {

  background(0);
  LineGraph.DrawAxis();
  LinePlot.DrawAxis();


  ydata = sin(frameCount*0.1)*10;
  

  // *** NOTE: Put the below stuff inside inside class.
  // update line graph
  try {
    if (i<lineGraphValues.length) {
      for (int k=0; k<lineGraphValues[i].length-1; k++) {
        lineGraphValues[i][k] = lineGraphValues[i][k+1];
      }

      lineGraphValues[i][lineGraphValues[i].length-1] = ydata;
    }
  }
  catch (Exception e) {
  }


  LineGraph.LineGraph(lineGraphSampleNumbers, lineGraphValues[0]);
  LinePlot.Line(lineGraphSampleNumbers, lineGraphValues[0]);

  textAlign(LEFT);
}

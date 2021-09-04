
/*   =================================================================================       
 The Plot class contains functions and variables that have been created to draw 
 Plots. Here is a quick list of functions within the Plot class:
 
 Plot(int x, int y, int w, int h,color k)
 DrawAxis()
 LinePlot([][]) 
 
 =================================================================================*/

/*
To Do
 * multi line
 * init inside
 
 */

/*
  Color schemes
 
 Dark theme
 -----------
 Background = grey
 outline (stroke) = white
 axis and fonts = white
 
 
 Light theme
 -----------
 Background = white
 outline (stroke) = black
 axis and fonts = black
 
 */

class Plot 
{

  int     xDiv=5, yDiv=11;            // Number of sub divisions
  int     xPos, yPos;            // location of the top left corner of the Plot  
  int     Width, Height;         // Width and height of the Plot

  boolean dark_theme = true;

  color   L_PlotColor = color(250, 20, 20);
  color   L_BackgroundColor = color(255);  
  color   L_StrokeColor = color(150);
  color   L_AxisColor = color(0);

  color   D_PlotColor = color(250, 100, 100);
  color   D_BackgroundColor = color(30);  
  color   D_StrokeColor = color(100);
  color   D_AxisColor = color(250);

  color   PlotColor;
  color   BackgroundColor;  
  color   StrokeColor;
  color   AxisColor;

  String  Title="PlotClass Title";
  String  xLabel="x - Label";
  String  yLabel="y - Label";

  float   yMax=20, yMin=-20;
  float   xMax=0, xMin=-10;

  // data 
  int n_lines = 2;
  int buff_size = 100;
  float[] XValues;
  float[][] YValues;
  color[] line_colors;

  // The main declaration function
  Plot(int x, int y, int w, int h, int _n_lines) {
    xPos = x;
    yPos = y;
    Width = w;
    Height = h;

    n_lines = _n_lines;

    XValues = new float[buff_size];
    YValues = new float[n_lines][buff_size];
    line_colors = new color[n_lines];

    if (dark_theme) {
      PlotColor = D_PlotColor;
      BackgroundColor = D_BackgroundColor;
      StrokeColor = D_StrokeColor;
      AxisColor = D_AxisColor;
    } else {
      PlotColor = L_PlotColor;
      BackgroundColor = L_BackgroundColor;
      StrokeColor = L_StrokeColor;
      AxisColor = L_AxisColor;
    }

    init();
  }

  void DrawAxis() {

    //=========================================================================================
    //Main axes Lines, Plot Labels, Plot Background
    //==========================================================================================

    // background
    fill(BackgroundColor); 
    color(0);
    stroke(StrokeColor);
    strokeWeight(1);
    int t = 60;

    // outline
    rect(xPos-t*1.3, yPos-t*0.7, Width+t*2, Height+t*1.5, 5);

    stroke(AxisColor);
    // title
    textAlign(CENTER);
    textSize(18);

    // Title
    fill(AxisColor);
    text(Title, xPos+Width/2, yPos-10);

    // x-axis Label 
    textAlign(CENTER);
    textSize(14);
    text(xLabel, xPos+Width/2, yPos+Height+t/1.7);                     

    // rotate -90 degrees
    rotate(-PI/2);
    // y-axis Label
    text(yLabel, -yPos-Height/2, xPos-t*1.6+45);
    // rotate back
    rotate(PI/2);

    //=========================================================================================
    // Axis lines
    //=========================================================================================
    textSize(10); 
    noFill(); 
    stroke(AxisColor); 
    smooth();
    strokeWeight(1);
    //Edges
    line(xPos-3, yPos+Height, xPos-3, yPos);                        // y-axis line 
    line(xPos-3, yPos+Height, xPos+Width+5, yPos+Height);           // x-axis line 
    stroke(StrokeColor);
    line(xPos-3, yPos, xPos+Width+5, yPos);           // x-axis line 

    //=========================================================================================
    // Zero line
    //=========================================================================================
    stroke(StrokeColor);
    if (yMin<0) {
      line(xPos-7, 
        yPos+Height-(abs(yMin)/(yMax-yMin))*Height, 
        xPos+Width, 
        yPos+Height-(abs(yMin)/(yMax-yMin))*Height
        );
    }

    //=========================================================================================
    //Sub-devisions for both axes, left and right
    //=========================================================================================

    stroke(AxisColor);
    textSize(10); 

    //=========================================================================================
    // x-axis sub divisions
    //=========================================================================================

    for (int x=0; x<=xDiv; x++) {
      line(float(x)/xDiv*Width+xPos, yPos+Height, float(x)/xDiv*Width+xPos, yPos+Height+5);     
      String xAxis=str(xMin+float(x)/xDiv*(xMax-xMin));
      String[] xAxisMS=split(xAxis, '.');
      text(xAxisMS[0]+"."+xAxisMS[1].charAt(0), float(x)/xDiv*Width+xPos, yPos+Height+15);
    }


    //=========================================================================================
    // y-axis
    //=========================================================================================
    textAlign(RIGHT);

    for (int y=0; y<=yDiv; y++) {
      line(xPos-3, float(y)/yDiv*Height+yPos, xPos-7, float(y)/yDiv*Height+yPos);
      String yAxis=str(yMin+float(y)/yDiv*(yMax-yMin));
      String[] yAxisMS=split(yAxis, '.');
      text(yAxisMS[0]+"."+yAxisMS[1].charAt(0), xPos-15, float(yDiv-y)/yDiv*Height+yPos+3);
    }
  }

  void init() {
    // initialize X, Y buffers
    for (int i=0; i<YValues.length; i++) {
      for (int k=0; k<YValues[0].length; k++) {
        YValues[i][k] = 0;
        if (i==0)
          XValues[k] = k;
      }
    }
  }

  void setColor(color val, int line) {
    line_colors[line] = val;
  }

  void push(float val, int line) {
    try {

      for (int k=0; k<YValues[line].length-1; k++) {
        YValues[line][k] = YValues[line][k+1];
      }

      YValues[line][YValues[line].length-1] = val;
    }
    catch (Exception e) {
    }
  }

  //=========================================================================================
  //Streight line Plot 
  //========================================================================================== 

  void Line(float[] x, float[] y) {
    for (int i=0; i<(x.length-1); i++) {
      strokeWeight(2);
      stroke(PlotColor);
      noFill();
      smooth();
      line(xPos+(x[i]-x[0])/(x[x.length-1]-x[0])*Width, 
        yPos+Height-(y[i]/(yMax-yMin)*Height)+(yMin)/(yMax-yMin)*Height, 
        xPos+(x[i+1]-x[0])/(x[x.length-1]-x[0])*Width, 
        yPos+Height-(y[i+1]/(yMax-yMin)*Height)+(yMin)/(yMax-yMin)*Height);
    }
  }

  void drawLine() {
    float[] x = XValues;
    for (int n=0; n<YValues.length; n++) {
      float[] y = YValues[n];
      PlotColor = line_colors[n];
      for (int i=0; i<(x.length-1); i++) {
        strokeWeight(1);
        stroke(PlotColor);
        noFill();
        smooth();
        line(xPos+(x[i]-x[0])/(x[x.length-1]-x[0])*Width, 
          yPos+Height-(y[i]/(yMax-yMin)*Height)+(yMin)/(yMax-yMin)*Height, 
          xPos+(x[i+1]-x[0])/(x[x.length-1]-x[0])*Width, 
          yPos+Height-(y[i+1]/(yMax-yMin)*Height)+(yMin)/(yMax-yMin)*Height);
      }
    }
  }
}

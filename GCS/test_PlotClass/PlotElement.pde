class GUI_Element extends Canvas {
  
  String _title = "Title";
  String _xlabel  = "time";
  String _ylabel = "Ax";
  
  int _px, _py;
  int _width = 200;
  int _height = 100;
  
  GUI_Element(String title, String xlabel, String ylabel, int x, int y, int w, int h){
    _title = title;
    _xlabel = xlabel;
    _ylabel = ylabel;
    _px = x;
    _py = y;
    _width = w;
    _height = h;
  }
  
  // auto runs 2 (once)
  public void setup(PGraphics pg) {
    
  }  

  //auto runs 4 (loop)
  public void update(PApplet p) {

  }
  
  // auto runs 5 (loop)
  public void draw(PGraphics pg) {
    // renders a square with randomly changing colors
    // make changes here.
    pg.fill(25); //change fill color
    pg.stroke(255); //change rect color
    pg.rect(_px, _py, _width, _height);
    pg.fill(255);
    pg.text(_title, _px+10, _py+20);
  }
}

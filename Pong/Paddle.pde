class Paddle {
  float _height = 15;
  float _width = 75;
  float xPosition = 0;
  float yPosition = 0;
  float padding = 20;
  float red;
  float green;
  float blue;
  String tag = "paddle";
  

  Paddle(float h, float w, float _xPosition, float _yPosition){
    _height = h;
    _width = w;
    xPosition = _xPosition;
    yPosition = _yPosition;
    red = random(100,200);
    green = random(100,200);
    blue = random(100,200);
  }
  
  void show(){
    fill(red,blue,green);
    rect(xPosition,yPosition,_width,_height);
      if(yPosition > height/2 || yPosition <= -height/2){
        yPosition = -yPosition;
      }
  }
  
  boolean collide(float x, float y){
    
    if(((x<= xPosition+_width)&&(x >= xPosition-_width)) && ((y <= yPosition+_height/2) && (y >= yPosition-_height/2))){
      return true;
    }
    return false;
  }
}

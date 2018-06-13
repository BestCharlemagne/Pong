class Ball{
 float radius = 10;
 float x = 0, y = 0;
 float xMove = 1, yMove = 1;
 float speed = 1;
 int start = 0;
 boolean xTrue = false, yTrue = false, check = true;
 Ball(float x, float y, float radius,float speed){
  if(radius !=0){
    this.radius = radius;
  }
  this.speed = speed;
  this.x = x;
  this.y = y;
 }
 
 void show(){
   fill(255);
   overlaps();
   x = x + xMove*(speed/2);
   y = y + yMove*speed;
  ellipse(x,y,radius,radius);

  if(speed <= 10){
    speed += .001;
  }
 }
 
 void overlaps(){
    
   if(check){
   for(Paddle paddle: paddles){
     if(paddle.collide(this.x,this.y)){
                xMove = -xMove;
         x = x + xMove*(speed/2);
         check = false;
       }
     }
   }
   if(millis() % 99 == 0){
     check = true;
   }
   if((this.y >= (height/2)) || (this.y <= -(height/2))) {
      yMove = -yMove;
   }
   if(this.x >= (width/2)){
     score1 += 1;
     reset();
   }
   else if(this.x <= (-width/2)){
    score2 += 1;
    reset();
   }

 }
 
 void reset(){
     this.x = 0;
     this.y = 0;
     check = true;
 }
}

float p1Pos = 0, p2Pos = 0;
float paddleWidth = 15;
float paddleHeight = 75;
float padding = 20;
boolean[] buttons = new boolean[4]; 
ArrayList<Paddle> paddles = new ArrayList();
ArrayList<Ball> balls = new ArrayList();
int score1 = 0;
int score2 = 0;
/*
HI Charlie!
<3
*/
void setup() {
  size(600, 500);
  for(int i =0; i<4;i++) {
    buttons[i] = false;
  }
  paddles.add(new Paddle(paddleHeight,paddleWidth,padding-width/2,0));
  paddles.add(new Paddle(paddleHeight,paddleWidth,-padding+width/2,0));
  balls.add(new Ball(0f,0f,0f,3));
  rectangles();
}

void draw() {
  rectangles();
  score();
}

void keyPressed() {
  if (key!=CODED) {
    if (key == 'w') {
      buttons[0] = true;

    }
    if (key == 's') {
      buttons[1] = true;

    }
  } else {
    if (keyCode == UP) {
      buttons[2] = true;

    }
    if (keyCode == DOWN) {
      buttons[3] = true;

    }
  }
}

void keyReleased(){
    if (key!=CODED) {
    if (key == 'w') {
      buttons[0] = false;
    }
    if (key == 's') {
      buttons[1] = false;
    }
  } else {
    if (keyCode == UP) {
      buttons[2] = false;
    }
    if (keyCode == DOWN) {
      buttons[3] = false;
    }
  }
}
void rectangles() {
  if(buttons[0] == true){
    paddles.get(0).yPosition -= 5;
    
  }
    if(buttons[1] == true){
      paddles.get(0).yPosition += 5;
    }
      if(buttons[2] == true){
        paddles.get(1).yPosition -= 5;
      }
        if(buttons[3] == true){
          paddles.get(1).yPosition += 5;
        }
  background(0);
  rectMode(CENTER);
  translate(width/2, height/2);
  for(Paddle current: paddles){
     current.show(); 
  }
  for(Ball ball: balls){
    ball.show();
  }
  

}

  void score(){
    textSize(32);
    textAlign(CENTER);
    text("Player 1" + "\n" + score1 , -100,-width/4);
    text("Player 2" + "\n" + score2, 100,-width/4);
    
       if(score1 >= 11){
             text("Player 1" + "\n" + "WINNER" , -100,-width/4);
             text("Player 2" + "\n" + "LOSER", 100,-width/4);
             for(Ball ball: balls){
               ball.speed = 0;
             }
       }
       else if(score2 >= 11){
             text("Player 1" + "\n" + "LOSER" , -100,-width/4);
             text("Player 2" + "\n" + "WINNER", 100,-width/4);
              for(Ball ball: balls){
               ball.speed = 0;
             }
       }

  }

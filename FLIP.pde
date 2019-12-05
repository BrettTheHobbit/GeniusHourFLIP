/*
Brett Hobbs
 Mr Parchimowicz
 ICS 3U1
 Basic platformer game :FLIP
 */

//variables (explanations are in initialize)
int gameState;


void setup() {
  size(500, 500);
  surface.setTitle("FLIP");
  surface.setResizable(true);
  rectMode(CENTER);
  initialize();
}

void draw() {
  if (gameState == 0) {//start screen
  //draw
    noStroke();
    background(0);
    scaledTextSize(100);
    fill(235);//(darker)
    scaledText("FLIP", 155, 150);//title 
    scaledRect(250, 250, 200, 100);//start button
    scaledRect(250, 400, 200, 100);//exit button
    fill(255);//(lighter)
    scaledText("FLIP", 157.5, 150);
    scaledRect(255, 250, 200, 100);
    scaledRect(255, 400, 200, 100);
    fill(0);
    scaledTextSize(75);
    scaledText("PLAY", 160, 275);
    scaledText("EXIT", 175, 425);
    //ifs
    if (mouseX > 150*width/500 && mouseX < 350*width/500 && mouseY > 200*height/500 && mouseY < 300*height/500) {// detection for top triangle
      fill(145);
      scaledText("PLAY", 160, 275);
      if (mousePressed) {
        gameState = 1;
        
      }
    }
    if (mouseX > 150*width/500 && mouseX < 350*width/500 && mouseY > 300*height/500 && mouseY < 500*height/500) {
      fill(145);
      scaledText("EXIT", 175, 425);
      if (mousePressed) {
        exit();
        
      }
    }
  } else if (gameState == 1) {
    background(0);
    
  }
}

//initailizes variables method
void initialize() {
  gameState = 0;
}

//screen expanding methods

void scaledRect(float x, float y, float w, float h) {//scales rects w/screen
  rect(x*width/500, y*height/500, w*width/500, h*height/500);
}

void scaledEllipse(float x, float y, float w, float h) {//scales ellipse w/screen
  ellipse(x, y, w, h);
}

void scaledText(String message, float x, float y) {//scales text w/screen
  text(message, x*width/500, y*height/500);
}

void scaledTextSize(float s) {//scales the text size w/sreen
  textSize(((s/2)*width/500) + ((s/2)*height/500));
}

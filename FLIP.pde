/*
Brett Hobbs
 Mr Parchimowicz
 ICS 3U1
 Basic platformer game :FLIP
 */

//variables (explanations are in initialize)
int gameState, floor, setDifference;
PVector playerPos, playerVel, playerAcc;
boolean jump, moveLeft, moveRight, falling;
wallObject testWall;

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
    if (mouseX > 150*width/500 && mouseX < 350*width/500 && mouseY > 350*height/500 && mouseY < 500*height/500) {
      fill(145);
      scaledText("EXIT", 175, 425);
      if (mousePressed) {
        exit();
      }
    }
  } else if (gameState == 1) {
    setDifference = mouseX - width/2;//allows rotation of the screen
    pushMatrix();
    background(0);
    translate(width/2, height/2);
    rotate(radians(setDifference));
    translate(-(width/2), -(height/2));
    updatePlayer();
    testWall.drawWall();
    testWall.detectWall();
    println(playerAcc.y);
    popMatrix();
  }
}

//initailizes variables method
void initialize() {
  gameState = 0;//game states
  playerPos = new PVector(250, 250);// player gravity/jumping
  playerVel = new PVector(0, 0);
  playerAcc = new PVector(0, 0.9);
  floor = 475;// stops player from falling under floor
  jump = true;// sets velocity to up
  falling = false;// checks if falling
  moveLeft = false;// limits movement to switches
  moveRight = false;
  setDifference = mouseX - width/2;//allows rotation of the screen
  initWallObjects();
}

void initWallObjects() {
  testWall = new wallObject(250, 400, 100, 50, "Normal");
}

// movement variables
void keyPressed() {
  if (keyCode == 37) {// left
    moveLeft = true;
  }
  if (keyCode == 38 && jump && !falling) {//up
  playerAcc.y = 0.9;
    jump = false;
  }
  if (keyCode == 39) {//right
    moveRight = true;
  }
}

void keyReleased() {
  if (keyCode == 37) {
    moveLeft = false;
  }
  if (keyCode == 39) {
    moveRight = false;
  }
}

void updatePlayer() {
  fill(252, 101, 0);//orange
  scaledEllipse(playerPos.x, playerPos.y, 50, 50);
  if (!jump) {
    playerVel.y = -15; 
    jump = true;
    falling = true;
  }
  if (moveLeft) {
    playerVel.x = -5;
  } else if (moveRight) {
    playerVel.x = 5;
  } else {
    playerVel.x = 0;
  }
  playerVel = playerVel.add(playerAcc);
  playerPos = playerPos.add(playerVel);
  //playerAcc.y = 0.9;

  if (playerPos.y >= floor) {
    playerPos.y = floor;
    jump = true;
    falling = false;
  }
  if (playerPos.x + 25 > width) {//right wall collision
    playerPos.x = width-25;
  }
  if (playerPos.x - 25 < 0) {//left wall collision
    playerPos.x = 25;
  }
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
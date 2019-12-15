public class wallObject {
  float xWall;
  float yWall;
  float wWall;
  float hWall;
  String wallType;

  wallObject(float wallX, float wallY, float wallW, float wallH, String typeWall) {
    xWall = wallX;
    yWall = wallY;
    wWall = wallW;
    hWall = wallH;
    wallType = typeWall;
  }

  void drawWall() {//draws the wall and details set differeces
    if (wallType == "Normal") { //♣▼∞½╔
      fill(200);
    }
    scaledRect(xWall, yWall, wWall, hWall);// actual rect
  }

  void detectWall() {//proper detection
    //dummy variables
    float topWall = yWall - (hWall/2);
    float bottomWall = yWall + (hWall/2);
    float leftWall = xWall - (wWall/2);
    float rightWall = xWall + (wWall/2);


    if (playerPos.y > topWall - 25 && playerPos.y < yWall && playerPos.x > leftWall && playerPos.x < rightWall) {// top detection
      playerPos.y = topWall - 25;
      playerVel.y = 0;
      playerAcc.y = 0;
      falling = false;
    } else if  (playerPos.x > rightWall || playerPos.x < leftWall) {
        playerAcc.y = 0.9;
    }
    if (playerPos.y < bottomWall && playerPos.y > yWall && playerPos.x > leftWall && playerPos.x < rightWall) {// bottom detection
      playerPos.y = bottomWall + 25;
      playerVel.y = 0;
      playerAcc.y = 0.9;
    } 
    if (playerPos.x > leftWall && playerPos.x < xWall && playerPos.y > topWall && playerPos.y < bottomWall) {//left detection
      playerPos.x = leftWall - 25;
      playerVel.x = 0;
      playerAcc.x = 0;
    } 
    if (playerPos.x < rightWall && playerPos.x > xWall && playerPos.y > topWall && playerPos.y < bottomWall) {// right detection
      playerPos.x = rightWall + 25;
      playerVel.x = 0;
      playerAcc.x = 0;
    }
  }
}
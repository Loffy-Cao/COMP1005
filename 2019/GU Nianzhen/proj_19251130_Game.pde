import ddf.minim.*;
Minim minim;
AudioPlayer player0;
AudioPlayer player1; 
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;

// Welcome Page
PImage bk;
PImage play;
PImage quitW;
int xCenterDisplay, yCenterDisplay; 
int r;
int m;
float angle;
float[] xDisplay = new float [3];
float[] yDisplay = new float [3];

// Teaching Page
PImage background;

// Game Page
PImage bg; // The background picture.
PImage restartLose; // The restart button when game lose.
PImage quitLose; // The quit button when game lose.
PImage restartWin; // The restart button when game win.
PImage quitWin; // The quit button when game win.
PImage rocketL;
PImage rocketR; // Two coming directions of enemies.
PImage[] barriers = new PImage [4]; // The four barriers.
PImage[] enemyLeft = new PImage [2];
PImage[] enemyDown = new PImage [2];
PImage[] enemyRight = new PImage [2];
PImage[] enemyUp = new PImage [2]; // Four coming directions of enemies.
float xCenter, yCenter; // The coordinates of center ellipse.
float angle1; // The velocity of side ellipse's rotation.
float angle2; // The speed of moving shooting direction arrow.
float radiusEllipse; // The distance between the center dots of center and side ellipse.
float vx, vy; // The speed of shooting ellipse.
float enemyW;
float enemyH; // The size of UFO.
float rocketLx;
float rocketLy;
float rocketRx;
float rocketRy; // The coordinates of two rockets.
float fastSpeed; // The speed of rocket.
float rocketW; 
float rocketH; //The size of rocket.
float [] x = new float [12];
float [] y = new float [12]; // Adding the ellipses.
float [] xShoot = new float [12];
float [] yShoot = new float [12]; // The coordinates of an ellipse when shooting.
float [] angle3 = new float [12]; // The angle when shooting the ellipses.
float[] beginxL = new float [2];
float[] beginyL = new float [2];
float[] beginxD = new float [2];
float[] beginyD = new float [2];
float[] beginxR = new float [2];
float[] beginyR = new float [2];
float[] beginxU = new float [2];
float[] beginyU = new float [2]; // The initial coordiantes of UFO.
float[] distxL = new float [2];
float[] distyL = new float [2];
float[] distxD = new float [2];
float[] distyD = new float [2];
float[] distxR = new float [2];
float[] distyR = new float [2];
float[] distxU = new float [2];
float[] distyU = new float [2]; // Distence = end - begin. 
float[] xL = new float [2];
float[] yL = new float [2];
float[] xD = new float [2];
float[] yD = new float [2];
float[] xR = new float [2];
float[] yR = new float [2];
float[] xU = new float [2];
float[] yU = new float [2]; // The current coordinates of UFO.
float[] xSmall = new float[8];
float[] ySmall = new float[8]; // The small ellipses to collect.
float endX, endY;
float step;
float pct; // Let enemies follow you.
int n; // The number of side ellipse.
int kill; // The number of killed enemies.
int startTime; // The time to display "No Bullets!" message.
int chang, kuan; // The size of barriers.
int startT; // The start time of game.
int stage;
int[] barrierX = {
  50, 50, 1200, 1200
};
int[] barrierY = {
  150, 700, 150, 700
}; // Initial coordiantes of four barriers.
int[] dx = {
  2, 2, -2, -2
};
int[] dy = {
  2, -2, 2, -2
}; // The speed of four barriers.
boolean w, a, s, d; // 
boolean left, right; // Control the direction of rotation.
boolean add; // If n < 12, add one ellipse.
boolean time1, time2; // Show the message in a interval.
boolean lose, win; // The two conditions.
boolean [] visible = new boolean [12]; // See the shooting ellipses.

void setup()
{
  //BGM
  minim = new Minim(this);
  player0 = minim.loadFile("welcome.mp3");
  player1 = minim.loadFile("game.mp3");
  player2 = minim.loadFile("collect.mp3");
  player3 = minim.loadFile("shoot.mp3");
  player4 = minim.loadFile("kill.mp3");
  player5 = minim.loadFile("button.mp3");
  player6 = minim.loadFile("win.mp3");
  player7 = minim.loadFile("collision.mp3");
  player0.rewind(); 
  player0.play();

  // Welcome Page
  size(1400, 850);
  bk = loadImage("bk.png");
  play = loadImage("play.png");
  quitW = loadImage("quitW.png");
  xCenterDisplay = 700;
  yCenterDisplay = 390;
  r = 70; // Distance between center ellipse and small ellipses.
  m = 3; // The numbr of small ellipses.

  // Teaching Page
  size(1400, 850);
  background = loadImage("background.png");

  // Game Page
  gameInit();
}

void gameInit()
{
  size(1400, 850);
  bg = loadImage("bg.png"); // Background picture.
  restartLose = loadImage("restartLose.png");
  quitLose = loadImage("quitLose.png"); // Two buttons when game lose.
  restartWin = loadImage("restartWin.png");
  quitWin = loadImage("quitWin.png"); // Two buttons when game win.
  rocketL = loadImage("eL.png");
  rocketR = loadImage("eR.png"); // rocket.
  xCenter = width/2;
  yCenter = height/2; // The inital coordiante of center ellipse.
  w = a = s = d = false; // Make center ellipse move.
  left = right = false; // Make arrow rotate.
  add = true; // Let the player add ellipse.
  angle2 = 0; // The initial angle of arrow.
  radiusEllipse = 50; // The distance between side ellipses and center ellipses.
  n = 2; // The initial number of side ellipse.
  kill = 0; // The killed enemies.
  chang = 150;
  kuan = 100; // The size of barriers.
  lose = false;
  win = false; // Two conditions.
  pct = 0;
  step = 0.006;
  rocketLx = -2000;
  rocketLy = random(200, 700); 
  rocketRx = 4000;
  rocketRy = random(200, 700); // The initial coordinates of rocket.
  rocketW = rocketL.width*0.25;
  rocketH = rocketL.height*0.25; // The size of rocket.
  fastSpeed = 17; // The speed of rocket.
  stage = 0;
  for ( int i = 0; i < 2; i++ ) {
    enemyLeft[i] = loadImage("eL"+i+".png");
    enemyDown[i] = loadImage("eD"+i+".png");
    enemyRight[i] = loadImage("eR"+i+".png");
    enemyUp[i] = loadImage("eU"+i+".png"); // Display UFO from four directions.
    beginxL[i] = random(-4000, -2000);
    beginyL[i] = random(0, 800);
    beginxD[i] = random(0, 1400);
    beginyD[i] = random(1000, 4000);
    beginxR[i] = random(2000, 5000);
    beginyR[i] = random(0, 800);
    beginxU[i] = random(0, 1400);
    beginyU[i] = random(-4000, -2000); // The initial coordinates of UFO.
    distxL[i] = endX - beginxL[i];
    distyL[i] = endY - beginyL[i];
    distxD[i] = endX - beginxD[i];
    distyD[i] = endY - beginyD[i];
    distxR[i] = endX - beginxR[i];
    distyR[i] = endY - beginyR[i];
    distxU[i] = endX - beginxU[i];
    distyU[i] = endY - beginyU[i]; // The distance betweent UFO and center ellipse. 
    enemyW = enemyLeft[0].width*0.25;
    enemyH = enemyLeft[0].height*0.25; // The size of UFO.
  }
  for ( int i = 0; i < 12; i++ ) {
    visible [i] = false;
  } // Visible of shooting ellipses.
  for ( int i = 0; i < 8; i++ ) {
    xSmall[i] = random(200, 1200);
    ySmall[i] = random(100, 700);
  }
  for ( int i = 0; i < barriers.length; i++ ) {
    barriers[i] = loadImage("b"+i+".png");
    barrierX[0] = 50;
    barrierX[1] = 50;
    barrierX[2] = 1200;
    barrierX[3] = 1200;
    barrierY[0] = 150;
    barrierY[1] = 700;
    barrierY[2] = 150;
    barrierY[3] = 700;
  } // Draw barriers.
}

void draw()
{
  if ( stage == 0 ) {
    drawWelcomePage();
  } else if ( stage == 1 ) {
    drawTeachingPage();
  } else if ( stage == 2 ) {
    if ( lose == true ) {
      drawFail1();
    } else if ( (millis() - startT) / 1000 >= 300 && kill < 100 ) {
      drawFail2();
    } else if ( (millis() - startT) / 1000 >= 300 && kill >= 100 ) {
      win = true;
      drawVictory();
    } else {
      image(bg, 0, 0, width, height);
      drawArrow();
      drawEllipses();
      shootBullet();
      drawBarriers();
      drawEnemies();
      drawNoBullet();
      displayMessage();
      threeLevels();
      makeMove();
      stopBGM();
    }
  }
}

void drawWelcomePage()
{
  image(bk, 0, 0, width, height);
  image(play, 480, 600, 150, 150);
  image(quitW, 780, 600, 130, 150);
  fill(0);
  stroke(255);
  strokeWeight(2);
  ellipse(xCenterDisplay, yCenterDisplay, 60, 60);
  for ( int i = 0; i < 3; i++ ) {
    xDisplay[i] = xCenterDisplay + r*cos(radians(angle+(360/m)*i));
    yDisplay[i] = yCenterDisplay + r*sin(radians(angle+(360/m)*i));
    ellipse(xDisplay[i], yDisplay[i], 35, 35); 
    angle += 2; // Make small ellipses rotate.
    fill(0);
    textSize(120);
    text("Rotating", 500, 140);
    text("Magical Balls", 370, 260);
    textSize(50);
    text("PLAY", 490, 800);
    text("QUIT", 790, 800);
    textSize(40);
    text("Collect balls and shoot them as bullets", 350, 550);
  }
}

void drawTeachingPage()
{
  image(background, 0, 0, width, height);
  fill(0);
  stroke(255);
  strokeWeight(5);
  ellipse(1250, 760, 70, 70);
  textSize(30);
  fill(255);
  text("GO", 1230, 770);
}

void drawArrow()
{
  pushMatrix();
  translate(xCenter, yCenter);
  rotate(radians(angle2));
  fill(0);
  stroke(255);
  strokeWeight(1);
  beginShape();
  vertex(0, -90);
  vertex(-15, -65);
  vertex(0, -80);
  vertex(15, -65);
  endShape();
  popMatrix(); // Draw the arrow.
}

void drawEllipses()
{
  stroke(255);
  strokeWeight(2);
  fill(177);
  smooth();
  for ( int i = 0; i < 8; i++ ) {
    ellipse(xSmall[i], ySmall[i], 25, 25);
    if ( n < 12 ) {
      add = true;
    }
    if ( n >= 12 ) {
      add = false;
    } else if ( add == true && xCenter + 75 >= xSmall[i] && xCenter <= xSmall[i] + 75 
      && ySmall[i] + 75 >= yCenter && ySmall[i] <= yCenter + 75 )
    { 
      n++; // Add small ellipse when center ellipse touch it.
      player2.play();
      player2.rewind();
      xSmall[i] = random(200, 1200);
      ySmall[i] = random(100, 700);
    }
  }
  fill(0);
  ellipse(xCenter, yCenter, 50, 50); // Draw the center ellipse.
  angle1 += 5; // The velocity of rotation.
  if ( n > 0 ) {
    for ( int i = 0; i < n; i++) {
      x[i] = xCenter + radiusEllipse * cos(radians(angle1+(360/n)*i));
      y[i] = yCenter + radiusEllipse * sin(radians(angle1+(360/n)*i));
      fill(0);
      ellipse(x[i], y[i], 25, 25); // Draw the small ellpses.
    } // The maximus number of small ellipses are 12.
  }
}

void shootBullet()
{
  for ( int i = 0; i < 12; i++ ) {
    if ( visible [i] == true ) {
      fill(0);
      strokeWeight(2);
      stroke(255);
      fill(random(0, 255), random(0, 255), random(0, 255));
      ellipse( xShoot[i], yShoot[i], 25, 25 );
      vx = 16*sin(radians(angle3[i]));
      vy = -16*cos(radians(angle3[i])); // The velocity of shooting ellipses.
      xShoot[i] += vx;
      yShoot[i] += vy;
      for (int t = 0; t < 4; t++ ) {
        if ( barrierX[t] + 162.5 > xShoot[i] && barrierX[t] < xShoot[i] + 12.5 && 
          yShoot[i] < barrierY[t] + kuan && yShoot[i] > barrierY[t] ) {
          angle3[i] = - angle3[i];
        }
        if ( barrierY[t] + 112.5 > yShoot[i] && barrierY[t] < yShoot[i] + 12.5 && 
          xShoot[i] < barrierX[t] + chang && xShoot[i] > barrierX[t] ) {
          angle3[i] = 180 - angle3[i];
        } // Shooting ellipses will bounce if they touch barriers.
        if ( xShoot[i] > width || xShoot[i] < 0 || yShoot[i] > height || yShoot[i] < 0 ) {
          visible [i] = false;
        }
      }
    }
  }
}

void drawBarriers()
{
  for (int i = 0; i < 4; i++ ) {
    image(barriers[i], barrierX[i], barrierY[i], chang, kuan);
    if ( (millis() - startT)/1000 > 100 ) {
      barrierX[i] += dx[i];
      barrierY[i] += dy[i];
    }
    if ( barrierX[i] < 0 || barrierX[i] + chang > width ) {
      dx[i] = - dx[i];
    }
    if ( barrierY[i] < 0 || barrierY[i] + kuan > height ) {
      dy[i] = -dy[i];
    } // Barriers will bounce when touch the boundary.
    if ( n != 0 ) {
      if ( xCenter + 62.5 >= barrierX[i] && xCenter <= barrierX[i] + 212.5 &&
        yCenter + 62.5 >= barrierY[i] && yCenter <= barrierY[i] + 162.5 ) {
        n -= 1;
        player7.play();
        player7.rewind();
        barrierX[i] = int(random(0, width-chang));
        barrierY[i] = int(random(0, height-kuan));
      } // If side ellipses are touched by barriers, barriers will appear randomly.
    } else {
      if ( xCenter + 25 >= barrierX[i] && xCenter <= barrierX[i] + 175 &&
        yCenter + 25 >= barrierY[i] && yCenter <= barrierY[i] + 125 ) {
        lose = true;
      } // If the center ellipse is touched by the barriers, game will over.
    }
  }
}

void drawEnemies()
{
  endX = xCenter-enemyW/2;
  endY = yCenter-enemyH/2;
  pct += step; 
  if ( (millis()-startT) / 1000 > 200 ) {
    image(rocketL, rocketLx, rocketLy, rocketW, rocketH);
    image(rocketR, rocketRx, rocketRy, rocketW, rocketH);
    rocketLx += fastSpeed;
    rocketRx -= fastSpeed;
    if ( rocketLx > width+rocketW ) {
      rocketLx = -2000;
      rocketLy = random(200, 700);
    }
    if ( rocketRx < -rocketW ) {
      rocketRx = 4000;
      rocketRy = random(200, 700);
    }
  } // Reset rockets if they run out of boundary.
  for ( int i = 0; i < 2; i++ ) {
    for ( int t = 0; t < 12; t++ ) {
      image(enemyDown[i], xD[i], yD[i], enemyW, enemyH);
      image(enemyRight[i], xR[i], yR[i], enemyW, enemyH);
      image(enemyUp[i], xU[i], yU[i], enemyW, enemyH);
      image(enemyLeft[i], xL[i], yL[i], enemyW, enemyH);
      if ( pct < 1 ) {
        xL[i] = beginxL[i] + (pct * distxL[i]);
        yL[i] = beginyL[i] + (pct * distyL[i]);
        xD[i] = beginxD[i] + (pct * distxD[i]);
        yD[i] = beginyD[i] + (pct * distyD[i]);
        xR[i] = beginxR[i] + (pct * distxR[i]);
        yR[i] = beginyR[i] + (pct * distyR[i]);
        xU[i] = beginxU[i] + (pct * distxU[i]);
        yU[i] = beginyU[i] + (pct * distyU[i]); // Make UFO move towards center ellipse.
        if ( n > 0 ) {
          if ( xL[i] + enemyW > xCenter - 62.5 && xCenter + 62.5 > xL[i] 
            && yCenter + 62.5 > yL[i] && yL[i] + enemyH > yCenter - 62.5 ) {
            player7.play();
            player7.rewind();
            beginxL[i] = random(-4000, -2000);
            beginyL[i] = random(0, 800);
            n -= 1;
          }
          if ( xD[i] + enemyW > xCenter - 62.5 && xCenter + 62.5 > xD[i] 
            && yCenter + 62.5 > yD[i] && yD[i] + enemyH > yCenter - 62.5 ) {
            player7.play();
            player7.rewind();
            beginxD[i] = random(0, 1400);
            beginyD[i] = random(1000, 4000);
            n -= 1;
          }
          if ( xR[i] + enemyW > xCenter - 62.5 && xCenter + 62.5 > xR[i] 
            && yCenter + 62.5 > yR[i] && yR[i] + enemyH > yCenter - 62.5 ) {
            player7.play();
            player7.rewind();
            beginxR[i] = random(2000, 4000);
            beginyR[i] = random(0, 800);
            n -= 1;
          }
          if ( xU[i] + enemyW > xCenter - 62.5 && xCenter + 62.5 > xU[i] 
            && yCenter + 62.5 > yU[i] && yU[i] + enemyH > yCenter - 62.5 ) {
            player7.play();
            player7.rewind();
            beginxU[i] = random(0, 1400);
            beginyU[i] = random(-4000, -2000);
            n -= 1;
          } // If side ellipses is touched by enemies, enemies will appear randomly.
          if ( visible[t] == true && xL[i] + enemyW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= xL[i] 
            && yShoot[t] + 12.5 >= yL[i] && yL[i] + enemyH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            beginxL[i] = random(-4000, -2000);
            beginyL[i] = random(0, 800);
            visible[t] = false;
            kill += 1;
          }
          if ( visible[t] == true && xD[i] + enemyW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= xD[i] 
            && yShoot[t] + 12.5 >= yD[i] && yD[i] + enemyH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            beginxD[i] = random(0, 1400);
            beginyD[i] = random(1000, 4000);
            visible[t] = false;
            kill += 1;
          }
          if ( visible[t] == true && xR[i] + enemyW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= xR[i] 
            && yShoot[t] + 12.5 >= yR[i] && yR[i] + enemyH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            beginxR[i] = random(2000, 4000);
            beginyR[i] = random(0, 800);
            visible[t] = false;
            kill += 1;
          }
          if ( visible[t] == true && xU[i] + enemyW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= xU[i] 
            && yShoot[t] + 12.5 >= yU[i] && yU[i] + enemyH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            beginxU[i] = random(0, 1400);
            beginyU[i] = random(-4000, -2000);
            visible[t] = false;
            kill += 1;
          }
          if ( rocketLx + rocketW > xCenter - 62.5 && xCenter + 62.5 > rocketLx 
            && yCenter + 62.5 > rocketLy && rocketLy + rocketH > yCenter - 62.5 ) {
            player7.play();
            player7.rewind();
            rocketLx = -2000;
            rocketLy = random(200, 700);
            n -= 1;
          }
          if ( visible[t] == true && rocketLx + rocketW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= rocketLx 
            && yShoot[t] + 12.5 >= rocketLy && rocketLy + rocketH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            rocketLx = -2000;
            rocketLy = random(200, 700);
            visible[t] = false;
            kill += 1;
          }
          if ( rocketRx + rocketW > xCenter - 62.5 && xCenter + 62.5 > rocketRx 
            && yCenter + 62.5 > rocketRy && rocketRy + rocketH > yCenter - 62.5 ) {
            player7.play();
            player7.rewind();
            rocketRx = 4000;
            rocketRy = random(200, 700);
            n -= 1;
          } // If side ellipse touch rockets, rockets will appear randomly.
          if ( visible[t] == true && rocketRx + rocketW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= rocketRx 
            && yShoot[t] + 12.5 >= rocketRy && rocketRy + rocketH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            rocketRx = 4000;
            rocketRy = random(200, 700);
            visible[t] = false;
            kill += 1;
          }
        } // If shooting ellipse touch enemies, enemies will appear randomly.
        if ( n == 0 ) {
          if ( visible[t] == true && xL[i] + enemyW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= xL[i] 
            && yShoot[t] + 12.5 >= yL[i] && yL[i] + enemyH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            beginxL[i] = random(-4000, -2000);
            beginyL[i] = random(0, 800);
            visible[t] = false;
            kill += 1;
          }
          if ( visible[t] == true && xD[i] + enemyW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= xD[i] 
            && yShoot[t] + 12.5 >= yD[i] && yD[i] + enemyH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            beginxD[i] = random(0, 1400);
            beginyD[i] = random(1000, 4000);
            visible[t] = false;
            kill += 1;
          }
          if ( visible[t] == true && xR[i] + enemyW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= xR[i] 
            && yShoot[t] + 12.5 >= yR[i] && yR[i] + enemyH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            beginxR[i] = random(2000, 4000);
            beginyR[i] = random(0, 800);
            visible[t] = false;
            kill += 1;
          }
          if ( visible[t] == true && xU[i] + enemyW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= xU[i] 
            && yShoot[t] + 12.5 >= yU[i] && yU[i] + enemyH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            beginxU[i] = random(0, 1400);
            beginyU[i] = random(-4000, -2000);
            visible[t] = false;
            kill += 1;
          }
          if ( xL[i] + enemyW > xCenter - 25 && xCenter + 25 > xL[i] 
            && yCenter + 25 > yL[i] && yL[i] + enemyH > yCenter -25 ) {
            lose = true;
          }
          if ( xD[i] + enemyW > xCenter - 25 && xCenter + 25 > xD[i] 
            && yCenter + 25 > yD[i] && yD[i] + enemyH > yCenter -25 ) {
            lose = true;
          }
          if ( xR[i] + enemyW > xCenter - 25 && xCenter + 25 > xR[i] 
            && yCenter + 25 > yR[i] && yR[i] + enemyH > yCenter -25 ) {
            lose = true;
          }
          if ( xU[i] + enemyW > xCenter - 25 && xCenter + 25 > xU[i] 
            && yCenter + 25 > yU[i] && yU[i] + enemyH > yCenter -25 ) {
            lose = true;
          }
          if ( visible[t] == true && rocketLx + rocketW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= rocketLx 
            && yShoot[t] + 12.5 >= rocketLy && rocketLy + rocketH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            rocketLx = -2000;
            rocketLy = random(200, 700);
            visible[t] = false;
            kill += 1;
          }
          if ( visible[t] == true && rocketRx + rocketW >= xShoot[t] - 12.5 && xShoot[t] + 12.5 >= rocketRx 
            && yShoot[t] + 12.5 >= rocketRy && rocketRy + rocketH >= yShoot[t] - 12.5 ) {
            player4.play();
            player4.rewind();
            rocketRx = 4000;
            rocketRy = random(200, 700);
            visible[t] = false;
            kill += 1;
          } // If shooting ellipse touch rockets, rockets will appear randomly.
          if ( rocketLx + rocketW > xCenter - 25 && xCenter + 25 > rocketLx 
            && yCenter + 25 > rocketLy && rocketLy + rocketH > yCenter -25 ) {
            lose = true;
          }
          if ( rocketRx + rocketW > xCenter - 25 && xCenter + 25 > rocketRx 
            && yCenter + 25 > rocketRy && rocketRy + rocketH > yCenter -25 ) {
            lose = true;
          } // If center ellipse is touched by rockets, game will over.
        } // Make the last shooting ellipses can kill enemies.
      }
    }
  }
}

void drawNoBullet()
{
  if ( time1 == true ) {
    if ( time2 == false ) {
      startTime = millis();
      time2 = true;
    }
    if ( (millis() - startTime)/1000 < 1 && time1 == true && time2 == true) {
      textSize(50);
      fill(255);
      text("No Bullet!", 600, 800); // Display message within 1 seconds.
    } else {
      time1 = false;
      time2 = false;
    }
  }
}

void displayMessage()
{
  textSize(30);
  fill(255);
  text("Living Time: " + (millis()-startT)/1000 + 's', 10, 30);
  text("Killed enemies: " + kill + " (Min:100)", 10, 70);
  text("Bullets: " + n + " (Max:12)", 10, 110); // Display three massages in left top corner.
}

void drawVictory()
{ 
  fill(0, 2);
  rect(0, 0, width, height);
  textSize(100);
  fill(255, 255, 0);
  text("Mission Victory!", 300, 300);
  image(restartWin, 400, 400, 120, 120);
  textSize(50);
  text("RESTART", 360, 600);
  image(quitWin, 850, 400, 110, 120);
  text("QUIT", 850, 600); // Display message when win.
}

void drawFail1()
{
  fill(0, 2);
  rect(0, 0, width, height);
  textSize(100);
  fill(255, 0, 0);
  text("Mission Fail!", 400, 210);
  textSize(50);
  text("You didn't survive 300 seconds!", 310, 400);
  image(restartLose, 400, 500, 120, 120);
  textSize(50);
  text("RESTART", 360, 700);
  image(quitLose, 850, 500, 110, 120);
  text("QUIT", 850, 700); // Display message when lose.
}

void drawFail2()
{
  fill(0, 2);
  rect(0, 0, width, height);
  textSize(100);
  fill(255, 0, 0);
  text("Mission Fail!", 400, 210);
  textSize(50);
  text("You didn't kill 100 enemies!", 340, 400);
  image(restartLose, 400, 500, 120, 120);
  textSize(50);
  text("RESTART", 360, 700);
  image(quitLose, 850, 500, 110, 120);
  text("QUIT", 850, 700); // Display message when lose.
}

void threeLevels()
{
  if ( (millis() - startT) / 1000 >= 0 && (millis() - startT) / 1000 <= 3 )
  {
    textSize(70);
    fill(255);
    text("Level One", 550, 100);
  }
  if ( (millis() - startT) / 1000 >= 100 && (millis() - startT) / 1000 <= 103 )
  {
    textSize(70);
    fill(255);
    text("Level Two", 550, 100);
  }
  if ( (millis() - startT) / 1000 >= 200 && (millis() - startT) / 1000 <= 203 )
  {
    textSize(70);
    fill(255);
    text("Level Three", 550, 100);
  }
}

void makeMove()
{
  for ( int i = 0; i < 2; i++ ) {
    if ( w && yCenter - 62.5 > 0 ) {
      yCenter -= 4;
      pct = 0;
      beginxL[i] = xL[i];
      beginyL[i] = yL[i];
      beginxD[i] = xD[i];
      beginyD[i] = yD[i];
      beginxR[i] = xR[i];
      beginyR[i] = yR[i];
      beginxU[i] = xU[i];
      beginyU[i] = yU[i];
      distxL[i] = endX - beginxL[i];
      distyL[i] = endY - beginyL[i];
      distxD[i] = endX - beginxD[i];
      distyD[i] = endY - beginyD[i];
      distxR[i] = endX - beginxR[i];
      distyR[i] = endY - beginyR[i];
      distxU[i] = endX - beginxU[i];
      distyU[i] = endY - beginyU[i];
    } // Make center ellipse up.
    if ( s && yCenter + 62.5 < height ) {
      yCenter += 4;
      pct = 0;
      beginxL[i] = xL[i];
      beginyL[i] = yL[i];
      beginxD[i] = xD[i];
      beginyD[i] = yD[i];
      beginxR[i] = xR[i];
      beginyR[i] = yR[i];
      beginxU[i] = xU[i];
      beginyU[i] = yU[i];
      endX = xCenter;
      endY = yCenter;
      distxL[i] = endX - beginxL[i];
      distyL[i] = endY - beginyL[i];
      distxD[i] = endX - beginxD[i];
      distyD[i] = endY - beginyD[i];
      distxR[i] = endX - beginxR[i];
      distyR[i] = endY - beginyR[i];
      distxU[i] = endX - beginxU[i];
      distyU[i] = endY - beginyU[i];
    } // Make center ellipse down.
    if ( a && xCenter - 62.5 > 0 ) {
      xCenter -= 4;
      pct = 0;
      beginxL[i] = xL[i];
      beginyL[i] = yL[i];
      beginxD[i] = xD[i];
      beginyD[i] = yD[i];
      beginxR[i] = xR[i];
      beginyR[i] = yR[i];
      beginxU[i] = xU[i];
      beginyU[i] = yU[i];
      endX = xCenter;
      endY = yCenter;
      distxL[i] = endX - beginxL[i];
      distyL[i] = endY - beginyL[i];
      distxD[i] = endX - beginxD[i];
      distyD[i] = endY - beginyD[i];
      distxR[i] = endX - beginxR[i];
      distyR[i] = endY - beginyR[i];
      distxU[i] = endX - beginxU[i];
      distyU[i] = endY - beginyU[i];
    } // Make center ellipse left.
    if ( d && xCenter + 62.5 < width ) {
      xCenter += 4; // The speed.
      pct = 0;
      beginxL[i] = xL[i];
      beginyL[i] = yL[i];
      beginxD[i] = xD[i];
      beginyD[i] = yD[i];
      beginxR[i] = xR[i];
      beginyR[i] = yR[i];
      beginxU[i] = xU[i];
      beginyU[i] = yU[i];
      endX = xCenter;
      endY = yCenter;
      distxL[i] = endX - beginxL[i];
      distyL[i] = endY - beginyL[i];
      distxD[i] = endX - beginxD[i];
      distyD[i] = endY - beginyD[i];
      distxR[i] = endX - beginxR[i];
      distyR[i] = endY - beginyR[i];
      distxU[i] = endX - beginxU[i];
      distyU[i] = endY - beginyU[i];
    } // Make center ellipse right.
    if ( left )
      angle2 -= 3;
    if ( right )
      angle2 += 3; // The velocity of rotation.
  }
}

void stopBGM()
{
  if ( lose == true || ((millis()-startT)/1000 >= 300 && kill < 100)) {
    player1.pause();
    player1.rewind();
    player7.play();
    player7.rewind(); // Stop BGM when game over and play lose music.
  }
  if ( (millis()-startT)/1000 >= 300 && kill >= 100 ) {
    player1.pause();
    player1.rewind();
    player6.play();
    player6.rewind(); // Stop BGM when game over and play victory music.
  }
}

void keyPressed()
{
  if ( keyCode == UP )
    w = true;
  if ( keyCode == DOWN )
    s = true;
  if ( keyCode == LEFT )
    a = true;
  if ( keyCode == RIGHT )
    d = true; 
  if ( key == 'q' ) {
    left = true;
  }
  if ( key == 'e' ) {
    right = true;
  }
  boolean found = false;
  for ( int i = 0; i < 12; i++ ) {
    if ( key == ' ' && found == false && visible [i] == false ) {
      if ( n > 0 ) {
        n --;
        visible [i] = true;
        angle3[i] = angle2; // Specify the shooting angle.
        xShoot[i] = xCenter+radiusEllipse*sin(radians(angle3[i]));
        yShoot[i] = yCenter-radiusEllipse*cos(radians(angle3[i])); // the trajectory of shooting ellipses.
        found = true;
        player3.play();
        player3.rewind();
      } else {
        n=0;
        time1 = true; // Display message when no small ellipse.
      }
    }
  }
}

void keyReleased()
{
  if ( keyCode == UP )
    w = false;
  if ( keyCode == DOWN )
    s = false;
  if ( keyCode == LEFT )
    a = false;
  if ( keyCode == RIGHT )
    d = false; // Make the center ellipse move.
  if ( key == 'q' )
    left = false;
  if ( key == 'e' )
    right = false; // Make the arrow rotate.
} 

void mousePressed()
{
  if ( stage == 0 && mouseX > 480 && mouseX < 630 && mouseY > 600 && mouseY < 750 ) {
    player5.play();
    player5.rewind();
    stage = 1;
    player0.pause();
    player0.rewind();
  } 
  if ( stage == 0 && mouseX > 780 && mouseX < 910 && mouseY > 600 && mouseY < 750 ) {
    player5.play();
    player5.rewind();
    exit();
  } 
  if ( stage == 1 && mouseX > 1215 && mouseX < 1285 && mouseY > 725 && mouseY < 795 ) {
    player5.play();
    player5.rewind();
    player1.play();
    player1.rewind();
    gameInit();
    stage = 2;
    startT = millis(); // Game start time.
  } 
  if ( (stage == 2 && lose == true && mouseX > 400 && mouseX < 520 && mouseY > 500 && mouseY < 620) || 
    (stage == 2 && ((millis()-startT)/1000 >= 300 && kill < 100) && mouseX > 400 && mouseX < 520 && mouseY > 500 && mouseY < 620) ) {
    player5.play();
    player5.rewind();
    gameInit();
    stage = 2;
    startT = millis(); // Game start time.
    player1.play();
    player1.rewind();
  }
  if ( (stage == 2 && lose == true && mouseX > 850 && mouseX < 960 && mouseY > 500 && mouseY < 620 ) || 
    (stage == 2 && ((millis()-startT)/1000 >= 300 && kill < 100) && mouseX > 850 && mouseX < 960 && mouseY > 500 && mouseY < 620) ) {
    player5.play();
    player5.rewind();
    exit();
  } 
  if ( stage == 2 && win == true && mouseX > 400 && mouseX < 520 && mouseY > 400 && mouseY < 520 ) {
    player5.play();
    player5.rewind();
    gameInit();
    stage = 2;
    startT = millis(); // Game start time.
    player1.rewind();
    player1.play();
  } 
  if ( stage == 2 && win == true && mouseX > 850 && mouseX < 960 && mouseY > 400 && mouseY < 520 ) {
    player5.play();
    player5.rewind();
    exit();
  }
}

void stop()
{
  player0.close();
  player1.close();
  player2.close();
  player3.close();
  player4.close();
  player5.close();
  player6.close();
  player7.close();
  minim.stop();
}


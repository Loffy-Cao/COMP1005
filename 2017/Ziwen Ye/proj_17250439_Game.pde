import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PImage bg1;
PImage cv1;
PImage help;
PImage man;
PImage money;
PImage sB;
PImage hB;
int rockNum = 150;
PImage rock;
PImage bb1;
PImage bb2;
PImage bomb;
float manx;
float many;
float bb1x[] = new float [8];
float bb1y[] = new float [8];
boolean bb1Appear[] = new boolean[8];
float bb1w ;
float bb1h ;
float bb2x[] = new float [8];
float bb2y[] = new float [8];
boolean bb2Appear[] = new boolean[8];
float bb2w ;
float bb2h ;
float bombx [] = new float [2];
float bomby [] = new float [2];
boolean bombAppear[] = new boolean[2];
float bombw;
float bombh;
int dy;
int debug;
int g;

float rockx [] = new float [rockNum]; 
float rocky [] = new float [rockNum];
boolean rockAppear [] = new boolean [rockNum];
float rockw ;
float rockh ;
int sBX = 450;
int sBY = 500;
int stage;
float scale = 0.3;
int y0 = int(random(50, 600));
int x0 = int(random(0, 200));
int t;
int m;

Minim minim;
AudioPlayer bgm;

int x = 0; //in this way, x cannot start from 0 everytime


void setup() 
{
  size(1000, 1000);
  t = 0;
  x = 0;
  dy = 5;
  g=0;
  bb1 = loadImage("boomberg1.png");
  bb2 = loadImage("boomberg2.png");
  bg1 = loadImage("background01.jpg");
  cv1 = loadImage("cave1.jpg");
  man = loadImage("man.png");
  sB = loadImage("startButton.png");
  hB = loadImage("helpButton.png");
  rock = loadImage("rock.png");
  bomb = loadImage("bomb.png");
  money = loadImage("money.jpg");
  help = loadImage("help.jpg");
  for ( int i=0; i< rockNum; i++)//rock
  {
    rockx[i]=-100;
    rocky[i]=-100;
    rockAppear[i] = false;
  }
  for (int i=0; i<8; i++)//bb1
  {
    y0 = int(random(50, 500));
    x0 = int(random(0, 500));
    bb1x[i] = 0 - bb1w-x0;
    bb1y[i] = y0;
    bb2x[i] = 0 - bb2w-x0;
    bb2y[i] = y0;
    bb1Appear[i] = true;
    bb2Appear[i] = true;
    //    bb1x[0] = width/2;
    //    bb1y[0] = height/2;
  }
  for (int i=0; i<2; i++)//bb2
  {
    y0 = int(random(50, 500));
    x0 = int(random(0, 500));
    bombx[i] = 0 - bb2w-x0;
    bomby[i] = y0;
    bombAppear[i] = true;
  }
  stage = 0;
  rockw = 80;
  rockh = 80;
   minim = new Minim(this);
  bgm = minim.loadFile("bgm.mp3");
  many = 800 - man.height*scale;
  bb1w = bb1.width*0.7;
  bb1h = bb1.height*0.7;
  bb2w = bb2.width*0.2;
  bb2h = bb2.height*0.2;
  bombw = bomb.width*0.5;
  bombh = bomb.height*0.5;
  rockw = rock.width*0.1;
  rockh = rock.height*0.1;
}

void draw() 
{
  background(255);
  if (stage == 0) 
  {
    startPage();
    bgm.play();
  } else if (stage == 1) 
  {
    t = t + 1;
    gamePage();
    bgm.play();
  } else if (stage == 2)
  {
    gameSucceedPage();
    bgm.play();
  } else if (stage == 3)
  {
    gameFailPage();
        bgm.play();
  } else if (stage == 4)
  {
    helpPage();
        bgm.play();
  }
}

void startPage() 
{  //done
  image(bg1, 0, 0, width, height);
  image(sB, 230, 400, sB.width*0.5, sB.height*0.5);
  image(hB, 250, 600, hB.width, hB.height);
  image(man, 700, 400, 90, 100);
  textSize(50);
  fill(255, 0, 0);
  text("The honor of Ralph", 250, 300);
}
void gamePage() 
{
  manx = mouseX- man.width*scale/2;
  image(cv1, 0, 0, width, height);
  image(man, manx, many, man.width*scale, man.height*scale);


  for (int i=0; i<rockNum; i++)
  {
    if (rockAppear[i]) {
      image(rock, rockx[i], rocky[i], rockw, rockh);

      rocky[i]=rocky[i]-5;
    }
  }

  //    for (int i=0; i<8; i++)  //bb1
  //    {
  //      if (bb1Appear[i]==true)
  //      {
  //        image(bb1, bb1x[i], bb1y[i], bb1w, bb1h);
  ////  want      bb1x[i] = bb1x[i] + 3;
  //      }
  ////  want    bb1y[i] = bb1y[i]+ sin(bb1x[i]/10)*20;
  //
  //      if (bb1x[i]>=width) 
  //      {
  //        bb1x[i] = 0 - bb1w-x0;
  //        bb1y[i] = y0;
  //      }
  //    }
  for (int i= 0; i< 8; i++)
  {
    if (bb1Appear[i])
    {
      image(bb1, bb1x[i], bb1y[i], bb1w, bb1h);
      bb1x[i] = bb1x[i] + 3;
    }
  }
  for (int i=0; i<8; i++)   //bb2
  {
    if (bb2Appear[i]==true)
    {
      image(bb2, bb2x[i], bb2y[i], bb2w, bb2h);
      bb2x[i] = bb2x[i] + 3;
    }
    bb2y[i] = bb2y[i]+ sin(bb2x[i]/10)*20;
    
    if (bb2x[i]>=width) 
    {
      bb2x[i] = 0 - bb2w-x0;
      bb2y[i] = y0;
    }
  }
  for (int i=0; i<2; i++) //bomb
  {
    if (bombAppear[i]) 
    {
      image(bomb, bombx[i], bomby[i], bombw, bombh);
      bombx[i] = bombx[i] + 3;
      bomby[i] = bomby[i]+ sin(bombx[i]/10)*20;
    } 
    if (bombx[i]>=width) 
    {
      bombx[i] = 0 - bombw-x0;
      bomby[i] = y0;
    }
  }

  if ( t % 60 == 0) 
  {
    x=x+1;
  }
  textSize(75);
  fill(255, 0, 0);
  text("Time:" + x + "s", 0, 160);
  text("Score:"+ g, 0, 80);
  for (int i=0; i<bb1y.length; i++) 
  {
    for (int a = 0; a<rockNum; a++) 
    { 
      if (rocky[a] < bb1y[i]+ bb1h 
        && bb1y[i] < rocky[a] + rockh 
        && rockx[a]<bb1x[i] + bb1w 
        && bb1x[i] < rockx[a]+rockw) 
        {       
        g = g + 1; //collision bb1
        rockx[i] = 1000;
        bb1x[i] = 2000;
        bb1Appear[i] = false;
        }
    }
  }
  for (int i=0; i<bb2y.length; i++) 
  {
    for (int a = 0; a<rockNum; a++) 
    { 
      if (rockx[a]+rockw > bb2x[i] && rockx[a]< bb2x[i] + bb2w && rocky[a]+rockh > bb2y[i] && rocky[a] < bb2y[i] +bb2h ) 
      {    
        g = g + 2; //collision bb2
        rockx[i] = 1000;
        bb2x[i] = 2000;
        bb2Appear[i] = false;
      }
    }
  }  
  for (int i=0; i<2; i++) 
  {
    for (int a = 0; a<rockNum; a++) 
    { 
    if (rockx[a]+rockw > bombx[i] && rockx[a] < bombx[i] + bombw && rocky[a]+rockh > bomby[i] && rocky[a] < bomby[i] +bombh ) 
    { 
      stage = 3;
    }
  }  
  if ( g == 20)                 //scorefull
  {
    stage = 2;
  }
  if ( x == 25)                //timeIsUp
  {  
    stage = 3;
  }
  //  if (rocky[i]< 0-rockh || rockx[i] == 1000)
  //  {
  //    rockAppear = false;
  //  }

  
}

}

void gameSucceedPage() 
{ //done
  image(money, 0, 0, width, height);
  textSize(50);
  fill(255, 0, 0);
  text("Great!!!", 250, 300);
  text("Ralph get it!", 250, 400);
}
void gameFailPage()   
{  //done
  image(cv1, 0, 0, width, height);
  textSize(50);
  fill(0, 255, 255);
  text("Sorry you failed...", 250, 300);
  text("Press 'R' to restart", 250, 425);
  text("Or press 'Q' to leave", 250, 500);
}
void helpPage() 
{
  image(help, 0, 0, width, height);
  fill(255,255,0);
  rect(680,720,100,50);
  fill(0);
  textSize(45);
  text("Back",680,760);
}

void mousePressed() 
{
  if ( stage == 0) 
  {
    if ( mouseX<250 + sB.width*0.5 && mouseX>250 && mouseY<400+sB.height*0.5 && mouseY>400) {
      stage = 1;
    } else if (mouseX<250+hB.width && mouseX>250 && mouseY<600+hB.height && mouseY>600) {
      stage = 4;
    }
  }
  if (stage == 4)
  {
   if(mouseX >680 && mouseX<780 && mouseY>720 && mouseY < 770)
  {     
    stage=0;
  }
  }
}
void keyPressed()
{
  if ( stage == 1) 
  {
    if ( key == 's' || key == 'S') 
    {
      for ( int i = 0; i < rockNum; i++)
      {
        if (rockAppear[i] ==false)
        {
          rockAppear[i] = true;
          rockx[i]=manx;
          rocky[i]=many - dy;
          break;
        }
      }
    }
    if ( keyCode == ESC ) 
    {
      stage = 0;
    }
  }
  if ( stage == 3) 
  {
    if ( key == 'r' || key == 'R') 
    {
      setup();
      stage = 1;
    } else if ( key == 'q' || key == 'Q') 
    {
      exit();
    }
  }
}

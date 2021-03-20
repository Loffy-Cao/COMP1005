int stageNum;

PImage welcomePage;
PImage background;

int totalNum =4;
PImage night;
PImage girl;
PImage star;
PImage[]img=new PImage[totalNum];
float[] x = new float [totalNum]; 
float[] y = new float [totalNum];
float[]speed=new float[totalNum];
int cakeWidth;
int girlW, girlH;
int starW;
int starTotal=100;
float[] starX=new float[starTotal];
float[] starY=new float[starTotal];
int firedNum;
int life;
int count;
int mark1, mark2, mark3;
boolean gameEnd, gameWin;

PImage[]Star=new PImage[totalNum];
float[] StarX = new float [starTotal]; 
float[] StarY = new float [starTotal];
int []StarNum=new int[starTotal];
int i;

import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
BeatDetect beat;

void setup()
{
  size(1000, 750);
  welcomePage=loadImage("homepage.jpg");

  night=loadImage("night.jpg");
  girl=loadImage("girl.png");
  star=loadImage("star.png");
  background=loadImage("img.jpg");

  firedNum=0;
  cakeWidth=75;
  girlW=75;
  girlH=100;
  starW=50;
  life=3;
  mark1=0;
  mark2=0;
  count=0;
  gameEnd=false;
  gameWin=false;
  stageNum=0;
  minim = new Minim(this);
  song = minim.loadFile("song.mp3", 1024);
  song.play();

  for (int i =0; i < totalNum; i=i+1)
  {
    img[i]=loadImage("cake "+i+".png");
    x[i]=random(0, 1000-cakeWidth);
    y[i]=random(-450, 0-cakeWidth);
    speed[i]=random(1, 8);
  }
  for (int j=0; j<starTotal; j=j+1)
  {
    starY[j]=-1000;
    StarY[j]=-1000;
  }
  for (int StarNum=0; StarNum<totalNum; StarNum=StarNum+1)
  {
    Star[StarNum]=loadImage("Star"+StarNum+".png");
  }
}

void draw()
{
  if (stageNum == 0)
  {
    drawWelcome();
  } else if (stageNum == 1) {
    drawIntroduction1();
  } else if (stageNum==2) {
    drawPlay1();
  } else if (stageNum ==3) {
    drawIntroduction2();
  } else if (stageNum==4) {
    drawPlay2();
  } else if (stageNum==5) {
    drawGameover();
  }
}

void drawWelcome()
{
  image(welcomePage, 0, 0, width, height);
  fill(255);
  textSize(56);
  text("WELCOME!", 690, 130);
  textSize(40);
  text("Press any key to ", 675, 200);
  textSize(40);
  text("instrction :)", 675, 245);
}

void drawIntroduction1()
{
  image(background, 0, 0, width, height);
  fill(255);
  textSize(60);
  text("INTRODUCTION", 285, 100);
  fill(255);
  textSize(40);
  text("Mouse click to make Tinker Bell shoot the", 80, 200);
  text("cakes with the magic stars.", 80, 260);
  text("Making the falling cakes fly upwards to", 80, 340);
  text("earn marks.", 80, 400);
  text("The green cake represents 10 marks", 80, 460);
  text("The yellow cake represents 15 marks", 80, 520);
  text("The pink cake represents 20 marks", 80, 580);
  text("The blue cake represents 30 marks", 80, 640);
  text("Press any key to start the game :)", 80, 710);
}

void drawPlay1()
{
  println("in level 1");
  if (life==0)
  {
    textSize(100);
    text("Game Over!", 210, 400);
    textSize(40);
    text("Press any key to restart the game", 190, 550);
    gameEnd=true;
  } else if (count>=1800)
  {
    textSize(100);
    text("You Win!", 300, 400);
    textSize(40);
    text("You have successfully completed the level I!", 100, 540);
    text("Press any key to the level II :)", 200, 590);
    gameWin=true;
  } else
  {

    image(night, 0, 0, width, height);
    image(girl, mouseX-girlW/2, 750-girlH, girlW, girlH);


    for (int i = 0; i < totalNum; i=i+1)
    {
      y[i]=y[i]+speed[i];
      image(img[i], x[i], y[i], cakeWidth, cakeWidth);
      if (y[i]>=675)
      {
        life=life-1;
        x[i]=random(0, 1000-cakeWidth);
        y[i]=random(-450, 0-cakeWidth);
        speed[i]=random(1, 8);
      }
    }

    for (int j=0; j<starTotal; j=j+1)
    {
      image(star, starX[j], starY[j], starW, starW);
      starY[j]=starY[j]-5;
    }

    for (int i=0; i<totalNum; i=i+1)
    {
      for (int j=0; j<starTotal; j=j+1)
      {
        if (starX[j]+starW>=x[i]&&starX[j]<=x[i]+cakeWidth
          &&starY[j]+starW>=y[i]&&starY[j]<=y[i]+cakeWidth )
        {
          y[i]=-100;
          x[i]=random(0, 1000-cakeWidth);
          speed[i]=random(1, 8);
          if ( img[i]==img[0])
          {
            mark1=mark1+10;
          }
          if ( img[i]==img[1])
          {
            mark1=mark1+15;
          }
          if ( img[i]==img[2])
          {
            mark1=mark1+20;
          }
          if ( img[i]==img[3])
          {
            mark1=mark1+30;
          }
        }
      }
    }

    textSize(30);
    fill(255, 255, 255);
    count=count+1;
    text("Time:"+count/60+"s", 20, 35);
    text("Life:"+life, 20, 70);
    text("score:"+mark1, 20, 105);
  }
}

void drawIntroduction2()
{
  image(background, 0, 0, width, height);
  size(1000, 750);
  fill(255);
  textSize(60);
  text("INTRODUCTION", 285, 100);
  fill(255);
  textSize(40);
  text("Welcome to Level II!", 80, 140);
  text("In this level, you will face bigger challenge.", 80, 200);
  text("Making the falling cakes fly upwards to", 80, 260);
  text("earn marks.", 80,320);
  text("Mouse click to make Tinker Bell shoot the", 80, 380);
  text("cakes with the magic stars.", 80, 440);
  text("shoot the cake with the star of the same color,", 80, 500);
  text("otherwise,the life will be deducted by one", 80, 560);
  text("Press 'space' to change the color of the star",80,620);
  text("The scoring rule remains the same.",80,680);
  text("Press any key to start the game :)", 80, 740);
}

void drawPlay2()
{

  if (life==0)
  {
    textSize(100);
    text("Game Over!", 210, 400);
    textSize(40);
    text("Press any key to restart the game", 190, 550);
    gameEnd=true;
  } else if (count>=1200)
  {
    textSize(100);
    text("You Win!",210 ,400);
    textSize(40);
    text("Mouse press to see your total :)", 120, 520);
    gameWin=true;
  } else
  {

    image(night, 0, 0, width, height);
    image(girl, 0, 750-girlH, girlW, girlH);
    image(Star[StarNum[firedNum]], mouseX-starW/2, 750-starW, starW, starW);


    for (int i = 0; i < totalNum; i=i+1)
    {
      y[i]=y[i]+speed[i];
      image(img[i], x[i], y[i], cakeWidth, cakeWidth);
      if (y[i]>=675)
      {
        life=life-1;
        x[i]=random(0, 1000-cakeWidth);
        y[i]=random(-450, 0-cakeWidth);
        speed[i]=random(1, 3);
      }
    } 

    for (int j=0; j<firedNum; j=j+1)
    {
      image( Star[StarNum[j]], StarX[j], StarY[j], starW, starW);
      StarY[j]=StarY[j]-5;
    }

    for (int i=0; i<totalNum; i=i+1)
    {
      for (int j=0; j<firedNum; j=j+1)
      {
        if (StarX[j]+starW>=x[i]&&StarX[j]<=x[i]+cakeWidth
          &&StarY[j]+starW>=y[i]&&StarY[j]<=y[i]+cakeWidth )
        {
          y[i]=-100;
          x[i]=random(0, 1000-cakeWidth);
          speed[i]=random(1, 3);
          StarX[j]=-100;
          if (StarNum[j]==i)
          { 
            if (i==0)
            {     
              mark2=mark2+10;
            }
            if (i==1)
            {
              mark2=mark2+15;
            }
            if (i==2)
            {
              mark2=mark2+20;
            }
            if (i==3)
            {
              mark2=mark2+30;
            }
          } else
          {
            life=life-1;
          }
        }
      }
    }
    textSize(30);
    fill(255, 255, 255);
    count=count+1;
    text("Time:"+count/60+"s", 20, 35);
    text("Life:"+life, 20, 70);
    text("score:"+mark2, 20, 105);
  }
}

void drawGameover()
{
  image(night, 0, 0, width, height);
  mark3=mark1+mark2;
  fill(255);
  textSize(60);
  text("TOTAL SCORE", 280, 300);
  fill(255);
  textSize(50);
  text(mark1+"+"+mark2+"="+mark3, 260, 360);
  
}

void keyPressed()
{
  if (stageNum==0)
  {
    stageNum=1;
  } else if (stageNum==1)
  {
    stageNum=2;
  } else if (stageNum==2&&gameEnd==true)
  {
    setup();
  } else if (stageNum==2&& gameWin == true)
  {
    stageNum=3;
  } else if (stageNum==3)
  {
    cakeWidth=75;
    girlW=75;
    girlH=100;
    starW=50;
    life=3;
    mark2=0;
    count=0;
    gameEnd=false;
    gameWin=false;

    for (int i =0; i < totalNum; i=i+1)
    {

      x[i]=random(0, 1000-cakeWidth);
      y[i]=random(-450, 0-cakeWidth);
      speed[i]=random(1, 3);
    }
    for (int j=0; j<starTotal; j=j+1)
    {
      starY[j]=750-starW;
    }
    firedNum = 0;
    stageNum=4;
  } else if (stageNum==4)
  {
    if (key==' ')
    {
      int StarNum2=int(random(0, 4));
      while (StarNum[firedNum]==StarNum2)
      {
        StarNum2=int(random(0, 4));
      }
      StarNum[firedNum]=StarNum2;
    }
    if (gameEnd==true)
    {
      cakeWidth=75;
      girlW=75;
      girlH=100;
      starW=50;
      life=3;
      mark2=0;
      count=0;
      gameEnd=false;
      gameWin=false;

      for (int i =0; i < totalNum; i=i+1)
      {

        x[i]=random(0, 1000-cakeWidth);
        y[i]=random(-450, 0-cakeWidth);
        speed[i]=random(1, 3);
      }
      for (int j=0; j<starTotal; j=j+1)
      {
        starY[j]=750-starW;
      }
      firedNum = 0;
      image(night, 0, 0, width, height);
      image(girl, 0, 750-girlH, girlW, girlH);
      image(Star[StarNum[firedNum]], mouseX-starW/2, 750-starW, starW, starW);
    } 
    if (gameWin==true)
    {
      stageNum=5;
    }
  }
}
void mousePressed()
{
  if (stageNum==2)
  {
    if (starY[firedNum]<0)
    {
      starX[firedNum]=mouseX-starW/2;
      starY[firedNum]=750-starW/2;
      firedNum=(firedNum+1)%starTotal;
    }
  }
  if (stageNum==4)
  {
    if (firedNum<starTotal)
    {
      StarX[firedNum]=mouseX-starW/2;
      StarY[firedNum]=750-starW; 
      StarNum[(firedNum+1)%starTotal] = StarNum[firedNum];  
      firedNum=firedNum+1;
    }
  }
}


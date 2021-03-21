float[] x=new float[6];
float[] y=new float[6];
float[] xSB=new float[6];
float[] sSB=new float[6];
float[] xB=new float[600];
float[] yB=new float[600];
float[] TF=new float[600];
float[] TFB=new float[600];
float[] dmg=new float[6];
float[] spd=new float[6];
float[] s=new float [6];
float[] itv=new float [6];
float[] bShoot=new float[600];
float[] bShootX=new float[600];
float[] bShootY=new float[600];
float[] aidX=new float[600];
float[] aidY=new float[600];
float[] powerX=new float[600];
float[] powerY=new float[600];
float[] ballDirection1=new float[600];
float[] ballDirection2=new float[600];
float[] canonBallX1=new float[600];
float[] canonBallY1=new float[600];
float[] canonBallSX1=new float[600];
float[] canonBallSY1=new float[600];
float[] canonBallX2=new float[600];
float[] canonBallY2=new float[600];
float[] canonBallSX2=new float[600];
float[] canonBallSY2=new float[600];
float[] TFcanon1=new float[600];
float[] TFcanon2=new float[600];
float[] lifeBear=new float[600];

float angleP, angle, count, spin, angle2, spin2;
import ddf.minim.*;
AudioPlayer player;
AudioPlayer sound;
Minim minim;
int  JS2, JS, appear, powerC, hurt, powerTime, powerNum, aidNum, aidTime, fake1, fake2, Death, ZF, ZF2, countCanon1, countCanon2, rotateLimit, rotateLimit2, countRotate, countRotate2, change, cw, ch, pgBloodFull, pgBoodFull, pgBlood, igBlood, igBloodFull, gamePro, ballD, num, order, shootMax, shootMin, px, py, bw, bh, pw, ph, step, IGw, IGh, time, energy, countBall, startTime, energyFull;
PImage[] imgb=new PImage[6];
//PImage[] imgBBall=new PImage[600];
PImage[] imgSB=new PImage[6];
PImage imgPrettyB, imgDark, imgJDT, imgCircle, imgStory, imgRBall, imgPower, imgAgain, imgAid, imgStar, imgChoice, canonBall, imgCanon2, imgCanon, imgigBlood, imgpgBlood, imgOver, imgWin, imgWKIG, imgWKB, imgSADB, imgWKP, imgp, bk, imgIG, imgBBall, ball, imgENG;
void setup()
{
  //noLoop();
  minim=new Minim(this);
  player=minim.loadFile("summer.mp3", 2048);
  player.play();

  size(700, 800);
  imgChoice=loadImage("choice.png");
  gamePro=0;
  if (gamePro==1) {
    page1();
  }
  frameRate(60);
  ZF=1;
  ZF2=1;
  //rotateLimit=50;
  //rotateLimit2=50;
  pgBlood=10;
  pgBloodFull=10;
  igBlood=10;
  igBloodFull=10;
  ballD=30;
  //step=1;
  bw=60;
  bh=100;
  pw=60;
  ph=60;
  cw=130;
  ch=120;
  IGw=200;
  IGh=170;
  energyFull=100;
  shootMax=52-11*step;
  shootMin=2;
  spin=spin2=0.01;
  smooth();
  bk=loadImage("SnowlandBK.png");
  ball=loadImage("SnowBall.png");
  //imageMode(CENTER);
  imgJDT=loadImage("JDT.png");
  imgPrettyB=loadImage("SnowBall.png");
  imgAid=loadImage("LifeAid.png");
  imgPower=loadImage("DoublePower.png");
  imgAgain=loadImage("ReplaySign.png");
  canonBall=loadImage("BearSnowBall.png");
  imgStar=loadImage("Star.png");
  imgCanon=loadImage("Canon.png");
  imgCanon2=loadImage("Canon.png");
  imgStory=loadImage("Story.png");
  imgENG=loadImage("EnergyAccumulation2.png");
  imgigBlood=imgpgBlood=loadImage("LifeBar2.png");
  imgWin=loadImage("WinnerPenguinTextbk.jpg");
  imgOver=loadImage("GameOverBearTextbk.jpg");
  imgp=loadImage("FightingPenguin.png");
  imgDark=loadImage("dark.png");
  imgIG=loadImage("TargetIgloo.png");
  imgWKIG=loadImage("WoundedTargetIgloo.png");
  imgBBall=loadImage("BearSnowBall.png");
  imgRBall=loadImage("PowerfulSnowBall.png");
  imgWKB=loadImage("WoundedRookieBear.png");
  imgSADB=loadImage("SadRookieBear.png");
  imgCircle=loadImage("circle.png");
  aidX[0]=1000;
  powerX[0]=1000;
  //fake1=fake2=50;
  angle+=0.01;
  angleP+=0.01;
  for (int i=1; i<=5; i++)
  {
    bShoot[i]=random(shootMin, shootMax);
    if (i==1||i==2||i==4) 
    {
      imgb[i]=loadImage("RookieBear.png");
    }
    if (i==3||i==5) 
    {
      imgb[i]=loadImage("StrongBear.png");
    }

    x[i]=random(0, width-bw);
    spd[i]=random((i+1)/2, (i+2)/2);
  }
}

void draw()
{
  if (gamePro==100)
  {
    JS=JS+1;
    JS2=JS2+1;
    if (JS>=100) {
      JS=100;
    }
    angleP+=0.1;
    background(0);
    image(imgJDT, 140, 420);
    image(imgDark, 140+4*JS2, 400, 500, 120);
    textSize(35);
    fill(255);
    text("Loading..."+JS+"%", 220, 550);
    pushMatrix();
    translate(width/2, 350);
    rotate(angleP);
    image(imgCircle, -50, -50, 100, 100);
    popMatrix();
    if (JS2>=140) {
      gamePro=2;
    }
  }
  if (gamePro==0)
  {
    image(imgStory, 0, 0, 700, 800);
    textSize(50);
    fill(0);
    appear=appear+1;
    if ((appear/30)%2==0) {
      text("Press any key to start", 140, 650);
    }
  }

  if (gamePro==2) 
  {
    image(bk, 0, 0, width, height);
    image(imgIG, width/2-IGw/2, 0, IGw, IGh);
    textSize(30);
    for (int i=1; i<=step+1; i++)
    {
      image(imgStar, 150+40*(i-1), 8, 30, 30);
    }
    fill(0);
    text("Difficulty:", 10, 30);
    angle+=0.1;
    pushMatrix();
    countRotate=countRotate+1;
    if (countRotate%10==0 && int(random(1, 3))==1)
    {
      countCanon1=countCanon1+1;  
      TFcanon1[countCanon1]=1;
      canonBallSX1[countCanon1]=ZF*sin(abs(50-countRotate)/57.3)*0.9;
      canonBallSY1[countCanon1]=cos(countRotate/79);
      canonBallX1[countCanon1]=width/2-IGw/2-cw/2-10;
      canonBallY1[countCanon1]=ch;
    }
    //text(countRotate, 300, 300);
    if  (countRotate==rotateLimit/2)
    {
      ZF=-ZF;
    }
    if (countRotate>=rotateLimit+50)
    {
      spin=-spin;
      rotateLimit=50;
      countRotate=0;
    }
    translate(width/2-IGw/2-cw/2, ch);
    rotate(angle);
    image(imgCanon, -cw/2, -ch/2, cw, ch);
    popMatrix();
    angle2+=0.1;
    pushMatrix();
    countRotate2=countRotate2+1;
    if (countRotate2%10==0 && int(random(1, 3))==2)
    {
      countCanon2=countCanon2+1;  
      TFcanon2[countCanon2]=1;
      canonBallSX2[countCanon2]=ZF*sin(abs(50-countRotate2)/57.3)*0.9;
      canonBallSY2[countCanon2]=cos(abs(countRotate2)/80);
      canonBallX2[countCanon2]=width/2+IGw/2+cw/2-10;
      canonBallY2[countCanon2]=ch;
    }
    //text(countRotate2, 500, 300);
    if  (countRotate2==rotateLimit2/2)
    {
      ZF2=-ZF2;
    }
    if (countRotate2>=rotateLimit2)
    {
      spin2=-spin2;
      rotateLimit2=100;
      countRotate2=0;
    }
    translate(width/2+IGw/2+cw/2, ch);
    rotate(angle2);
    image(imgCanon2, -cw/2, -ch/2, cw, ch);
    popMatrix();

    for (int i=1; i<=countCanon1; i++)
    {
      canonBallX1[i]=canonBallX1[i]+8*canonBallSX1[i];
      canonBallY1[i]=canonBallY1[i]+8*canonBallSY1[i];
      canonBallX2[i]=canonBallX2[i]+8*canonBallSX2[i];
      canonBallY2[i]=canonBallY2[i]+8*canonBallSY2[i];
      if (TFcanon1[i]==1 )
      {
        image(canonBall, canonBallX1[i], canonBallY1[i], ballD, ballD);
      }
      if (TFcanon2[i]==1) {
        image(canonBall, canonBallX2[i], canonBallY2[i], ballD, ballD);
      }
      if (TFcanon1[i]==1 && canonBallX1[i]>mouseX-pw/2-ballD &&canonBallX1[i]<mouseX+pw/2&&canonBallY1[i]>mouseY-ph/2-ballD && canonBallY1[i]<mouseY+ph/2)
      {
        TFcanon1[i]=0;
        pgBlood=pgBlood-1;
      }
      if (TFcanon2[i]==1 && canonBallX2[i]>mouseX-pw/2-ballD &&canonBallX2[i]<mouseX+pw/2&&canonBallY2[i]>mouseY-ph/2-ballD && canonBallY2[i]<mouseY+ph/2)
      {
        TFcanon2[i]=0;
        pgBlood=pgBlood-1;
      }
    }

    //imageMode(CENTER);
    time=time+1;
    powerTime=powerTime+1;
    if (powerTime>1000) {
      powerNum=aidNum+1;
      powerX[powerNum]=random(0, 640);
      powerY[powerNum]=random(250, 700);
      powerTime=0;
    }
    image(imgPower, powerX[powerNum], powerY[powerNum], 60, 60);
    if (mouseX>powerX[powerNum]-23&&mouseX<powerX[powerNum]+pw*2-13&&mouseY>powerY[powerNum]-6&&mouseY<powerY[powerNum]+ph/2+55)
    {
      powerX[powerNum]=width+100;
      hurt=1;
      powerC=4;
      ball=loadImage("PowerfulSnowBall.png");
    }

    if (powerC<=0) {
      hurt=0;
      ball=loadImage("SnowBall.png");
    }

    aidTime=aidTime+1;
    if (aidTime>667) {
      aidNum=aidNum+1;
      aidX[aidNum]=random(0, 640);
      aidY[aidNum]=random(250, 700);
      aidTime=0;
    }
    image(imgAid, aidX[aidNum], aidY[aidNum], 80, 90);
    if (mouseX>aidX[aidNum]-23&&mouseX<aidX[aidNum]+pw*2-13&&mouseY>aidY[aidNum]-6&&mouseY<aidY[aidNum]+ph/2+55)
    {
      aidX[aidNum]=width+100;
      pgBlood=pgBlood+2;
      if (pgBlood>=10) {
        pgBlood=10;
      }
    }

    count=count+1;
    if (count>=bShoot[num])
    {
      order=int(random(1, step+2));
      count=0;
      TFB[num]=1;
      if (order==1||order==2||order==4)
      {
        bShootX[num]=x[order];
      }
      if (order==3||order==5)
      {
        bShootX[num]=x[order];
      }

      num=num+1;
      bShoot[num]=int(random(shootMin, shootMax));
    }

    //textSize(40);
    //text(time, 10, 100);

    for (int i=1; i<=step+1; i++)
    {

      if (i==1||i==2||i==4)
      {
        image(imgb[i], x[i], 70, bw, bh);
        x[i]=x[i]+spd[i];
        if (x[i]<0||x[i]>width-bw)
        {
          spd[i]=-spd[i];
        }
      }
      if (i==3||i==5)
      {
        if (mouseX<x[i]+bw/2)
        {
          sSB[i]=-spd[i];
        }
        if (mouseX>x[i]+bw/2) 
        {
          sSB[i]=spd[i];
        }
        x[i]=x[i]+sSB[i]/1.5;
        image(imgb[i], x[i], 70, bw, bh);
      }
    }
    for (int j=1; j<=599; j++)
    {

      if (yB[j]<150 && TF[j]==1)
      {
        if (yB[j]<120 && TF[j]==1)
        {
          if (xB[j]>width/2-IGw/2-ballD && xB[j]<width/2+IGw/2)
          {
            TF[j]=0;
            igBlood=igBlood-1-hurt;
            if (igBlood<=0)
            {
              gamePro=5;
            }
            if (igBlood<=5)
            {
              imgIG=imgWKIG;
            }
          }
        }
        for (int i=1; i<=step+1; i++)
        {
          if (xB[j]>x[i]-ballD && xB[j]<x[i]+bw)
          {
            TF[j]=0;
            lifeBear[i]=lifeBear[i]+1+hurt;
            if (lifeBear[i]==2) {
              imgb[i]=imgSADB;
            }
            if (lifeBear[i]==4) {
              imgb[i]=imgWKB;
            }
            if (lifeBear[i]>=5) {
              y[i]=1000;
            }
          }
        }
      }
      if (yB[j]>50 && TF[j]==1)
      {
        yB[j]=yB[j]-5;
        image(ball, xB[j], yB[j], ballD, ballD);
      }
      if (yB[j]<=50)
      {
        TF[j]=0;
      }
    }
    for (int i=1; i<=num+1; i++)
    {
      if (TFB[i]==1)
      {
        bShootY[i]=bShootY[i]+8;
        if (TFB[i]==1 && bShootX[i]>mouseX-pw/2-ballD &&bShootX[i]<mouseX+pw/2&& bShootY[i]>mouseY-ph/2-ballD-ph*1.5 && bShootY[i]<mouseY+ph/2-ph*1.5)
        {
          TFB[i]=0;
          pgBlood=pgBlood-1;
        }
        if (pgBlood<=0)
        {
          gamePro=4;
        }
        image(imgBBall, bShootX[i], 100+bShootY[i], ballD, ballD);
      }
    }
    image(imgp, mouseX-pw/2, mouseY-ph/2, pw, ph);
    energy=energy+2;
    text("IGLOO",width-200,223);
    text("Blood",width-200,height-130);
    text("Energy",width-210,height-80);
    if (igBlood<=igBloodFull)
    {
      image(imgigBlood, width-100, 200, 100*igBlood/igBloodFull, 30);
    }
    if (energy<=energyFull)
    {
      image(imgENG, width-100, height-100, 100*energy/energyFull, 30);
    }
    if (energy>energyFull)
    {
      image(imgENG, width-100, height-100, 100, 30);
    }
    image(imgpgBlood, width-100, height-150, 100*pgBlood/pgBloodFull, 30);
  }
  if (gamePro==4)
  {
    image(imgOver, 0, 0, width, height);
    image(imgAgain, 280, 480, 120, 110);
    player.close();
    fill(0, 0, 255);
    textSize(30);
    text("Retry", 290, 640);
    appear=appear+1;
    if ((appear/30)%2==0) {
      text("Press ESC to exit", 220, 700);
    }
  }
  if (gamePro==5)
  {

    step=step+1;
    igBlood=10;
    if (step<=4) {
      page1();
      gamePro=1;
    }

    if (step>=5) {
      image(imgWin, 0, 0, width, height);
      appear=appear+1;
      if ((appear/30)%2==0) {
        text("Press ESC to exit", 220, 700);
      }
    }
  }
}

//void aid()
//{//aidX=
//image(imgAid,random(0,640),random(250,700));}
void page1()
{
  image(imgChoice, 0, 0, width, height);
}
void mousePressed()
{
  if (gamePro==1&&mouseX>268&&mouseX<660&&mouseY>270&&mouseY<350)
  {
    gamePro=100;
    JS=JS2=0;
    for (int i=1; i<=5; i++)
    {
      bShoot[i]=random(shootMin, shootMax);
      if (i==1||i==2||i==4) 
      {
        imgb[i]=loadImage("RookieBear.png");
      }
      if (i==3||i==5) 
      {
        imgb[i]=loadImage("StrongBear.png");
      }
      gamePro=100;
      x[i]=random(0, width-bw);
      spd[i]=random((i+1)/2, (i+2)/2);
    }
  }
  if (gamePro==1&&mouseX>268&&mouseX<660&&mouseY>625&&mouseY<705)
  {
    gamePro=4;
  }
  if (gamePro==4&&dist(mouseX, mouseY, 350, 550)<=100)
  {
    setup();step=0;
  }
}
void keyPressed()
{
  if (gamePro==0) {
    gamePro=1;
    page1();
  }
  if (key=='s'&&energy>=energyFull) 
  {
    powerC=powerC-1;
    countBall=countBall+1;
    TF[countBall]=1;
    xB[countBall]=mouseX;
    yB[countBall]=mouseY;
    image(ball, mouseX, mouseY, ballD, ballD);
    energy=0;
  }
  if (keyCode==ESC)
  {
    exit();
  }
}


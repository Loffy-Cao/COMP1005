


PImage bgWelcome, Precision_Slect;
import gifAnimation.*;

Gif bggif;
import ddf.minim.*;
Minim minim;
AudioPlayer welcomePlayer;
int storyModeX, storyModeY, welcomeTextSize;
int welcomeClickCount;
boolean welcomePlayerJ;
// Welcome Page
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------
//---------------------------------------------------------
int storyModeFinishNumber;// finishing number counts
int textSizePlayBg, textBgX, textBgY, PlayBgIntroductionT, PlayBgIntroductionTime;
int introductionClickCount=0;
import ddf.minim.*;
Minim minimIntroduction;
AudioPlayer introductionPlayer;
boolean introductionPlayerJ;
//introduction over
//-------
PImage how_play_bg, increaseFirePower, increaseHP, increaseMP;
int how_play_textSize1, how_play_textSize2, how_play_textX, how_play_textY, how_play_textX2, how_play_textY2;
//how to play over
//--------
int chooseTypeX, chooseTypeY, chooseTypeXX, chooseTypeYY, chooseTypeTextSize1, chooseTypeTextSize2;
float typeDefenceHP=1000;
float typeDefenceAttack=1;
float typeBalanceHP=800;
float typeBalanceAttack=200;
float typeAttackHP=500;
float typeAttackAttack=3;
float heroAttack, heroAttackx;
int typeT;
//choose type over
//
//
//
//
//
//
PImage bg, chooseShape1, chooseShape2, chooseShape3;
int chooseShapeX, chooseShapeY, chooseShapeXX, chooseShapeYY, chooseShapeTextSize1, chooseShapeTextSize2;
int heroIs;
float hero1W, hero1H, hero2W, hero2H, hero3W, hero3H;

PImage hero;//choose hero
float heroHPshow=200;
PImage explode;
float [] explodeT=new float[4];
float [] explodeX=new float [4];
float [] explodeY=new float [4];
float enemyHPshow;
int swardnumber=9;
float [] swardX=new float [swardnumber*9];
float [] swardY=new float [swardnumber*9];
PImage sward;
float swardR=50;
float swardW=15;
float swardH=90;
float enemykind, swardn;
float[] swardC=new float [3];
float [] swardtime=new float [3];

float []empty={};

import ddf.minim.*;
Minim minimJYMY;
AudioPlayer JYMY;
boolean JYMYJ=true;

import ddf.minim.*;
Minim minimJYYM;
AudioPlayer JYYM;
boolean JYYMJ=true;

import ddf.minim.*;
Minim minimSRPZ;
AudioPlayer SRPZ;
boolean  SRPZJ=true;// SRPZJ=trueYJZYJ=true

import ddf.minim.*;
Minim minimYJZY;
AudioPlayer YJZY;
boolean YJZYJ=true;

import ddf.minim.*;
Minim minimJJYY;
AudioPlayer JJYY;

boolean JJYYJ=true;
import ddf.minim.*;
Minim minimHMYX;
AudioPlayer HMYX;
boolean HMYXJ=true;

import ddf.minim.*;
Minim minimQFYQ;
AudioPlayer QFYQ;
boolean QFYQJ=true;

import ddf.minim.*;
Minim minimSNF;
AudioPlayer SNF;
boolean  SNFJ=true;// PLAY MUSIC 


import ddf.minim.*;
Minim minimZSBZ;
AudioPlayer ZSBZ;
boolean ZSBZJ=true;


float easy=1;
float normal=2;
float hard=4;
float difficulty;
//choose difficulty


float bgy,bgdy;







float HP, HPHeight, HPWidth, MP, MPHeight, MPWidth, totalHeight, HPC, increaseFirePowerC, increaseFireT;// display HP and MP,HERO
int increaseFireC;
PImage playBg;
boolean enemyJ, enemy1stJ;
int wave;
int enemy1stCount=4;
float enemy1stHP;
float[] enemy1stX=new float[enemy1stCount];
PImage enemy1st;
float [] dx=new float[enemy1stCount];
float [] dy=new float[enemy1stCount];
float[] enemy1stY=new float[enemy1stCount];
float enemy1stW=150;
float enemy1stH=120;
boolean dxdyJ=true;
float []  enemy1stHPX=new float[enemy1stCount];
boolean waveaddJ=true;
float enemyattack=1;

PImage missile;
float[] missileX1=new float [enemy1stCount];
float[] missileY1=new float [enemy1stCount];
float[] missileX2=new float [enemy1stCount];
float[] missileY2=new float [enemy1stCount];
float[]missilewait=new float [enemy1stCount];
float[]missilbefirewait=new float [enemy1stCount];
float missileW=20;
float missileH=60;
boolean [] missilefireposition=new boolean[enemy1stCount];
float [] missilegetdx1=new float[enemy1stCount];
float [] missilegetdy1=new float[enemy1stCount];
float [] missilegetdx2=new float[enemy1stCount];
float [] missilegetdy2=new float[enemy1stCount];
float [] missilefirewait=new float[enemy1stCount];
boolean[] enemy1stalive=new boolean[enemy1stCount];
float enemy1staliveC;
float [] enemy1stalivetest=new float[enemy1stCount];
float[] missileradius1=new float[enemy1stCount];
float[] missileradius2=new float[enemy1stCount];
float missilev=3 ; 
float missileattack=2;

float enemyBallX[]= {};
float enemyBallY[]= {};
float enemyBalldx[]= {};
float enemyBalldy[]= {};
float enemyBallW, enemyBallH;
PImage enemyBallimage;

int enemy3stT;

float heroH, heroW;

PImage enemyexplode[]= {};
PImage circlefire;
float [] circlefirewait = new float[enemy1stCount];
float circlefirev=1;
int circlefirenumber=20;
float[] circlefireX1=new float[circlefirenumber];
float[] circlefireY1=new float[circlefirenumber];
float[] circlefireX2=new float[circlefirenumber];
float[] circlefireY2=new float[circlefirenumber];
float[] circlefireX3=new float[circlefirenumber];
float[] circlefireY3=new float[circlefirenumber];
float[] circlefireX4=new float[circlefirenumber];
float[] circlefireY4=new float[circlefirenumber];

int herofireN=100;
float [] herofirex1=new float [herofireN];
float [] herofirey1=new float [herofireN];
float [] herofirex2=new float [herofireN];
float [] herofirey2=new float [herofireN];
float [] herofireC=new float[herofireN];
boolean herofireJ=true;
PImage herofire;
float herofirew=120;
float herofireh=120;
float t;


float awardhpx[]= {};
float awardhpy[]= {};
float awardmpx[]= {};
float awardmpy[]= {};
float awardfirex[]= {};
float awardfirey[]= {};
PImage awardpicture[]= {};
float awardhpdx []= {};
float awardhpdy[]= {};
float awardmpdx[]= {};
float awardmpdy[]= {};
float awardfiredx[]= {};
float awardfiredy[]= {};

boolean gameoverJ=true;
PImage gameOverBg;
int gameOverTextX, gameOverTextY, gameOverTextSize;

float MPC;
PImage withoutbeinghurting;
float withoutbeinghurtingw, withoutbeinghurtingh;
int enemy3stFireN=600;
float [] enemy3stFireX=new float [enemy3stFireN];
float [] enemy3stFireY=new float [enemy3stFireN];
float enemy3stdx, enemy3stdy, enemy3stFireT;
float [] enemy3stFireTTT=new float[enemy3stFireN];
PImage enemy3stFire;
float enemy3stFireW=10;
float enemy3stFireH=80;

float enemy4stDivideT=3000;
float enemy4stAttackT;
float enemy4stAttackdx;
float enemy4stAttackdy;


PImage gameWinBg;
int gameWinTextX, gameWinTextY, gameWinTextSize;

int gameMark;
int hightestMark;
float infinitetextSize,infinitetextX,infinitetextY;
PImage infiniteNewRecord;
PImage infiniteNormal;

PImage XJ;
PImage GJ;
PImage welcomeStoryMode;
PImage welcomeInfiniteMode;
PImage welcomeIntroduction;
float welcomeW;
float welcomeH;
void setup()
{
  size(950, 1000);
  bgWelcome=loadImage("bgWelcome.jpg");
  bggif=new Gif(this, "bggif.gif");
  bggif.play();
  welcomeTextSize=50;
  storyModeX=100;
  storyModeY=600;
  minim = new Minim(this);
  welcomePlayer = minim.loadFile("LQS.mp3");
  welcomePlayer.loop();
  //welcome page over
  //----------
  //-----------
  //----------
  
  welcomeStoryMode=loadImage("welcomeStoryMode.png");
  welcomeInfiniteMode=loadImage("welcomeInfiniteMode.png");
  welcomeIntroduction=loadImage("welcomeIntroduction.png");
  
  bg=loadImage("bg.png");
  textSizePlayBg=30;
  textBgX=50;
  textBgY=100;
  minimIntroduction = new Minim(this);
  introductionPlayer= minim.loadFile("YMCH.mp3");
  //play introduction over
  //------
  //-------
  how_play_bg=loadImage("bg.png");
  how_play_textSize1=30;
  how_play_textSize2=20;
  how_play_textX=50;
  how_play_textY=100;
  how_play_textX2=200;
  how_play_textY=100;
  increaseHP=loadImage("increaseHP.png");
  increaseMP=loadImage("increaseMP.png");
  increaseFirePower=loadImage("increaseFirePower.png");
  // how to play over
  //------
  chooseTypeX=300;
  chooseTypeY=300;
  chooseTypeXX=100;
  chooseTypeYY=600;
  bg=loadImage("bg.png");
  chooseTypeTextSize1=50;
  chooseTypeTextSize2=40;
  //choose type over------2018.3.6
  //------
  //--

  t=0;
   

  chooseShapeX=200;
  chooseShapeY=300;
  chooseShapeXX=100;
  chooseShapeYY=600;
  bg=loadImage("bg.png");
  chooseShapeTextSize1=50;
  chooseShapeTextSize2=40;
  chooseShape1=loadImage("hero1.png");
  chooseShape2=loadImage("hero2.png");
  chooseShape3=loadImage("hero3.png");
  hero1W=120;
  hero1H=100;
  hero2W=120;
  hero2H=115;
  hero3W=120;
  hero3H=110;
  //----- normal

  herofire=loadImage("herogun.png");
  sward=loadImage("sward.png");


  bgy=0;
  bgdy=1;

  playBg=loadImage("bg.png");

  minimJYMY = new Minim(this);
  JYMY =  minimJYMY.loadFile("JYMY.mp3");

  minimJYYM = new Minim(this);
  JYYM = minimJYYM.loadFile("JYYM.mp3");

  minimSRPZ = new Minim(this);
  SRPZ = minimSRPZ.loadFile("SRPZ.mp3");

  minimYJZY = new Minim(this);
  YJZY = minimYJZY.loadFile("YJZY.mp3");

  minimJJYY = new Minim(this);
  JJYY = minimJJYY.loadFile("JJYY.mp3");

  minimHMYX = new Minim(this);
  HMYX = minimHMYX.loadFile("HMYX.mp3");

  minimJYMY = new Minim(this);
  JYMY = minimJYMY.loadFile("JYMY.mp3");

  minimQFYQ=new Minim(this);
  QFYQ=minimQFYQ.loadFile("QFYQ.mp3");

  minimSNF = new Minim(this);
  SNF = minimSNF.loadFile("SNF.mp3");
  
    minimZSBZ = new Minim(this);
  ZSBZ = minimZSBZ.loadFile("ZSBZ.mp3");

  enemy1st=loadImage("st1.png");
  missile=loadImage("missile.png");
  
  
  for (int i=0; i<missilefireposition.length; i++)
  {
    missilefireposition[i]=true;
    HPHeight=200;
    HPWidth=30;
    MPHeight=200;
    MPWidth=30;
  }

  circlefire=loadImage("st1gun.png");

  for (int i=0; i<3; i++)
    swardtime[i]=600;

  gameOverBg=loadImage("gameOver.png");
  gameOverTextX=50;
  gameOverTextY=100;
  gameOverTextSize=30;
  storyModeFinishNumber=0;

  MPC=0;
  withoutbeinghurting=loadImage("without hurting.png");
  withoutbeinghurtingw=300;
  withoutbeinghurtingh=300;
  explode=loadImage("explode.png");


  enemy3stFire=loadImage("enemy3stFire.png");
  enemy3stFireT=0;

  gameWinBg=loadImage("gameWinBg.jpg");
  gameWinTextX=50;
  gameWinTextY=100;
  gameWinTextSize=30;
  
  infiniteNewRecord=loadImage("newRecord.jpg");
  infiniteNormal=loadImage("normal.jpg");
  
  XJ=loadImage("XJ1.png");
  GJ=loadImage("GJ1.png");
  
}







void draw()
{
  if (welcomeClickCount==0)
  {
    welcomePage();
    if (mouseX<=375 && mouseX>=storyModeX && mouseY<=storyModeY && mouseY>=storyModeY-50)
    {
      fill(255,0,0);
      welcomeW=400;
      welcomeH=400;
      line(375,storyModeY-25,500,storyModeY-25);
      image(welcomeStoryMode,530,storyModeY-25-welcomeW/2,welcomeW,welcomeH);
    }
    //story mode
    if (mouseX<=420 && mouseX>=storyModeX && mouseY<=storyModeY+100 && mouseY>=storyModeY+50&&storyModeFinishNumber>0)
    {
      fill(255,0,0);
       welcomeW=400;
      welcomeH=400;
      line(420,storyModeY+75,500,storyModeY+75);
      image(welcomeInfiniteMode,530,storyModeY+75-welcomeW/2,welcomeW,welcomeH);
    }
    //infinite mode
    if (mouseX<=395&&mouseX>=storyModeX&&mouseY<=storyModeY+200&&mouseY>=storyModeY+150)
    {
      fill(255,0,0);
       welcomeW=400;
      welcomeH=400;
     line(395,storyModeY+175,500,storyModeY+175);
      image(welcomeIntroduction,530,storyModeY+175-welcomeW/2,welcomeW,welcomeH);
      
    }
  }  


  if (welcomeClickCount==1)
  {
    if (introductionClickCount==0)
    {
      if (introductionPlayerJ==true)
      {
        introductionPlayer.loop();
        introductionPlayerJ=false;
        welcomePlayer.pause();
        welcomePlayer.rewind();
        
      }
      for(int i=0; i<awardhpx.length; i++)
      awardhpx[i]=-1000;
      for(int i=0; i<awardmpx.length; i++)
      awardmpx[i]=-1000;
      for(int i=0; i<awardfirex.length; i++)
      awardfirex[i]=-1000;

      gameBackground();
    }

    //introduction page over
    //-------
    if (introductionClickCount==1)
    {
      gameHowToPlay();
    }




    if (introductionClickCount==2)
    {
      gameChooseType();
    }
    //choose type of hero over
    // choose type --------------------------2018.3.6
    //--------
    //--------
    if (introductionClickCount==3)
    {
      gameChooseHero();
    }
    //choose hero over------2018.3.6 
    //do how to choose hero---2018.3.6 done







    if (introductionClickCount==4)
    {
      gameChooseDifficulty();
    }





    if (introductionClickCount==5)
    {
      showsHPMP();

      if (enemyJ==true)
      {
        introductionPlayer.pause();
        introductionPlayer.rewind();
        wave=1;
        JYMYJ=true;
        JYYMJ=true;
        SRPZJ=true;
        YJZYJ=true;
        gameoverJ=true;
        HMYXJ=true;
        enemyJ=false;
        gameMark=0;
      }





      enemyimportant();



      heroFire();



      showsincreaseFireC();
      awardball();






      if (wave>10)
        introductionClickCount=7;

      if (HP<=0)
      {
        introductionClickCount=6;
        
      }
      fill(255,0,0);
      textSize(30);
      text("Mark :   "+ gameMark,0,60);
     
    }
    if (introductionClickCount==6)
    {
      if (gameoverJ==true)
      {
        JYMY.pause();
        JYMY.rewind();
        JYYM.pause();
        JYYM.rewind();
        SRPZ.pause();
        SRPZ.rewind();
        YJZY.pause();
        YJZY.rewind();
        JJYY.loop();
        gameoverJ=false;
        gameMark=0;
      }
 
    
      
      gameOver();
      
      emptyx();
      
    }
    if (introductionClickCount==7)
    {
      if (HMYXJ==true)
      {
        JYMY.pause();
        JYMY.rewind();
        JYYM.pause();
        JYYM.rewind();
        SRPZ.pause();
        SRPZ.rewind();
        YJZY.pause();
        YJZY.rewind();
        HMYX.loop();
        HMYXJ=false;
        storyModeFinishNumber++;
      }
      gameWin();
      emptyx();
      gameMark=0;
    }
  }











  if (welcomeClickCount==2)
  {
    if(introductionClickCount==2)
    {
      if (introductionPlayerJ==true)
      {
        introductionPlayer.loop();
        introductionPlayerJ=false;
        welcomePlayer.pause();
        welcomePlayer.rewind();
        welcomePlayerJ=true;
        gameMark=0;
      }
      for(int i=0; i<awardhpx.length; i++)
      awardhpx[i]=-1000;
      for(int i=0; i<awardmpx.length; i++)
      awardmpx[i]=-1000;
      for(int i=0; i<awardfirex.length; i++)
      awardfirex[i]=-1000;

      gameChooseType();
    }
    if (introductionClickCount==3)
    {
      gameChooseHero();
    }
    if (introductionClickCount==4)
    {
      gameChooseDifficulty();
    }
    if(introductionClickCount==5)
    {
      introductionPlayer.pause();
      introductionPlayer.rewind();
      showsHPMP();
  
      if (enemyJ==true)
      {
        
        gameoverJ=true;
        HMYXJ=true;
        enemyJ=false;
      }
      
  
  
      enemyimportant();
  
  
  
      heroFire();
  
  
  
      showsincreaseFireC();
      awardball();
      fill(255,0,0);
      textSize(30);
      text("Mark :   "+ gameMark,0,60);
      if(HP<0)
      {
        QFYQ.pause();
        QFYQ.rewind();
       
        
        if(gameMark>hightestMark)
        {
         introductionClickCount=6;
          hightestMark=gameMark;
          ZSBZ.loop();
        }
        else
        {
          introductionClickCount=7;
          SNF.loop();
        }
      }
    }
      if(introductionClickCount==6)
      {
        
        image(infiniteNewRecord,0,0,width,height);
          fill(255,0,0);
          infinitetextSize=50;
          infinitetextX=100;
          infinitetextY=200;
          textSize( infinitetextSize);
         
          text("New Record :   " +hightestMark,infinitetextX,infinitetextY);
          text("Hero Type :",infinitetextX,infinitetextY+infinitetextSize*2);
          text("Hero Shape :",infinitetextX,infinitetextY+infinitetextSize*4); 
          image(hero,infinitetextX+infinitetextSize*7,infinitetextY+infinitetextSize*3,100,100);
         
          text("Difficulty :",infinitetextX,infinitetextY+infinitetextSize*6);
          fill(0,255,0);
          textSize(30);
          if(typeT==1)
          text("Defence",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*2);
           if(typeT==2)
          text("Blance",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*2);
           if(typeT==3)
          text("Attack",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*2);
           if(difficulty==1)
           text("easy",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*6);
           if(difficulty==2)
            text("normal",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*6);
           if(difficulty==4)
            text("hard",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*6);
          text("Press R To Go Back Home Page",infinitetextX,infinitetextY+infinitetextSize*10);
          text("Press E To Go Back Home Page",infinitetextX,infinitetextY+infinitetextSize*12);
          emptyx();
          
        
      }
    if(introductionClickCount==7)
    {
      image(infiniteNormal,0,0,width,height);
      fill(0,0,255);
      infinitetextSize=50;
      infinitetextX=100;
      infinitetextY=100;
      textSize( infinitetextSize);
      text("Record :   "+hightestMark,infinitetextX,infinitetextY);
      text("This Mark :   "+gameMark,infinitetextX,infinitetextY+infinitetextSize*2);
       text("Hero Type :",infinitetextX,infinitetextY+infinitetextSize*4);
       text("Hero Shape :",infinitetextX,infinitetextY+infinitetextSize*6); 
        image(hero,infinitetextX+infinitetextSize*7,infinitetextY+infinitetextSize*5,100,100);
       text("Difficulty :",infinitetextX,infinitetextY+infinitetextSize*8);
      fill(0,255,0);
          textSize(30);
          if(typeT==1)
          text("Defence",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*4);
           if(typeT==2)
          text("Blance",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*4);
           if(typeT==3)
          text("Attack",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*4);
           if(difficulty==1)
           text("easy",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*8);
           if(difficulty==2)
            text("normal",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*8);
           if(difficulty==4)
            text("hard",infinitetextX+infinitetextSize*6,infinitetextY+infinitetextSize*8);
      text("Press R To Go Back Home Page",infinitetextX+100,infinitetextY+infinitetextSize*10);
      text("Press E To Go Back Home Page",infinitetextX+100,infinitetextY+infinitetextSize*12);
      emptyx();
     
    }
  }
  
  if(welcomeClickCount==3)
  {
    if(introductionClickCount==0)   
    gameBackground();
    
    if(introductionClickCount==1)
    
    {
      bgy=0;
      gameHowToPlay();
    }
    if(introductionClickCount==2)
    
    {
      image(XJ,0,0,width,height);
    }
    if(introductionClickCount==3)
    
    {
      image(GJ,0,0,width,height);
    }
  }

  t++;

 
  
}




void mousePressed()
{
  if (welcomeClickCount==0)
  {

    if (mouseX<=375 && mouseX>=storyModeX && mouseY<=storyModeY && mouseY>=storyModeY-50)
    {
      welcomeClickCount=1;
    }
    //story mode
    if (mouseX<=420 && mouseX>=storyModeX && mouseY<=storyModeY+100 && mouseY>=storyModeY+50&&storyModeFinishNumber>0)
    {
      welcomeClickCount=2;
      introductionClickCount=2;
    }
    //infinite mode
    if (mouseX<=395&&mouseX>=storyModeX&&mouseY<=storyModeY+200&&mouseY>=storyModeY+150)
    {
      welcomeClickCount=3;
      
    }
    //introduction
    if (mouseX<=190&&mouseX>=storyModeX&&mouseY<=storyModeY+300&&mouseY>=storyModeY+250)
    {
      exit();
    }
  }
  //welcome page over---2018.3.6
  //
  //


  //choose type                       


  if ((welcomeClickCount==1 || welcomeClickCount==2) && introductionClickCount==2)
  {
    if (mouseX<=260 && chooseTypeXX<=mouseX && mouseY<=chooseTypeYY && mouseY>=560)
    {
      HP=typeDefenceHP;
      HPC=typeDefenceHP;
      MP=100;
      heroAttack=typeDefenceAttack;
      heroAttackx=typeDefenceAttack;
      introductionClickCount=3;
      typeT=1;
    }
    if (mouseX<=525 && chooseTypeXX+300<=mouseX && mouseY<=chooseTypeYY && mouseY>=560)
    {
      HP= typeBalanceHP;
      HPC= typeBalanceHP;
      MP=100;
      heroAttack=typeBalanceAttack;
      heroAttackx=typeBalanceAttack;
      introductionClickCount=3;
      typeT=2;
    }
    if (mouseX<=820 && chooseTypeXX+600<=mouseX && mouseY<=chooseTypeYY && mouseY>=560)
    {
      HP=typeAttackHP;
      HPC=typeAttackHP;
      MP=100;
      heroAttack=typeAttackAttack;
      heroAttackx=typeAttackAttack;
      introductionClickCount=3;
      typeT=3;
    }
  }




  if ((welcomeClickCount==1 || welcomeClickCount==2) && introductionClickCount==3)
  {
    if (mouseX<=chooseShapeXX+hero1W && chooseShapeXX<=mouseX && mouseY<=chooseShapeYY+hero1H && chooseShapeYY<=mouseY)
    {
      hero=loadImage("hero1.png");
      heroW=hero1W;
      heroH=hero1H;
      introductionClickCount=4;
    }
    if (mouseX<=chooseShapeXX+300+hero2W && chooseShapeXX+300<=mouseX && mouseY<=chooseShapeYY+hero2H && chooseShapeYY<=mouseY)
    {
      hero=loadImage("hero2.png");
      heroW=hero2W;
      heroH=hero2H;
      introductionClickCount=4;
    }
    if (mouseX<=chooseShapeXX+600+hero3W && chooseShapeXX+600<=mouseX && mouseY<=chooseShapeYY+hero3H && chooseShapeYY<=mouseY)
    {
      hero=loadImage("hero3.png");
      heroW=hero3W;
      heroH=hero3H;
      introductionClickCount=4;
    }
  }
  if ((welcomeClickCount==1 || welcomeClickCount==2) && introductionClickCount==4)
  {
    if (mouseX<=185 && chooseTypeXX<=mouseX && mouseY<=chooseTypeYY && mouseY>=560)
    {
      difficulty=easy;
      introductionClickCount=5;
    }
    if (mouseX<=540 && chooseTypeXX+300<=mouseX && mouseY<=chooseTypeYY && mouseY>=560)
    {
      difficulty=normal;
      introductionClickCount=5;
    }
    if (mouseX<=790 && chooseTypeXX+600<=mouseX && mouseY<=chooseTypeYY && mouseY>=560)
    {
      difficulty=hard;
      introductionClickCount=5;
    }
  }
  if (welcomeClickCount==1 && introductionClickCount==6)
  {
    if ((mouseX<650&&mouseX>250&&mouseY<580&&mouseY>560)||(mouseX<400&&mouseX>300&&mouseY>590&&mouseY<610))
    {

      welcomeClickCount=1;
      introductionClickCount=0;
      JJYY.pause();
      JJYY.rewind();
      wave=1;
      welcomePlayerJ=true;
      introductionPlayerJ=true;
      
      JJYYJ=true;
      enemyJ=true;
      gameoverJ=true;
      enemy1stJ=true;
    }
    if ((mouseX>150&&mouseX<680&&mouseY>670&&mouseY<700)||(mouseX>300&&mouseX<450&&mouseY>710&&mouseY<735))
    {
      welcomeClickCount=0;
      introductionClickCount=0;
      JJYY.pause();
      JJYY.rewind();
      wave=1;
      welcomePlayerJ=true;
      introductionPlayerJ=true;
      JJYYJ=true;
      enemyJ=true;
      gameoverJ=true;
      enemy1stJ=true;
    }
  }
}
void keyPressed()
{
  
  if (welcomeClickCount==1 && introductionClickCount==1)
    introductionClickCount=2;// how to play over
  if (welcomeClickCount==1 && introductionClickCount==0)
    introductionClickCount=1;// introduction over
     if(welcomeClickCount==3&&introductionClickCount==3)
  {
    welcomeClickCount=0;
    introductionClickCount=0;
  }
  if(welcomeClickCount==3&&introductionClickCount==2)
  {
    welcomeClickCount=3;
    introductionClickCount=3;
  }
  if(welcomeClickCount==3&&introductionClickCount==1)
  {
    welcomeClickCount=3;
    introductionClickCount=2;
  }
  if(welcomeClickCount==3&&introductionClickCount==0)
  {
    welcomeClickCount=3;
    introductionClickCount=1;
  }
  if (introductionClickCount==5&&(key=='s'|| key=='S')&&MP>0&&HP>0)
  {
    image(withoutbeinghurting, mouseX-withoutbeinghurtingw/2, mouseY-withoutbeinghurtingh/2, withoutbeinghurtingw, withoutbeinghurtingh);
    enemyattack=0;
    missileattack=0;
    if (MPC%6==0)
      MP=MP-1;
    MPC=MPC+1;
    for (int i=0; i<enemyBallX.length; i++)
    {
      if (mouseX-withoutbeinghurtingw/2<enemyBallX[i]+enemyBallW&&enemyBallX[i]<mouseX+withoutbeinghurtingw/2&&mouseY-withoutbeinghurtingh/2<enemyBallY[i]+enemyBallH&&enemyBallY[i]<mouseY+withoutbeinghurtingh/2)
      {
        MP=MP-3;
        enemyBallX[i]=-1000;
      }
    }
    for (int i=0; i<enemy1stX.length; i++)
    {
      if (mouseX-withoutbeinghurtingw/2<missileX1[i]+missileW&&missileX1[i]<mouseX+withoutbeinghurtingw/2&&mouseY-withoutbeinghurtingh/2<missileY1[i]+missileH&&missileY1[i]<mouseY+withoutbeinghurtingh/2)
      {
        HP=HP-missileattack;
        missileX1[i]=-1000;
        missileY1[i]=-1000;
        missilegetdx1[i]=0;
        missilegetdy1[i]=0;
      }
      if (mouseX-withoutbeinghurtingw/2<missileX2[i]+missileW&&missileX2[i]<mouseX+withoutbeinghurtingw/2&&mouseY-withoutbeinghurtingh/2<missileY2[i]+missileH&&missileY2[i]<mouseY+withoutbeinghurtingh/2)
      {
        HP=HP-missileattack;
        missileX2[i]=-1000;
        missileY2[i]=-1000;
        missilegetdx2[i]=0;
        missilegetdy2[i]=0;
      }
    }
    for (int j=0; j<circlefireX1.length; j++)
    {
      if (mouseX-withoutbeinghurtingw/2< circlefireX1[j]+30&& circlefireX1[j]<mouseX+withoutbeinghurtingw/2&&mouseY-withoutbeinghurtingw/2<circlefireY1[j]+30&&circlefireY1[j]<mouseY+withoutbeinghurtingw/2)// problems
      {
        circlefireX1[j]=-100000000;
        circlefireY1[j]=-100000000;
      }
      if (mouseX-withoutbeinghurtingw/2< circlefireX2[j]+30&& circlefireX2[j]<mouseX+withoutbeinghurtingw/2&&mouseY-withoutbeinghurtingw/2<circlefireY2[j]+30&&circlefireY2[j]<mouseY+withoutbeinghurtingw/2)// problems
      {
        circlefireX1[j]=-100000000;
        circlefireY1[j]=-100000000;
      }
      if (mouseX-withoutbeinghurtingw/2< circlefireX3[j]+30&& circlefireX3[j]<mouseX+withoutbeinghurtingw/2&&mouseY-withoutbeinghurtingw/2<circlefireY3[j]+30&&circlefireY3[j]<mouseY+withoutbeinghurtingw/2)// problems
      {
        circlefireX1[j]=-100000000;
        circlefireY1[j]=-100000000;
      }
      if (mouseX-withoutbeinghurtingw/2< circlefireX4[j]+30&& circlefireX4[j]<mouseX+withoutbeinghurtingw/2&&mouseY-withoutbeinghurtingw/2<circlefireY4[j]+30&&circlefireY4[j]<mouseY+withoutbeinghurtingw/2)// problems
      {
        circlefireX1[j]=-100000000;
        circlefireY1[j]=-100000000;
      }
      if (mouseX-withoutbeinghurtingw/2<swardX[j]+swardW&&swardX[j]<mouseX+withoutbeinghurtingw/2&&mouseY-withoutbeinghurtingw/2<swardY[j]+swardH&&swardY[j]<mouseY+withoutbeinghurtingw/2)
      {
        swardX[j]=-10000000;
        swardY[j]=-10000000;
      }
    }
    for (int d=0; d<enemy3stFireX.length; d++)
    {
      if (mouseX-withoutbeinghurtingw/2<enemy3stFireX[d]+enemy3stFireW&&enemy3stFireX[d]<mouseX+withoutbeinghurtingw/2&&mouseY-withoutbeinghurtingh/2<enemy3stFireY[d]+enemy3stFireH/2&&enemy3stFireY[d]<mouseY+withoutbeinghurtingh/2)
        enemy3stFireY[d]=height;
    }
  }

  if (introductionClickCount==5&&(key=='D' || key=='d')&&increaseFireC>0)
  {
    increaseFireT=increaseFireT+600;
    increaseFireC=increaseFireC-1;
  }
  if ((welcomeClickCount==1&&introductionClickCount==7&&(key=='r' || key=='R')))
  {
    welcomeClickCount=0;
    introductionClickCount=0;
    HMYX.pause();
    HMYX.rewind();
    wave=1;
    welcomePlayerJ=true;
    introductionPlayerJ=true;
    JJYYJ=true;
    enemyJ=true;
    enemy1stJ=true;
  }
  if(welcomeClickCount==2&&(introductionClickCount==6 ||introductionClickCount==7)&&(key=='r' ||key=='R'))
  {
    welcomeClickCount=0;
    introductionClickCount=0;
    gameMark=0;
    welcomePlayerJ=true;
    introductionPlayerJ=true;
    QFYQJ=true;
    SNFJ=true;
    enemyJ=true;
    SNF.pause();
    SNF.rewind();
    ZSBZ.pause();
    ZSBZ.rewind();
    enemy1stJ=true;
  }
  if(welcomeClickCount==2&&(introductionClickCount==6 ||introductionClickCount==7)&&(key=='e' ||key=='E'))
  {
    welcomeClickCount=2;
    introductionClickCount=2;
    gameMark=0;
    welcomePlayerJ=true;
    introductionPlayerJ=true;
    QFYQJ=true;
    SNFJ=true;
    enemyJ=true;
    SNF.pause();
    SNF.rewind();
    ZSBZ.pause();
    ZSBZ.rewind();
    enemy1stJ=true;
  }
}
void welcomePage()
{
  image(bggif, 0, 0, width, height);
  textSize( welcomeTextSize);
  fill(255, 0, 0);
  text("Story Mode", storyModeX, storyModeY);
  if (storyModeFinishNumber<1)

    fill(255, 255, 255);

  text("Infinite Mode", storyModeX, storyModeY+100);

  fill(255, 0, 0);
  text("Introduction", storyModeX, storyModeY+200);
  text("Exit", storyModeX, storyModeY+300);




  if (welcomePlayerJ==true)
  {
    welcomePlayer.loop();
    welcomePlayerJ=false;
    bggif.play();
  }
  //welcome restart

  introductionPlayerJ=true;

  enemyJ=true;
  enemy1stJ=true;
}
void gameBackground()
{
  image(bg, 0, 0, width, height);
  fill(255, 46, 160);
  textSize(textSizePlayBg);
  text("Time: AD 3367", textBgX, textBgY);
  text("", textBgX, textBgY+textSizePlayBg);
  text("Event: You are the best soldier in space fleet “KH”. However,", textBgX, textBgY+textSizePlayBg*2);
  text("", textBgX, textBgY+textSizePlayBg*3);
  text("“KH” is attacked by a mysterious fleet and it cannot connect", textBgX, textBgY+textSizePlayBg*4);
  text("", textBgX, textBgY+textSizePlayBg*5);
  text("earth. To tell the earth what is happening, the capital of “KH”", textBgX, textBgY+textSizePlayBg*6);
  text("", textBgX, textBgY+textSizePlayBg*7);
  text("asks you to drive your spaceship to blaze heavy siege.", textBgX, textBgY+textSizePlayBg*8);
  text("", textBgX, textBgY+textSizePlayBg*9);

  fill(72, 180, 180);//color
  text("When it is close to earth, you find something strange about", textBgX, textBgY+textSizePlayBg*10);
  text("", textBgX, textBgY+textSizePlayBg*11);
  text("earth......", textBgX, textBgY+textSizePlayBg*12);

  text("", textBgX, textBgY+textSizePlayBg*13);
  fill(255, 0, 0);
  text(" WARRIOR, FIGHT NOW!", textBgX, textBgY+textSizePlayBg*14);
  text("Press   Any   Key  To   Continue", 270, 800);
}
void gameHowToPlay()
{
  image( how_play_bg, 0, 0, width, height);
  fill(255, 0, 0);
  textSize( how_play_textSize1);
  text("Mouse:", how_play_textX, how_play_textY);
  text("Key S:", how_play_textX, how_play_textY+ how_play_textSize1*2);
  text("Red Color:", how_play_textX, how_play_textY+how_play_textSize1*4);
  text("Bule Color:", how_play_textX, how_play_textY+how_play_textSize1*6);
  text("Key D:", how_play_textX, how_play_textY+ how_play_textSize1*19);

  textSize( how_play_textSize2);
  text("Use mouse to control plane", how_play_textX2, how_play_textY);//mouse explaination
  text("Use Key S to be without hurting.", how_play_textX2, how_play_textY+ how_play_textSize1*2);//to be withouthurting explaination
  text("it shows the remain HP ", how_play_textX2+80, how_play_textY+ how_play_textSize1*4);//shows HP
  text("it shows the reamin time which can be ", how_play_textX2+50, how_play_textY+ how_play_textSize1*6);//shows MP
  text(" without hurting", how_play_textX2+50, how_play_textY+how_play_textSize1*6+how_play_textSize2);
  text("Press   Any   Key  To   Continue", 270, 800);

  image(increaseHP, how_play_textX-50, how_play_textY+how_play_textSize1*8, 150, 75);//HP position
  text("         : increase HP", how_play_textX+50, how_play_textY+how_play_textSize1*10);
  image(increaseMP, how_play_textX-30, how_play_textY+how_play_textSize1*11, 100, 100);//MP position
  text("         : increase MP", how_play_textX+70, how_play_textY+how_play_textSize1*13);
  image(increaseFirePower, how_play_textX-50, how_play_textY+how_play_textSize1*14, 150, 100);//increaseFirePowe position
  text("         : increase FirePower", how_play_textX+50, how_play_textY+how_play_textSize1*17);
  text("         : use Key D to use 'increase power'", how_play_textX+50, how_play_textY+how_play_textSize1*19 );
  //how to play over
  //--------
}
void gameChooseType()
{
  image(bg, 0, 0, width, height);
  fill(200, 200, 0);
  textSize(chooseTypeTextSize1);
  text("Please choose type", chooseTypeX-100, chooseTypeY);

  textSize(chooseTypeTextSize2);
  fill(0, 0, 255);
  text("Defence", chooseTypeXX, chooseTypeYY);
  fill(0, 255, 0);
  text("Blance", chooseTypeXX+300, chooseTypeYY);
  fill(255, 0, 0);
  text("Attack", chooseTypeXX+600, chooseTypeYY);
}
void gameChooseHero()
{
  image(bg, 0, 0, width, height);
  fill(200, 200, 0);
  textSize(chooseShapeTextSize1);
  text("Please choose shape", chooseShapeX, chooseShapeY);
  image( chooseShape1, chooseShapeXX, chooseShapeYY, 150, 130);//hero2W,hero2H,hero2W,hero2H
  image( chooseShape2, chooseShapeXX+300, chooseShapeYY, hero2W, hero2H);    
  image( chooseShape3, chooseShapeXX+600, chooseShapeYY, hero2W, hero2H);
}
void gameChooseDifficulty()
{
  image(bg, 0, 0, width, height);
  fill(200, 200, 0);
  textSize(chooseTypeTextSize1);
  text("Please choose difficulty", chooseTypeX-100, chooseTypeY);

  textSize(chooseTypeTextSize2);
  fill(0, 0, 255);
  text("Easy", chooseTypeXX, chooseTypeYY);
  fill(0, 255, 0);
  text("Normal", chooseTypeXX+300, chooseTypeYY);
  fill(255, 0, 0);
  text("Hard", chooseTypeXX+600, chooseTypeYY);
}
void showsHPMP()
{
  image(playBg, 0, bgy, width, height);
  image(playBg,0,bgy-height,width,height);
  bgy=bgy+bgdy;
  if(bgy>height)
  bgy=0;

  fill(255, 0, 0);//HP color
  rect(0, height-(HP*heroHPshow)/HPC, HPWidth, (HP*heroHPshow)/HPC);//make HP shape

  fill(255, 255, 255);
  rect(width-MPWidth, height-totalHeight, MPWidth, totalHeight-MP*2);
  fill(0, 0, 255);//draw MP
  rect(width-MPWidth, height-MP*2, MPWidth, MP*2);
}
void bgmChange(AudioPlayer musicBefore, AudioPlayer musicNow)
{
  musicNow.loop();
  musicBefore.pause();
  musicBefore.rewind();
}
void missile()
{
  for (int i=0; i<enemy1stX.length; i++)
  {
    if (missilewait[i]/60%3==0)
    {
      missileX1[i]=enemy1stX[i]-missileW;
      missileY1[i]=enemy1stY[i]+enemy1stH;
      missileX2[i]=enemy1stX[i]+enemy1stW;
      missileY2[i]=enemy1stY[i]+enemy1stH;
      missilefirewait[i]=240;
      missilefireposition[i]=true;
    }
    if (missilefirewait[i]>=0)
    {
      missileX1[i]=enemy1stX[i]-missileW;
      missileY1[i]=enemy1stY[i]+enemy1stH;
      missileX2[i]=enemy1stX[i]+enemy1stW;
      missileY2[i]=enemy1stY[i]+enemy1stH;
      image(missile, missileX1[i], missileY1[i]);
      image(missile, missileX2[i], missileY2[i]);
      missilefirewait[i]=missilefirewait[i]-1;
    } else
    {
      if (missilefireposition[i]==true)
      {

        missilefireposition[i]=false;
        missileradius1[i]=atan((missileY1[i]-mouseY)/(missileX1[i]-mouseX));
        missileradius2[i]=atan((missileY2[i]-mouseY)/(missileX2[i]-mouseX));

        if (mouseX<missileX1[i])
        {
          missilegetdx1[i]=-cos(missileradius1[i])*missilev;
          missilegetdy1[i]=-sin(missileradius1[i])*missilev;
        } else
        {
          missilegetdx1[i]=cos(missileradius1[i])*missilev;
          missilegetdy1[i]=sin(missileradius1[i])*missilev;
        }
        if (mouseX<missileX2[i])
        {
          missilegetdx2[i]=-cos(missileradius2[i])*missilev;
          missilegetdy2[i]=-sin(missileradius2[i])*missilev;
        } else
        {

          missilegetdx2[i]=cos(missileradius2[i])*missilev;
          missilegetdy2[i]=sin(missileradius2[i])*missilev;
        }
      }//ready to fire
      image(missile, missileX1[i], missileY1[i]);// draw two missiles
      image(missile, missileX2[i], missileY2[i]);//time<0,fire
      missileX1[i]=missileX1[i]+missilegetdx1[i];
      missileY1[i]=missileY1[i]+missilegetdy1[i];
      missileX2[i]=missileX2[i]+missilegetdx2[i];
      missileY2[i]=missileY2[i]+missilegetdy2[i];
      if (mouseX-heroW/2<missileX1[i]+missileW&&missileX1[i]<mouseX-heroW/2+heroW&&mouseY-heroH/2<missileY1[i]+missileH&&missileY1[i]<mouseY-heroH/2+heroH)
      {
        HP=HP-missileattack;
        missileX1[i]=-1000;
        missileY1[i]=-1000;
        missilegetdx1[i]=0;
        missilegetdy1[i]=0;
      }
      if (mouseX-heroW/2<missileX2[i]+missileW&&missileX2[i]<mouseX-heroW/2+heroW&&mouseY-heroH/2<missileY2[i]+missileH&&missileY2[i]<mouseY-heroH/2+heroH)
      {
        HP=HP-missileattack;
        missileX2[i]=-1000;
        missileY2[i]=-1000;
        missilegetdx2[i]=0;
        missilegetdy2[i]=0;
      }

      if (missileX1[i]<-missileW || missileX1[i]>width || missileY1[i]<-missileH || missileY1[i]>height)
      {
        moveaway(missileX1[i], missileY1[i], missilegetdx1[i], missilegetdy1[i]);
      }
      if (missileX2[i]<-missileW || missileX2[i]>width || missileY2[i]<-missileH || missileY2[i]>height)
      {
        moveaway(missileX2[i], missileY2[i], missilegetdx2[i], missilegetdy2[i]);
      }
    }
  }
}
void circlewait()
{
  if ((circlefirewait[0]%(800/wave)==0 && wave<=7)||(circlefirewait[0]%(1200/wave)==0 && wave>7&&wave<10)||(circlefirewait[0]%600==0 && wave==10))
  {
    for (int j=0; j<circlefireX1.length; j++)
    {

      {
        circlefireX1[j]=enemy1stX[0]+enemy1stW/2;
        circlefireY1[j]=enemy1stY[0]+enemy1stH/2;
      }
    }
  }
  if (circlefirewait[1]%(800/wave)==0)
  {
    for (int j=0; j<circlefireX1.length; j++)

    {
      circlefireX2[j]=enemy1stX[1]+enemy1stW/2;
      circlefireY2[j]=enemy1stY[1]+enemy1stH/2;
    }
  }
  if (circlefirewait[2]%(800/wave)==0)
    for (int j=0; j<circlefireX1.length; j++)
    {

      {
        circlefireX3[j]=enemy1stX[2]+enemy1stW/2;
        circlefireY3[j]=enemy1stY[2]+enemy1stH/2;
      }
    }
  if (circlefirewait[3]%(800/wave)==0)
  {
    for (int j=0; j<circlefireX1.length; j++)


    {
      circlefireX4[j]=enemy1stX[3]+enemy1stW/2;
      circlefireY4[j]=enemy1stY[3]+enemy1stH/2;
    }
  }
}


void award(float w, float h)
{
  int random=int(random(0, 3));
  if (random==0)
  {
    awardhpx=append(awardhpx, random(0, width-w));
    awardhpy=append(awardhpy, random(0, width-w));
    awardhpdx=append(awardhpdx, random(1, 5));
    awardhpdy=append(awardhpdx, random(1, 5));
  }
  if (random==1)
  {
    awardmpx=append(awardmpx, random(0, width-w));
    awardmpy=append(awardmpy, random(0, width-w));
    awardmpdx=append(awardmpdx, random(1, 5));
    awardmpdy=append(awardmpdx, random(1, 5));
  }
  if (random==2)
  {
    awardfirex=append(awardfirex, random(0, width-w));
    awardfirey=append(awardfirey, random(0, width-w));
    awardfiredx=append(awardfiredx, random(1, 5));
    awardfiredy=append(awardfiredx, random(1, 5));
  }
} 


void gameOver()
{
  image(gameOverBg, 0, 0, width, height);
  fill(0, 0, 255);
  textSize( gameOverTextSize);
  text("You try you best to finish the duty. However,these time, ", gameOverTextX, gameOverTextY); 
  text("you meet the strongest enemy you have never meet. At the ", gameOverTextX, gameOverTextY+gameOverTextSize*2);
  text(" last second of your life, you dimly hear the sentence your", gameOverTextX, gameOverTextY+gameOverTextSize*4);
  text("father had said:“Dying in space is the best honor for us”", gameOverTextX, gameOverTextY+gameOverTextSize*6);
  text("“Yes, I am a hero. Service…Complete”. ", gameOverTextX, gameOverTextY+gameOverTextSize*8);

  fill(255, 0, 0);
  text("To be a hero, To be a suffer", gameOverTextX+200, gameOverTextY+gameOverTextSize*16);
  textSize(20);
  text("(Try Again)", gameOverTextX+250, gameOverTextY+gameOverTextSize*17);
  fill(0, 255, 0);
  textSize(gameOverTextSize);
  text("Finishing game likes devil,Giving up likes heaven", gameOverTextX+100, gameOverTextY+gameOverTextSize*20);
  textSize(20);
  text("(Go Back Home)", gameOverTextX+250, gameOverTextY+gameOverTextSize*21);
}
void change(float x, float y, float dx, float dy)
{
  x=x-dx;
  y=y-dy;
}
void moveaway(float x, float y, float dx, float dy)
{
  x=-10000000;
  y=-10000000;
  dx=0;
  dy=0;
}
void showsincreaseFireC()
{
  image(increaseFirePower, 0, height-(HP*heroHPshow)/HPC-60, 50, 50);
  textSize(30);
  fill(0);
  text(increaseFireC, 61, height-(HP*heroHPshow)/HPC-30);
}
void restartenemy()
{
  if (enemy1stJ==true)
  {
    enemy1stCount=4;

    enemy1stX=new float[enemy1stCount];
    enemy1stY=new float[enemy1stCount];
    dxdyJ=true;
    waveaddJ=true;

    for (int z=0; z<herofirex1.length; z++)
    {
      herofirex1[z]=mouseX-heroW/5;
      herofirey1[z]=mouseY-100*z;
      herofirex2[z]=mouseX;
    }




    for (int i=0; i<enemy1stX.length; i++)
    {
      dy[i]=-1;
      if (wave<=4)
        enemy1stX[i]=i*270;
      else if (wave<=7)
        enemy1stX[i]=i*350;
      else if (wave<=9)
        enemy1stX[i]=i*800;
      if (wave==10)
        enemy1stX[0]=350;
      enemy1stY[i]=dy[i]*60;
      enemy1stHPX[i]=enemy1stHP;
      missilewait[i]=30*i;
      enemy1stalive[i]=true;
      enemy1stalivetest[i]=1;
      circlefirewait[i]=200*i;
      explodeT[i]=-1;
    }
    enemy1stJ=false;
  }
}
void enemy()
{
  for (int i=0; i<enemy1stX.length; i++)
  {
    image(enemy1st, enemy1stX[i], enemy1stY[i], enemy1stW, enemy1stH);
    if (dxdyJ==true)
    {
      if (enemy1stY[i]<= enemy1stH )
      {
        enemy1stY[i]=enemy1stY[i]-dy[i];
      } else 
      {
        if (wave<=4)
        {
          dx[i]=random(-5, 5);
          dy[i]=random(-5, 5);
        } else if (wave<=7)
        {
          dx[i]=random(-20, 20);
          dy[i]=random(-20, 20);
        } else if (wave<=9)
        {
          dx[i]=random(-10, 10);
          dy[i]=random(-10, 10);
        } else
        {
          dx[i]=random(-1, 1);
          dy[i]=random(-1, -1);
        }
        dxdyJ=false;
      }
    }

    if (dxdyJ==false)
    {
      if (dx[i]==0)
      {
        dx[i]=random(-10, 10);
      }
      if (dy[i]==0)
      {
        dy[i]=random(-10, 10);
      }
      if (enemy1stX[i]<0)
      {
        enemy1stX[i]=0;
        dx[i]=-dx[i];
      }
      if (enemy1stX[i]>width-enemy1stW)
      {
        enemy1stX[i]=width-enemy1stW;
        dx[i]=-dx[i];
      }

      if (enemy1stY[i]<0)
      {
        enemy1stY[i]=0;
        dy[i]=-dy[i];
      }
      if (enemy4stDivideT>1080*2 && enemy4stDivideT<1080*3 &&wave==10&&enemy1stY[0]>height-enemy1stW)
      {
        enemy1stX[0]=random(0, width-enemy1stW);
        enemy1stY[0]=random(0, width/2-enemy1stW/2);
        dy[0]=-dy[0];
        enemy4stDivideT=2;
      } else if (enemy1stY[i]>height/2)
      {
        enemy1stY[i]=height/2;
        dy[i]=-dy[i];
      }
    }

    //xxxxxxxx nothing delete
    if (mouseX-heroW/2<=enemy1stX[i]+enemy1stW&&enemy1stX[i]<=mouseX&&mouseY<=enemy1stY[i]+enemy1stH&&enemy1stY[i]<=mouseY)
    {
      enemy1stHPX[i]=enemy1stHPX[i]-heroAttack;
    }
    fill(255, 0, 0);
    rect(enemy1stX[i], enemy1stY[i]-5, enemy1stHPX[i]*enemy1stW/enemy1stHP, 10);
    // delete

    if (enemy1stHPX[i]<=0)
    {
      explodeT[i]=explodeT[i]+1;
      if (explodeT[i]==0)
      {
        explodeX[i]=enemy1stX[i];
        explodeY[i]=enemy1stY[i];
      }
      enemy1stalive[i]=false;
      enemy1stX[i]=-10000000;
      enemy1stY[i]=-10000000;
      dx[i]=0;
      dy[i]=0;
      enemy1stalivetest[i]=0;
    }
    if (enemy1stalivetest[0]==0&&enemy1stalivetest[1]==0&&enemy1stalivetest[2]==0&&enemy1stalivetest[3]==0&waveaddJ==true)
    {
      if(wave>=1&&wave<=4)
      gameMark=gameMark+100;
      else if(wave<=7)
      gameMark=gameMark+200;
      else if(wave<=9)
      gameMark=gameMark+400;
      else
      gameMark=gameMark+800;
      enemy1stJ=true;
      waveaddJ=false;
      wave=wave+1;
      award(150, 150);
      if (wave>5)
      {
        enemyBallX=append(enemyBallX, random(0, width-enemyBallW));
        enemyBallY=append(enemyBallY, random(0, width-enemyBallH));
        enemyBalldx=append(enemyBalldx, random(0.5, 1));
        enemyBalldy=append(enemyBalldy, random(0.5, 1));
      }
      if (wave>=8&&wave<=9)
        enemy3stT=600;
      if (welcomeClickCount==2)
      {
        int randomC=int(random(1, 11));
        if (randomC>=1&&randomC<=4)
       {   
          wave=1;
          JYMYJ=true;
       }
        else if (randomC>=5&&randomC<=7)
        { 
          wave=5;
          JYYMJ=true;
        }
        else if (randomC>=8&&randomC<=9)
        { 
          wave=8;
          SRPZJ=true;
        }
        else if (randomC==10)
       {   
          wave=10;
          YJZYJ=true;
       }
       
      }
    }//restart



    missile();

    //missile ok



    circlewait();

    for (int j=0; j<circlefireX1.length; j++)
    {
      circlefireX1[j]=  circlefireX1[j]-cos(TWO_PI/circlefireX1.length*j)*circlefirev;
      circlefireY1[j]= circlefireY1[j]-sin(TWO_PI/circlefireX1.length*j)*circlefirev;
      circlefireX2[j]=  circlefireX2[j]-cos(TWO_PI/circlefireX1.length*j)*circlefirev;
      circlefireY2[j]= circlefireY2[j]-sin(TWO_PI/circlefireX1.length*j)*circlefirev;
      circlefireX3[j]=  circlefireX3[j]-cos(TWO_PI/circlefireX1.length*j)*circlefirev;
      circlefireY3[j]= circlefireY3[j]-sin(TWO_PI/circlefireX1.length*j)*circlefirev;
      circlefireX4[j]=  circlefireX4[j]-cos(TWO_PI/circlefireX1.length*j)*circlefirev;
      circlefireY4[j]= circlefireY4[j]-sin(TWO_PI/circlefireX1.length*j)*circlefirev;
      image(circlefire, circlefireX1[j], circlefireY1[j], 30, 30);
      image(circlefire, circlefireX2[j], circlefireY2[j], 30, 30);
      image(circlefire, circlefireX3[j], circlefireY3[j], 30, 30);
      image(circlefire, circlefireX4[j], circlefireY4[j], 30, 30);
      if (mouseX-heroW/2< circlefireX1[j]+30&& circlefireX1[j]<mouseX-heroW/2+heroW&&mouseY-heroH/2<circlefireY1[j]+30&&circlefireY1[j]<mouseY-heroH/2+heroH)// problems
      {
        HP=HP-enemyattack;
        circlefireX1[j]=-100000000;
        circlefireY1[j]=-100000000;
      }
      if (mouseX-heroW/2< circlefireX2[j]+30&& circlefireX2[j]<mouseX-heroW/2+heroW&&mouseY-heroH/2<circlefireY2[j]+30&&circlefireY2[j]<mouseY-heroH/2+heroH)// problems
      {
        HP=HP-enemyattack;
        circlefireX1[j]=-100000000;
        circlefireY2[j]=-100000000;
      }

      if (mouseX-heroW/2<  circlefireX3[j]+30&&   circlefireX3[j]<mouseX-heroW/2+heroW&&mouseY-heroH/2< circlefireY3[j]+30&& circlefireY3[j]<mouseY-heroH/2+heroH)// problems
      {
        HP=HP-enemyattack;
        circlefireX3[j]=-100000000;
        circlefireY3[j]=-100000000;
      }

      if (mouseX-heroW/2<circlefireX4[j]+30&& circlefireX4[j]<mouseX-heroW/2+heroW&&mouseY-heroH/2<  circlefireY4[j]+30&&  circlefireY4[j]<mouseY-heroH/2+heroH)// problems
      {
        HP=HP-enemyattack;
        circlefireX4[j]=-100000000;
        circlefireY4[j]=-100000000;
      }











      //????????
      //??????

      //????
      //????
      //????
    }

    circlefirewait[i]++;


    missilewait[i]++;//count time


    if (enemy4stDivideT==1080*2&&wave==10)
    {
      dx[0]=enemy4stAttackdx;
      dy[0]=enemy4stAttackdy;
    }
    if (enemy4stDivideT==1080*3)
    {
      dx[i]=random(-1, 1);
      dy[i]=random(-1, -1);
    }
    enemy1stX[i]=enemy1stX[i]-dx[i];
    enemy1stY[i]=enemy1stY[i]-dy[i];
  }
}
void enemyBall()
{
  enemyBallW=150;
  enemyBallH=150;
  for (int i=0; i<enemyBallX.length; i++)
  {
    if (enemyBallX[i]>-100)
    {
      if (enemyBallX[i]<0)
      {
        enemyBallX[i]=0;
        enemyBalldx[i]=-enemyBalldx[i];
      }
      if (enemyBallX[i]>width-enemyBallW)
      {
        enemyBallX[i]=width-enemyBallW;
        enemyBalldx[i]=-enemyBalldx[i];
      }
      if (enemyBallY[i]<0)
      {
        enemyBallY[i]=0;
        enemyBalldy[i]=-enemyBalldy[i];
      }
      if (enemyBallY[i]>width-enemyBallH)
      {
        enemyBallY[i]=width-enemyBallH;
        enemyBalldy[i]=-enemyBalldy[i];
      }//PROBLEMS

      image(enemyBallimage, enemyBallX[i], enemyBallY[i], enemyBallW, enemyBallH);
      enemyBallX[i]=enemyBallX[i]-enemyBalldx[i];
      enemyBallY[i]=enemyBallY[i]-enemyBalldy[i];

      if (mouseX-heroW/2<enemyBallX[i]+enemyBallW&&enemyBallX[i]<mouseX+heroW/2&&mouseY-heroH/2<enemyBallY[i]+enemyBallH&&enemyBallY[i]<mouseY+heroH/2)
      {
        HP=HP-5;
        enemyBallX[i]=-1000;
      }
    }
  }
}
void sward()
{
  int swardcc=0;
  for (int i=0; i<5-enemykind; i++)
  {
    if (enemy1stHPX[i]>0&&swardtime[i]==600)
    {
      for (int j=i*swardnumber*3; j< (i+1)*swardnumber*3; j++)
      {
        swardX[j]= enemy1stX[i]+enemy1stW/2+swardR*2*cos(TWO_PI*j*swardC[i]/swardn);
        swardY[j]=enemy1stY[i]+enemy1stH/2+swardR*2*sin(TWO_PI*j*swardC[i]/swardn);
        image(sward, swardX[j], swardY[j], swardW, swardH);
        if (t%60==0)
          swardC[i]++;
      }
    }
    if ((enemy1stHPX[i]<=0)||(enemy1stHPX[i]>0&&swardtime[i]<600))
    {
      if (swardtime[i]<=600&&swardtime[i]>400)
      {
        for (int j=i*swardnumber*3; j< (i+1)*swardnumber*3-swardnumber*2; j++)
        {

          swardX[j]=swardX[j]+9*cos(TWO_PI*j*swardC[i]/swardn);
          swardY[j]=swardY[j]+9*sin(TWO_PI*j*swardC[i]/swardn);
        }
      }
      if (swardtime[i]<=400&&swardtime[i]>=200)
      {
        for (int j=i*swardnumber*3; j< (i+1)*swardnumber*3-swardnumber*1; j++)
        {
          swardX[j]=swardX[j]+9*cos(TWO_PI*j*swardC[i]/swardn);
          swardY[j]=swardY[j]+9*sin(TWO_PI*j*swardC[i]/swardn);
        }
      }
      if (swardtime[i]<=200)
      {
        for (int j=i*swardnumber*3; j< (i+1)*swardnumber*3-swardnumber*0; j++)
        {
          swardX[j]=swardX[j]+9*cos(TWO_PI*j*swardC[i]/swardn);
          swardY[j]=swardY[j]+9*sin(TWO_PI*j*swardC[i]/swardn);
        }
      }
      swardtime[i]=swardtime[i]-1;
    }
    if (swardtime[i]<=0)
    {
      swardcc++;
    }
    if (swardcc==5-enemykind)
    {
      for (int f=0; f<5-enemykind; f++)
        swardtime[f]=600;
    }
    for (int j=0; j<swardnumber*9; j++)
    {
      if (mouseX-heroW/2<swardX[j]+swardW&&swardX[j]<mouseX+heroW/2&&mouseY-heroH/2<swardY[j]+swardH&&swardY[j]<mouseY+heroH/2)
      {
        swardX[j]=-10000000;
        swardY[j]=-10000000;
        HP=HP-3;
      }
      image(sward, swardX[j], swardY[j], swardW, swardH);
    }
  }
}
void enemyCB()
{
  if (enemy1stHPX[0]<=0 ||enemy1stHPX[1]<=0)
  {
    enemy3stT=enemy3stT-1;
    if (enemy3stT<=0)
    {
      enemy1stHPX[0]=enemy1stHP/2;
      enemy1stHPX[1]=enemy1stHP/2;
    }
  }
  if (enemy3stT>0&&enemy3stT<600&wave<=9&&wave>=8)
  {
    fill(255, 0, 0);
    textSize(30);
    text("Enemy Back"+enemy3stT/60, 0, height-(HP*heroHPshow)/HPC-90);
    enemy3stT=enemy3stT-1;
  }
  if (enemy1stHPX[0]>0&&enemy1stHPX[1]>0)
    enemy3stT=600;
}
void enemy3stFire()
{
  if (enemy3stFireT==1)
  {
    for (int d=0; d<enemy3stFireX.length; d++)
    {
      enemy3stFireX[d]=(d%100)*enemy3stFireW;
      enemy3stFireY[d]=-((d/100)+1)*enemy3stFireH;
    }
  }
  if (enemy3stFireT>1&&enemy3stFireT<1920)
  {
    for (int d=0; d<enemy3stFireX.length; d++)
    {
      image(enemy3stFire, enemy3stFireX[d], enemy3stFireY[d], enemy3stFireW, enemy3stFireH);
      enemy3stFireY[d]=enemy3stFireY[d]+1;
      if (mouseX-heroW/2<enemy3stFireX[d]+enemy3stFireW&&enemy3stFireX[d]<mouseX+heroW/2&&mouseY-heroH/2<enemy3stFireY[d]+enemy3stFireH&&enemy3stFireY[d]<mouseY+heroH/2)
      {
        HP=HP-1;
        enemy3stFireY[d]=height;
      }
      for (int i=0; i<herofirex1.length; i++)
      {
        if (herofirex1[i]<enemy3stFireX[d]+enemy3stFireW&&enemy3stFireX[d]<herofirex1[i]+herofirew&&herofirey1[i]<enemy3stFireY[d]+enemy3stFireH&&enemy3stFireY[d]<herofirey1[i]+herofireh)
        {
          herofirex1[i]=-10000;
          herofirey1[i]=-10000;
          enemy3stFireY[d]=height;
        }
         if (herofirex2[i]<enemy3stFireX[d]+enemy3stFireW&&enemy3stFireX[d]<herofirex2[i]+herofirew&&herofirey2[i]<enemy3stFireY[d]+enemy3stFireH&&enemy3stFireY[d]<herofirey2[i]+herofireh)
        {
          herofirex2[i]=-10000;
          herofirey2[i]=-10000;
          enemy3stFireY[d]=height;
        }
      }
    }
  }


  if (enemy3stFireT>1920)

    enemy3stFireT=0;
  enemy3stFireT++;
}
void enemy4stDivide()
{
  if (enemy4stDivideT==2)
  {
    for (int i=1; i<4; i++)
    {
      enemy1stHPX[i]=enemy1stHPX[0];
      enemy1stX[i]=300*i;
      enemy1stY[i]=random(0, height-enemy1stH);
      dx[i]=random(-10, 10);
      dy[i]=random(-10, 10);
    }
  }
  if (enemy4stDivideT>1&&enemy4stDivideT<1080)
  {
    enemy1stW=100;
    enemy1stH=100;
  }
  if (enemy4stDivideT==1080*2)
  {
    enemy1stW=300;
    enemy1stH=300;
    enemy4stAttackT=2;
  }


  if (enemy4stDivideT>1080*2)
  {
    for (int i=1; i<4; i++)
      enemy1stHPX[i]=0;
  }
  if (enemy4stDivideT>1080*3)
    enemy4stDivideT=1;
  enemy4stDivideT++;
}
void enemy4stAttack()
{
  if (enemy4stDivideT>1080*2&& enemy4stDivideT<1080*3)
  {
    if (enemy4stAttackT==2)
    {

      if (mouseX<enemy1stX[0])
      {
        enemy4stAttackdx=cos(atan((enemy1stY[0]-mouseY)/(enemy1stX[0]-mouseX)));
        enemy4stAttackdy=sin(atan((enemy1stY[0]-mouseY)/(enemy1stX[0]-mouseX)));
      } else
      {
        enemy4stAttackdx=-cos(atan((enemy1stY[0]-mouseY)/(enemy1stX[0]-mouseX)));
        enemy4stAttackdy=-sin(atan((enemy1stY[0]-mouseY)/(enemy1stX[0]-mouseX)));
      }
    }
    enemy4stAttackT++;
    if (enemy4stAttackT>2)
    {
      if (mouseX-heroW/2<enemy1stX[0]+enemy1stW&&enemy1stX[0]<mouseX+heroW/2&&mouseY-heroH/2<enemy1stY[0]+enemy1stH&&enemy1stY[0]<mouseY+heroH/2)
      {
        enemy1stX[0]=random(0, width-enemy1stW);
        enemy1stY[0]=random(0, width/2-enemy1stW/2);
        HP=HP-10;
        enemy4stAttackT=2;
      }
    }
  }
}
void gameWin()
{
  image(gameWinBg, 0, 0, width, height);
  fill(0, 0, 255);
  textSize( gameWinTextSize);
  text("Arriving the earth, you find that earth is seized by mysterious", gameWinTextX, gameWinTextY);
  text(" The spaceships which tries to escape from earth are shot", gameWinTextX, gameWinTextY+gameWinTextSize*2);
  text("down. Seeing this, you promise that you will shoot down ", gameWinTextX, gameWinTextY+gameWinTextSize*4);
  text("every mysterious spaceship you meet. You choose Plant", gameWinTextX, gameWinTextY+gameWinTextSize*6);
  text("37E as you base and try to find other survivors. “One day,", gameWinTextX, gameWinTextY+gameWinTextSize*8);
  text("we will come back.”, you say.", gameWinTextX, gameWinTextY+gameWinTextSize*10);

  textSize(45);
  fill(255, 0, 0);
  text("Infinite Mode Starts", gameWinTextX+200, gameWinTextY+gameWinTextSize*18);
  fill(0, 255, 0);
  textSize(30);
  text("Press R Key To Home Back", gameWinTextX+200, gameWinTextY+gameWinTextSize*24);
}
void heroFire()
{
  image(hero, mouseX-heroW/2, mouseY-heroH/2, heroW, heroH);
  if (herofireJ==true)
  {
    for (int i=0; i< herofirex1.length; i++)
    {
      herofireC[i]=-i*3;
    }
    herofireJ=false;
  }
  if (increaseFireT>0)
  {
    herofire=loadImage("increasefire.png");
    increaseFireT=increaseFireT-1;
    heroAttack=heroAttackx*3/2;
  } else
  {
    herofire=loadImage("herogun.png");
    heroAttack=heroAttackx;
  }
  for (int i=0; i<herofirex1.length; i++)
  {
    if (herofireC[i]==0)
    {
      herofirex1[i]=mouseX-herofirew;
      herofirey1[i]=mouseY-heroH;
      herofirex2[i]=mouseX;
      herofirey2[i]=mouseY-heroH;
    }
    if (herofireC[i]>0)
    {
      herofirex1[i]=herofirex1[i];
      herofirey1[i]=herofirey1[i]-20;
      herofirex2[i]= herofirex2[i];
      herofirey2[i]= herofirey2[i]-20;
      image(herofire, herofirex1[i], herofirey1[i], herofirew, herofireh);
      image(herofire, herofirex2[i], herofirey2[i], herofirew, herofireh);
    }
    if (herofireC[i]>360)
    {
      herofireJ=true;
    }
    for (int j=0; j<4; j++)
    {
      if (herofirex1[i]<enemy1stX[j]+enemy1stW&&enemy1stX[j]<herofirex1[i]+herofirew&&herofirey1[i]<enemy1stY[j]+enemy1stH&&enemy1stY[j]<herofirey1[i]+herofireh)
      {
        herofirex1[i]=-10000;
        herofirey1[i]=-10000;
        enemy1stHPX[j]=enemy1stHPX[j]-heroAttack;
      }
      if (herofirex2[i]<enemy1stX[j]+enemy1stW&&enemy1stX[j]<herofirex2[i]+herofirew&&herofirey2[i]<enemy1stY[j]+enemy1stH&&enemy1stY[j]<herofirey2[i]+herofireh)
      {
        herofirex2[i]=-1000;
        herofirey2[i]=-1000;
        enemy1stHPX[j]=enemy1stHPX[j]-heroAttack;
      }
    }
    herofireC[i]=herofireC[i]+1;
  }
}
void awardball()
{
  for (int i=0; i<awardhpx.length; i++)
  {
    image(increaseHP, awardhpx[i], awardhpy[i], 150, 75);
    if (awardhpx[i]>=-100)//??????
    {
      if (awardhpx[i]<0)
      {
        awardhpx[i]=0;
        awardhpdx[i]=-awardhpdx[i];
      }
      if (awardhpx[i]>width-150)
      {
        awardhpx[i]=width-150;
        awardhpdx[i]=-awardhpdx[i];
      }
      if (awardhpy[i]<0)
      {
        awardhpy[i]=0;
        awardhpdy[i]=-awardhpdy[i];
      }
      if (awardhpy[i]>=height-75)
      {
        awardhpy[i]=height-75;
        awardhpdy[i]=-awardhpdy[i];
      }


      awardhpx[i]=awardhpx[i]- awardhpdx[i];
      awardhpy[i]=awardhpy[i]- awardhpdy[i];
    }
    if (mouseX-heroW/2< awardhpx[i]+150&& awardhpx[i]<mouseX+heroW/2&&mouseY-heroH/2< awardhpy[i]+75&& awardhpy[i]<mouseY+heroW/2)
    {
      awardhpx[i]=-10000;
      awardhpy[i]=-100;

      awardhpdx[i]=0;
      awardhpdy[i]=0;
      HP=HP+HPC/3;
      if (HP>HPC)
        HP=HPC;
    }
  }
  for (int i=0; i<awardmpx.length; i++)
  {
    image(increaseMP, awardmpx[i], awardmpy[i], 100, 100);
    if (awardmpx[i]>=-100)
    {
      if (awardmpx[i]<0)
      {
        awardmpx[i]=0;
        awardmpdx[i]=-awardmpdx[i];
      }
      if (awardmpx[i]>width-150)
      {
        awardmpx[i]=width-150;
        awardmpdx[i]=-awardmpdx[i];
      }
      if (awardmpy[i]<0)
      {
        awardmpy[i]=0;
        awardmpdy[i]=-awardmpdy[i];
      }
      if (awardmpy[i]>=height-75)
      {
        awardmpy[i]=height-75;
        awardmpdy[i]=-awardmpdy[i];
      }
      awardmpx[i]=awardmpx[i]- awardmpdx[i];
      awardmpy[i]=awardmpy[i]- awardmpdy[i];
    }
    if (mouseX-heroW/2< awardmpx[i]+150&& awardmpx[i]<mouseX+heroW/2&&mouseY-heroH/2< awardmpy[i]+75&& awardmpy[i]<mouseY+heroW/2)
    {
      awardmpx[i]=-100000000;
      awardmpy[i]=-10000;
      awardmpdx[i]=0;
      awardmpdy[i]=0;
      MP=MP+25;
      if (MP>100)
        MP=100;
    }
  }
  for (int i=0; i<awardfirex.length; i++)
  {
    image(increaseFirePower, awardfirex[i], awardfirey[i], 100, 100);
    {

      if (awardfirex[i]>=-100)
      {
        if (awardfirex[i]<0)
        {
          awardfirex[i]=0;
          awardfiredx[i]=-awardfiredx[i];
        }
        if (awardfirex[i]>width-150)
        {
          awardfirex[i]=width-150;
          awardfiredx[i]=-awardfiredx[i];
        }
        if (awardfirey[i]<0)
        {
          awardfirey[i]=0;
          awardfiredy[i]=-awardfiredy[i];
        }
        if (awardfirey[i]>=height-75)
        {
          awardfirey[i]=height-75;
          awardfiredy[i]=-awardfiredy[i];
        }
        awardfirex[i]=awardfirex[i]- awardfiredx[i];
        awardfirey[i]=awardfirey[i]- awardfiredy[i];
      }
      if (mouseX-heroW/2< awardfirex[i]+150&& awardfirex[i]<mouseX+heroW/2&&mouseY-heroH/2< awardfirey[i]+75&& awardfirey[i]<mouseY+heroW/2)
      {
        awardfirex[i]=-100000000;
        awardfirey[i]=-10000;
        awardfiredx[i]=0;
        awardfiredy[i]=0;
        increaseFireC++;
      }
    }
  }
}
void enemyimportant()
{
  if (QFYQJ==true&&welcomeClickCount==2)
  {
    QFYQJ=false;
    QFYQ.loop();
    int randomC=int(random(1, 5));
        if (randomC==1)
         {
           wave=1;
           JYMYJ=true;
         }
        else if (randomC==2)
          {
            wave=5;
            JYYMJ=true;
          }
        else if (randomC==3)
         {
          wave=8;
          SRPZJ=true;
         }
        else if (randomC==4)
         {
           wave=10;
           YJZYJ=true;
         }
  }
  if ( wave<=4)
  {

    if (JYMYJ==true)
    {
      if (welcomeClickCount==1)
      {
        JYMY.loop();
        JYMYJ=false;
      }
      introductionPlayer.pause();
      introductionPlayer.rewind();
      enemy1stHP=150*difficulty;
      enemy1stW=120;
      enemy1stH=90;
      enemykind=1;
      enemy1st=loadImage("st1.png");
      for(int i=0;i<enemyBallX.length;i++)
      image(enemyBallimage, enemyBallX[i], enemyBallY[i], enemyBallW, enemyBallH);
       JYMYJ=false;
    }
     enemy1st=loadImage("st1.png");
    //xxxxxxx 1111111 improtant!!!!!!!!!!!!!!!!!!!!!
    restartenemy();
    // begin start choose !!!!!!!!!!!!!!!!!!!!!!

    enemy();
    for (int i=0; i<explodeX.length; i++)
    {
      if (explodeT[i]>=0&& explodeT[i]<60)
      {
        image(explode, explodeX[i], explodeY[i], 150, 150);
        explodeT[i]=explodeT[i]+1;
      }
    }
  }

  if ( wave>=5 && wave<=7)
  {

    if (JYYMJ==true)
    {
      if (welcomeClickCount==1)
      {
        JYYM.loop();
        JYYMJ=false;
      }
      JYMY.pause();
      JYMY.rewind();
      missileattack=3*difficulty;
      enemyattack=2*difficulty;
      missilev=5;
      circlefirev=10;
      enemy1stHP=300*difficulty;
      enemyBallimage=loadImage("2st ball.png");
      enemy1stH=120;
      enemy1stW=180;
      enemykind=2;
       JYYMJ=false;
      for (int i=0; i<3; i++)
      {
        swardC[i]=0;
      }
      swardn=10;
      enemy1st=loadImage("2stxx.png");
    }
    enemy1st=loadImage("2stxx.png");
    restartenemy();
    sward();
    enemy1stHPX[3]=0;

    enemy();
    enemyBall();
    for (int i=0; i<explodeX.length; i++)
    {
      if (explodeT[i]>=0&&explodeT[i]<60)
      {
        image(explode, explodeX[i], explodeY[i], 200, 200);
        explodeT[i]=explodeT[i]+1;
      }
    }
  }
  if (wave>=8&&wave<=9)
  {
    if (SRPZJ==true)
    {
      if (welcomeClickCount==1)
      {
        SRPZ.loop();
        SRPZJ=false;
      }
      JYYM.pause();
      JYYM.rewind();
      missileattack=4*difficulty;
      enemyattack=3*difficulty;
      missilev=5;
      circlefirev=10;
      enemy1stHP=800*difficulty;
      enemyBallimage=loadImage("2st ball.png");
      enemy1stH=160;
      enemy1stW=240;
      enemykind=3;
      swardn=10;
      enemy1st=loadImage("3stxx.png");
       SRPZJ=false;
    }
     enemy1st=loadImage("3stxx.png");
    restartenemy();
    sward();
    enemy1stHPX[2]=0;
    enemy1stHPX[3]=0;


    enemy();
    enemyBall();

    enemyCB();

    enemy3stFire();
    for (int i=0; i<explodeX.length; i++)
    {
      if (explodeT[i]>=0&&explodeT[i]<60)
      {
        image(explode, explodeX[i], explodeY[i], 200, 200);
        explodeT[i]=explodeT[i]+1;
      }
    }
  }
  if (wave==10)
  {
    if (YJZYJ==true)
    {
      if (welcomeClickCount==1)
      {
        YJZY.loop();
        YJZYJ=false;
      }
        SRPZ.pause();
        SRPZ.rewind();
        missileattack=5*difficulty;
        enemyattack=4*difficulty;
        missilev=5;
        circlefirev=5;
        enemy1stHP=1200*difficulty;
        enemyBallimage=loadImage("2st ball.png");
        enemy1stH=300;
        enemy1stW=300;
        enemykind=4;
        swardn=10;
        enemy1st=loadImage("4st.png");
         YJZYJ=false;
      }
      
      
      
       enemy1st=loadImage("4st.png");
     
      restartenemy();
      sward();
      enemy();
      enemyBall();
     

      enemy();
      enemyBall();

      enemyCB();

      enemy3stFire();

      enemy4stDivide();
      enemy4stAttack();

      for (int i=0; i<explodeX.length; i++)
      {
        if (explodeT[i]>=0&&explodeT[i]<60)
        {
          image(explode, explodeX[i], explodeY[i], 200, 200);
          explodeT[i]=explodeT[i]+1;
        }
      }
       if(enemy4stDivideT>1&&enemy4stDivideT<1080)
      {
        missileattack=2*difficulty;
        enemyattack=1*difficulty;
      }
    }



    if (wave<=4)
    {
      enemyattack=1;
      missileattack=2;
    } else if (wave<=7)
    {
      enemyattack=2*difficulty;
      missileattack=3*difficulty;
    } else if (wave<=9)
    {
      missileattack=4*difficulty;
      enemyattack=3*difficulty;
    } 
    else if(enemy4stDivideT>1&&enemy4stDivideT<1080)
    {
       missileattack=2*difficulty;
        enemyattack=1*difficulty;
    }
    else
    {
      missileattack=5*difficulty;
      enemyattack=4*difficulty;
    }
    println(enemykind);
    println("XXX"+enemyattack);
}
void emptyx()
{
  awardhpx=append(empty, -1000);
    awardhpy=append(empty, -1000);
    awardhpdx=append(empty, -1000);
    awardhpdy=append(empty, -1000);
  
  
 
    awardmpx=append(empty, -1000);
    awardmpy=append(empty, -1000);
    awardmpdx=append(empty, -1000);
    awardmpdy=append(empty, -1000);
 
  
  
    awardfirex=append(empty, -1000);
    awardfirey=append(empty, -1000);
    awardfiredx=append(empty, -1000);
    awardfiredy=append(empty, -1000);
    
    
    enemyBallX= append(empty,-1000);
      enemyBallY= append(empty,-1000);
       enemyBalldx= append(empty,-1000);
     enemyBalldy= append(empty,-1000);
        increaseFireC=0;
}

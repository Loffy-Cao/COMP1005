import ddf.minim.*;
Minim minim;


AudioPlayer penglai;
AudioPlayer fei;
AudioPlayer shenjuan;
AudioPlayer busi;



PImage begin;
PImage intro;
PImage finish;
PImage []end= new PImage [4];
int y;
int stage;
float alpha;
float dAlpha;
int sequence;




float xPlayer;
float yPlayer;
float dxPlayer;
float dyPlayer;
float vPlayer;
float  wPlayer;
float hPlayer;

float xMokou;
float yMokou;
float dxMokou;
float dyMokou;
float  wMokou;
float hMokou;

boolean left;
boolean right;
boolean up;
boolean down;
boolean shift;
boolean xPressed;
boolean zPressed;
boolean [] wave=new boolean [30];
int powerNum;
int lifeNum;
int bombNum;
Blade []blade1=new Blade[100];
Blade []blade2=new Blade[100];
Blade []blade3=new Blade[100];
Butterfly []butterfly1=new Butterfly[100];
Butterfly []butterfly2=new Butterfly[100];
Butterfly []butterfly3=new Butterfly[100];
Drop[] power=new Drop[300];
int vControl1;
int vControl2;
int xufu;
PImage yaomeng1;
PImage yaomeng2;
PImage yaomeng3;
PImage youyouzi1;
PImage youyouzi2;
PImage youyouzi3;
PImage blade;
PImage playerDe;
PImage butterfly;
PImage deadButterfly;
PImage P;
PImage player;
PImage spell;
PImage bg1;
PImage bg2;
int bladeNum;
int butterflyNum;
int ybg1;
int dybg1;
int ybg2;
int dybg2;


PImage servantB;
PImage servantG;
PImage servantR;
PImage servantP;
PImage blueS;
PImage blueB;
PImage mokou;

PImage jadeRS;
PImage scale;
PImage maJiangR;
PImage maJiangP;
PImage maJiangB;
Servant [] servant0= new Servant[20];
Servant [] servant1= new Servant[20];
Servant []servant2=new Servant [20];
Servant []servant3=new Servant [20];
Servant [] servant4= new Servant[20];
Servant [] servant5= new Servant[20];
Servant [] servant6= new Servant[20];
Servant [] servant7= new Servant[20];
Servant [] servant8= new Servant[20];
Servant [] servant9= new Servant[20];
Servant [] servant10= new Servant[20];
Servant [] servant11= new Servant[20];
Servant [] servant12= new Servant[20];
Servant [] servant13= new Servant[20];
Servant [] servant14= new Servant[20];
Servant [] servant15= new Servant[20];
Servant[] servantB1=new Servant[8];
Servant[] servantB2=new Servant[100];
Servant[] servantB3=new Servant[100];
Servant[] servantB4=new Servant[100];
Servant[] servantB5=new Servant[100];
Servant[] servantB6=new Servant[4];

int times;
int count;
boolean loopMode1;
boolean loopMode2;


void setup()
{
  y=0;
  alpha=255;
  dAlpha=1;
  sequence=0;
  vControl1=0;
  vControl2=0;
  xufu=1;
  bladeNum=0;
  butterflyNum=0;
  ybg1=0;
  dybg1=2;
  ybg2=0;
  dybg2=-2;
  times=0;

  count=0;
  minim=new Minim(this);
  penglai= minim.loadFile("begin.mp3");
  fei=minim.loadFile("end.mp3");
  shenjuan= minim.loadFile("shenjuan.mp3");
  busi= minim.loadFile("busi.mp3");

  loopMode1=false;
  loopMode2=false;



  size(1000, 800);
  begin=loadImage("cover.jpg");
  intro=loadImage("intro.jpg");
  finish=loadImage("finish.png");
  for (int i=0; i<4; i++)
  {
    end[i]=loadImage("end"+i+".png");
  }

  stage=0;



  servantB=loadImage("servantB.png");
  servantG=loadImage("servantG.png");
  servantR=loadImage("servantR.png");
  servantP=loadImage("servantP.png");
  blueS=loadImage("blueS.png");
  blueB=loadImage("blueB.png");
  mokou=loadImage("mokou.png");

  jadeRS=loadImage("jadeRS.png");
  scale=loadImage("scale.png");
  maJiangR=loadImage("maJiangR.png");
  maJiangP=loadImage("maJiangP.png");
  maJiangB=loadImage("maJiangB.png");
  P=loadImage("power.png");
  player=loadImage("life.png");
  spell=loadImage("bomb.png");
  bg1=loadImage("bg1.png");
  bg2=loadImage("bg2.png");
  size(1000, 800);
  powerNum=0;
  lifeNum=4;
  bombNum=3;
  wPlayer=45;
  hPlayer=60;
  for (int i=0; i<servant0.length; i++)
  {
    servant0[i]=new Servant(100-80*i, 0-80*i, 2, 2, servantP, jadeRS, 20, 0, 4, 0, 2);
    servant1[i]=new Servant(width-100+80*i, 0-80*i, -2, 2, blueS, scale, 20, 0, 3, 4, 2);
    servant4[i]=new Servant(100-80*i, 0-80*i, 2, 2, servantP, jadeRS, 40, 0, 4, 0, 2);
    servant5[i]=new Servant(width-100+80*i, 0-80*i, -2, 2, blueS, scale, 40, 0, 3, 4, 2);
    servant6[i]=new Servant(100, height-80*i+1200, 0, -2, servantG, jadeRS, 40, 0, 4, 7, 2);
    servant7[i]=new Servant(width-100, height-80*i+1200, 0, -2, servantG, jadeRS, 40, 0, 3, 7, 2);
    servant8[i]=new Servant(100, height-80*i+1200, 0, -2, servantG, jadeRS, 40, 0, 4, 7, 2);
    servant9[i]=new Servant(width-100, height-80*i+1200, 0, -2, servantG, jadeRS, 40, 0, 3, 7, 2);
    servant10[i]=new Servant(100, 0-80*i, 0, 2, servantP, jadeRS, 40, 0, 0, 7, 2);
    servant11[i]=new Servant(width-100, 0-80*i, 0, 2, servantP, jadeRS, 40, 0, 0, 7, 2);
    servant12[i]=new Servant(15+80*i, 0-i*30, 0, 2, servantP, jadeRS, 40, 0, 5, 10, 2);
    servant13[i]=new Servant(width-80*i, 0-i*30, 0, 2, servantP, jadeRS, 40, 0, 5, 10, 2);
    servant14[i]=new Servant(-10-80*i, random(50, 300), 2, 0, servantR, jadeRS, 120, 0, 0, 5, 2);
    servant15[i]=new Servant(10+width+80*i, random(50, 300), -2, 0, servantR, jadeRS, 120, 0, 0, 5, 2);
  }
  servant2[0]=new Servant(width/2-60, -20, 0, 1, blueB, jadeRS, 60, 0, 1, 8, 0);
  servant3[0]=new Servant(width/2+60, -20, 0, 1, blueB, jadeRS, 60, 0, 2, 8, 0);
  servant2[1]=new Servant(width/2-60, -20, 0, 1, blueB, jadeRS, 80, 0, 2, 2, 1);
  servant3[1]=new Servant(width/2+60, -20, 0, 1, blueB, jadeRS, 80, 0, 1, 2, 1);
  servant2[2]=new Servant(width/2-60, -20, 0, 1, blueB, jadeRS, 80, 0, 0, 9, 2);
  servant3[2]=new Servant(width/2+60, -20, 0, 1, blueB, jadeRS, 80, 0, 0, 9, 2);
  servant2[3]=new Servant(width/2-120, -20, 0, 1, blueB, jadeRS, 120, 0, 1, 6, 1);
  servant3[3]=new Servant(width/2+120, -20, 0, 1, blueB, jadeRS, 120, 0, 2, 6, 1);
  servant2[4]=new Servant(width/2, -20, 0, 1, blueB, jadeRS, 120, 0, 0, 6, 0);

  for (int b=0; b<8; b++)
  {
    servantB1[b]=new Servant(-10, -10, 2, 0, servantB, maJiangR, 300, 0+45*b, 6, 11, 1);
  }
  for (int boss2=0; boss2<100; boss2++)
  {
    servantB2[boss2]=new Servant(501, 267, 0, 2, servantB, maJiangB, 300, 0, 7, 12, 2);
    servantB3[boss2]=new Servant(501, 267, 2, 0, servantB, maJiangB, 300, 0, 8, 12, 2);
    servantB4[boss2]=new Servant(501, 267, 0, -2, servantB, maJiangB, 300, 0, 7, 12, 2);
    servantB5[boss2]=new Servant(501, 267, -2, 0, servantB, maJiangB, 300, 0, 8, 12, 2);   
  }
  for (int boss3=0; boss3<4; boss3++)
  {
    servantB6[boss3]=new Servant(-10, -10, 0, 0, servantB, maJiangP, 400, 0+90*boss3, 0, 11, 1);
  }


  playerDe=loadImage("playerDe.png");

  yaomeng1=loadImage("yaomeng1.png");
  yaomeng2=loadImage("yaomeng2.png");
  yaomeng3=loadImage("yaomeng3.png");
  youyouzi1=loadImage("youyouzi1.png");
  youyouzi2=loadImage("youyouzi2.png");
  youyouzi3=loadImage("youyouzi3.png");
  blade=loadImage("blade.png");
  butterfly=loadImage("butterfly.png");
  deadButterfly=loadImage("deadButterfly.png");
  for (int i=0; i<blade1.length; i++)
  {
    blade1[i]=new Blade(-100, -100);
    blade2[i]=new Blade(-100, -100);
    blade3[i]=new Blade(-100, -100);
    butterfly1[i]=new Butterfly(-100, -100);
    butterfly2[i]=new Butterfly(-100, -100);
    butterfly3[i]=new Butterfly(-100, -100);
    power[i]=new Drop(100, 100, P, 2);   
  }
  xPlayer=width/2;
  yPlayer=height/2;
  left=false;
  right=false;
  up=false;
  down=false;
  shift=false;
  zPressed=false;
  xPressed=false;
  for (int j=0; j<30; j++)
  {
    wave[j]=false;
  }
  vPlayer=8;

  xMokou=0;
  yMokou=0;
  dxMokou=0;
  dyMokou=0;
  wMokou=100;
  hMokou=160;
}

void draw()
{
  if (stage==0 || stage==1)
  {
    fei.play();  
    shenjuan.pause();
    shenjuan.rewind();
    penglai.pause();
    penglai.rewind();
    busi.pause();
    busi.rewind();
  } else if (stage==2)
  {
    if (loopMode1==false)
    {

      shenjuan.loop();
      loopMode1=true;
    }
    //    busi.pause();
    //    busi.rewind();
    fei.pause();
    fei.rewind();
    penglai.pause();
    penglai.rewind();
  } else if (stage==4)
  {
    penglai.play();
    fei.pause();
    fei.rewind();
    shenjuan.pause();
    shenjuan.rewind();
    busi.pause();
    busi.rewind();
  }


  if (stage==0)
  {
    welcomePage();
  } else if (stage==1)
  {
    intro();
  } else if (stage==2)
  {
    gameBegin();
  } else if (stage==3)
  {
    finishPage();
  } else if (stage==4)
  {
    endPage();
  }
}
void keyPressed()
{
  if (stage==0)
  {
    welcomePageKey();
  } else if (stage==1)
  {
    if (key=='b'||key=='B')
    {
      stage=0;
    }
  } else if (stage==2)
  {
    gameBeginKey();
  } else if (stage==3)
  {
    finishPageKey();
  }
}

void welcomePage()
{
  imageMode(CORNER);
  image(begin, 0, 0, width, height);

  textSize(50);
  text("Start", 80, 130);
  text("Intioduction", 80, 193);
  text("Exit", 80, 256);
  fill(0, 255, 0);
  noStroke();
  ellipse(50, 120+y, 20, 20);
  if (y>126)
  {
    y=0;
  }
  if (y<0)
  {
    y=126;
  }
  imageMode(CENTER);
}
void intro()
{
  imageMode(CORNER);
  image(intro, 0, 0, width, height);
  stroke(255);
  textSize(25);
  text("Use the direction key to control the direction", 100, 200);
  text("Presse Z to fire", 100, 250);
  text("Presse SHIFT to switch the characters", 100, 300);
  text("Presse X to use the bomb", 100, 350); 
  text("Presse B to come back to the welcome page", 100, 400);
  imageMode(CENTER);
}
void finishPage()
{
  imageMode(CORNER);
  image(finish, 0, 0, width, height);
  textSize(50);
  text("Restart", 80, 130);
  text("Exit", 80, 256);
  fill(0, 255, 0);
  noStroke();
  ellipse(50, 120+y, 20, 20);
  if (y>126)
  {
    y=0;
  }
  if (y<0)
  {
    y=126;
  }
  imageMode(CENTER);
}
void welcomePageKey()
{
  if (keyCode==UP)
  {
    y=y-63;
  }
  if (keyCode==DOWN)
  {
    y=y+63;
  }
  if (y==63)
  {
    if (key=='z'||key=='Z')
    {
      stage=1;
    }
  } else if (y==0)
  {
    if (key=='z'||key=='Z')
    {

      loopMode1=false;
      loopMode2=false;    
      stage=2;
    }
  } else if (y==126)
  {
    if ( key=='z'||key=='Z')
    {
      exit();
    }
  }
}
void finishPageKey()
{
  if (keyCode==UP)
  {
    y=y-126;
  }
  if (keyCode==DOWN)
  {
    y=y+126;
  }
  if (y==0 )
  {
    if ( key=='z'||key=='Z')
    {
      fei.pause(); 
      fei.rewind();  
      shenjuan.pause();
      shenjuan.rewind();
      penglai.pause();
      penglai.rewind();
      busi.pause();
      busi.rewind();
      setup();
    }
  }
  if (y==126)
  {
    if (key=='z'||key=='Z')
    {
      exit();
    }
  }
}
void gameBegin()
{

  count++;

  imageMode(CENTER);

  backgroundMode();
  gameText();
  timeLine();

  move();            
  fireMode();
  award();

  wave();
  servantHit();
  servantDie();
  if (lifeNum<=0)
  {
    stage=3;
  }
  imageMode(CORNER);
}

void gameBeginKey()
{

  if (key=='u'||key=='U')
  {
    stage=4;
  }
  fireMode1Key();
  moveKey();
}
void endPage()
{
  imageMode(CORNER);
  alpha=alpha-dAlpha;
  image(end[sequence], 0, 0, width, height);  
  fill(255, alpha);
  rect(0, 0, width, height);
  if (alpha<=0||alpha>=255)
  {
    dAlpha=-dAlpha;
  }
  if (alpha>=255)
  {
    if (sequence<3)
    {
      sequence=sequence+1;
    }
  }
  if (sequence==3&& alpha<=0)
  {
    fei.pause(); 
    fei.rewind();  
    shenjuan.pause();
    shenjuan.rewind();
    penglai.pause();
    penglai.rewind();
    busi.pause();
    busi.rewind();
    setup();
  }
  imageMode(CENTER);
}



void award()
{
  if (powerNum==50)
  {
    bombNum=bombNum+1;
    powerNum=powerNum+1;
  } else if (powerNum==100)
  {
    lifeNum=lifeNum+1;
    powerNum=powerNum+1;
  }
}
void backgroundMode()
{
  if (wave[15]==true || wave[16]==true ||wave[17]==true)
  {

    fill(0, 15);
    rect(0, 0, width, height);
    if (loopMode2==false)
    {
      busi.play();
      shenjuan.pause();
      shenjuan.rewind();
      fei.pause();
      fei.rewind();
      penglai.pause();
      penglai.rewind();
      loopMode2=true;
    }
  } else
  {
    imageMode(CORNER);
    ybg1=ybg1+dybg1;
    ybg2=ybg2+dybg2;
    image(bg2, 0, ybg2, width, height);
    image(bg2, 0, ybg2+height, width, height);
    image(bg1, 0, ybg1, width, height);
    image(bg1, 0, ybg1-height, width, height);

    if (ybg1==height)
    {
      ybg1=0;
    }
    if (ybg2==-height)
    {
      ybg2=0;
    }
    imageMode(CENTER);
  }
}
void gameText()
{
  fill(255);
  textSize(25);
  text("life:"+lifeNum, width-150, 50);
  text("bomb:"+bombNum, width-150, 120);
  text("power:"+powerNum, width-150, 190);
}
void timeLine()
{
  if (count> 5*60)
  {
    wave[0]=true;
  } 
  if (count>20*60)
  {
    wave[1]=true;
  }
  if (count>30*60)
  {
    wave[0]=false;
    wave[3]=true;
  } 
  if (count>40*60)
  {
    wave[1]=false;
    wave[4]=true;
  } 
  if (count>50*60)
  {
    wave[3]=false;
    wave[5]=true;
  }
  if (count>60*60)
  {
    wave[4]=false;
    wave[6]=true;
  }
  if (count>75*60)
  {
    wave[5]=false;
    wave[7]=true;
  }
  if (count>85*60)
  {
    wave[6]=false;
    wave[8]=true;
  }
  if (count>95*60)
  {
    wave[7]=false;
    wave[9]=true;
  }
  if (count>105*60)
  {
    wave[8]=false;
    wave[10]=true;
  }
  if (count>115*60)
  {
    wave[9]=false;
    wave[11]=true;
  }
  if (count>125*60)
  {
    wave[10]=false;
    wave[12]=true;
  }
  if (count>135*60)
  {
    wave[11]=false;
    wave[13]=true;
  }
  if (count>155*60)
  {
    wave[12]=false;
    wave[14]=true;
  }
  if (count>170*60)
  {
    wave[13]=false;
    wave[14]=false;
    wave[15]=true;
  }
  if (count>175*60)
  {

    wave[15]=false;
    wave[16]=true;
  }
  if (count>240*60 || servantB1[0].hp<=3)
  {
    wave[16]=false;
    wave[17]=true;
  }
  if (count>300*60 || servantB6[0].hp<=3)
  {   
    wave[17]=false;
    stage=4;
  }
}

void wave()
{
  if (wave[0])
  {
    for (int i=0; i<20; i++)
    {
      servant0[i].move();
      servant0[i].fire();
      if (count%120==0)
      {
        servant0[i].ready(); 
      }
    }
  }  
  if (wave[1])
  {
    for (int i=0; i<20; i++)
    {
      servant1[i].move();
      servant1[i].fire();
      if (count%120==0)
      {
        servant1[i].ready();    
      }
    }
  }  
  if (wave[3])
  {

    servant2[0].move();
    servant2[0].fire();
    servant3[0].move();
    servant3[0].fire();
    if (count%120==0)
    {
      servant2[0].ready(); 
      servant3[0].ready();   
    }
  } 
  if (wave[4])
  {
    for (int i=0; i<20; i++)
    {
      servant4[i].move();
      servant4[i].fire();
      if (count%120==0)
      {
        servant4[i].ready();
      }
    }
  }  
  if (wave[5])
  {
    for (int i=0; i<20; i++)
    {
      servant5[i].move();
      servant5[i].fire();

      if (count%120==0)
      {
        servant5[i].ready();     
      }
    }
  }
  if (wave[6])
  {

    servant2[1].move();
    servant2[1].fire();
    servant3[1].move();
    servant3[1].fire();
    if (count%30==0)
    {
      servant2[1].ready(); 
      servant3[1].ready();   
    }
  }
  if (wave[7])
  {
    for (int i=0; i<20; i++)
    {
      servant6[i].move();
      servant6[i].fire();
      servant7[i].move();
      servant7[i].fire();
      if (count%120==0)
      {
        servant6[i].ready();
        servant7[i].ready();    
      }
    }
  }
  if (wave[8])
  {
    for (int i=0; i<20; i++)
    {
      servant8[i].move();
      servant8[i].fire();
      servant9[i].move();
      servant9[i].fire();
      if (count%120==0)
      {
        servant8[i].ready();
        servant9[i].ready();    
      }
    }
  }
  if (wave[9])
  {
    for (int i=0; i<20; i++)
    {
      servant10[i].move();
      servant10[i].fire();
      servant11[i].move();
      servant11[i].fire();
      if (count%120==0)
      {
        servant10[i].ready();
        servant11[i].ready();   
      }
    }
  }
  if (wave[10])
  {

    servant2[2].move();
    servant2[2].fire();
    servant3[2].move();
    servant3[2].fire();
    if (count%120==0)
    {
      servant2[2].ready(); 
      servant3[2].ready();    
    }
  }
  if (wave[11])
  {
    for (int i=0; i<20; i++)
    {
      servant12[i].move();
      servant12[i].fire();
      if (count%120==0)
      {
        servant12[i].ready();     
      }
    }
  }
  if (wave[12])
  {
    for (int i=0; i<20; i++)
    {
      servant13[i].move();
      servant13[i].fire();
      if (count%120==0)
      {
        servant13[i].ready();     
      }
    }
  }
  if (wave[13])
  {
    for (int i=0; i<20; i++)
    {
      servant14[i].move();
      servant14[i].fire();
      servant15[i].move();
      servant15[i].fire();
      if (count%180==0)
      {
        servant14[i].ready(); 
        servant15[i].ready();      
      }
    }
  }
  if (wave[14])
  {

    servant2[3].move();
    servant2[3].fire();
    servant3[3].move();
    servant3[3].fire();
    servant2[4].move();
    servant2[4].fire();

    if (count%120==0)
    {
      servant2[3].ready(); 
      servant3[3].ready();  
      servant2[4].ready(); 
    }
  }
  if (wave[15]==true)
  {
    mokouMove1();
    dxMokou=2;
    for (int b=0; b<8; b++)
    {
      servantB1[b].x=501;
      servantB1[b].y=167;
    }
  }
  if (wave[16]==true)
  {

    for (int b=0; b<8; b++)
    {

      servantB1[b].move();
      servantB1[b].fire();
    }
    if (count%5==0)
    {
      for (int b=0; b<8; b++)
      {
        servantB1[b].ready();
      }   
    }
    mokouMove2();
    for (int boss3=0; boss3<4; boss3++)
    {
      servantB6[boss3].x=501;
      servantB6[boss3].y=267;
    }
  }
  if (wave[17]==true)
  {
    for (int boss3=0; boss3<4; boss3++)
    {
      servantB6[boss3].move();
      servantB6[boss3].fire();
    }
    if (count%5==0)
    {
      for (int boss3=0; boss3<4; boss3++)
      {
        servantB6[boss3].ready();
      }
    }

    if (xufu<99)
    {
      for (int boss2=0; boss2<xufu; boss2++)
      {

        servantB2[boss2].move();
        servantB2[boss2].fire();
        servantB3[boss2].move();
        servantB3[boss2].fire();
        servantB4[boss2].move();
        servantB4[boss2].fire();
        servantB5[boss2].move();
        servantB5[boss2].fire();


        if (count%20==0)
        {  

          servantB2[boss2].ready(); 
          servantB3[boss2].ready(); 
          servantB4[boss2].ready(); 
          servantB5[boss2].ready();
        }
      }
    }
    if (count%120==0)
    {
      xufu++;
    }
    xMokou=501;
    yMokou=267;
    dxMokou=0;
    dyMokou=0;
    image(mokou, xMokou, yMokou, wMokou, hMokou);
  }
}

void servantHit()
{

  for (int i=0; i<20; i++)
  {
    servant0[i].hit();
    servant1[i].hit();
    servant4[i].hit();
    servant5[i].hit();
    servant6[i].hit();
    servant7[i].hit();
    servant8[i].hit();
    servant9[i].hit();
    servant10[i].hit();
    servant11[i].hit();
    servant12[i].hit();
    servant13[i].hit();
    servant14[i].hit();
    servant15[i].hit();
  }
  servant2[0].hit();
  servant3[0].hit();
  servant2[1].hit();
  servant3[1].hit();
  servant2[2].hit();
  servant3[2].hit();
  servant2[3].hit();
  servant3[3].hit();
  servant2[4].hit();
  for (int b=0; b<8; b++)
  {
    servantB1[b].hit();
  }
  for (int boss3=0; boss3<4; boss3++)
  {
    servantB6[boss3].hit();
  }
}

void servantDie()
{

  for (int i=0; i<20; i++)
  {
    servant0[i].die();
    servant0[i].dropReset();
    servant1[i].die();
    servant1[i].dropReset();
    servant4[i].die();
    servant4[i].dropReset();
    servant5[i].die();
    servant5[i].dropReset();
    servant6[i].die();
    servant6[i].dropReset();
    servant7[i].die();
    servant7[i].dropReset();
    servant8[i].die();
    servant8[i].dropReset();
    servant9[i].die();
    servant9[i].dropReset();
    servant10[i].die();
    servant10[i].dropReset();
    servant11[i].die();
    servant11[i].dropReset();
    servant12[i].die();
    servant12[i].dropReset();
    servant13[i].die();
    servant13[i].dropReset();
    servant14[i].die();
    servant14[i].dropReset();
    servant15[i].die();
    servant15[i].dropReset();
  }
  for (int boss3=0; boss3<4; boss3++)
  {
    servantB6[boss3].die();
    servantB6[boss3].dropReset();
  }

  for (int b=0; b<8; b++)
  {
    servantB1[b].die();
    servantB1[b].dropReset();
  }
  servant2[0].die();
  servant2[0].dropReset();
  servant3[0].die();
  servant3[0].dropReset();

  servant2[1].die();
  servant2[1].dropReset();
  servant3[1].die();
  servant3[1].dropReset();
  servant2[2].die();
  servant2[2].dropReset();
  servant3[2].die();
  servant3[2].dropReset();
  servant2[3].die();
  servant2[3].dropReset();
  servant3[3].die();
  servant3[3].dropReset();

  servant2[4].die();
  servant2[4].dropReset();
}

void mokouMove1()
{
  image(mokou, xMokou, yMokou, wMokou, hMokou);
  if (xMokou > width/2 && xMokou< width/2+3)
  {
    dxMokou=0;
    dyMokou=0;
  } else {
    dxMokou=3;
    dyMokou=1;
  }
  xMokou=xMokou+dxMokou;
  yMokou=yMokou+dyMokou;
}
void mokouMove2()
{

  image(mokou, xMokou, yMokou, wMokou, hMokou);
  if (xMokou > width/2+200 && xMokou< width/2+202 && dxMokou==2)
  {

    dxMokou=-2;
    dyMokou=1;
  } else if (yMokou > height/2 && yMokou< height/2 +2 && dyMokou==1) {
    dxMokou=-2;
    dyMokou=-1;
  } else if (xMokou < width/2-200 && xMokou> width/2-202 && dxMokou==-2 )
  {

    dyMokou=0;
    dxMokou=2;
  }
  xMokou=xMokou+dxMokou;
  yMokou=yMokou+dyMokou;
}

class Servant
{
  float x;
  float y;
  float dy;
  float dx;
  float w;
  PImage pic;
  PImage bulletPic;
  float angle;
  float dAngle;
  int times;
  int dropTimes;
  float hp;
  boolean alive;
  boolean resetDrop;
  float far;
  int moveMode;
  int fireMode;
  int dropMode;
  BulletStraight [] bullet1=new BulletStraight[300];
  BulletShan [] bullet2=new BulletShan[300];
  BulletFlower [] bullet3=new BulletFlower[300];
  BulletAim[] bullet4=new BulletAim[300];
  MaJiang[] maJiang1=new MaJiang[3000];
  Drop[] power=new Drop[300];
  Drop[] life=new Drop[300];
  Drop[] bomb=new Drop[300];  
  Servant( float x_, float y_, float dx_, float dy_, PImage pic_, PImage bulletPic_, float hp_, float angle_, int moveMode_, int fireMode_, int dropMode_)
  {
    x=x_;
    y=y_;
    dx=dx_;
    dy=dy_;
    w=40;
    pic=pic_;
    bulletPic=bulletPic_;
    angle=angle_;
    dAngle=2;
    hp=hp_;
    alive=true;
    dropTimes=0;
    resetDrop=false;
    far=2147483647;
    moveMode=moveMode_;
    fireMode=fireMode_;
    dropMode=dropMode_;
    for (int i=0; i<bullet1.length; i++)
    {
      bullet1[i]=new BulletStraight(-100, -30, 2, bulletPic);
      bullet2[i]=new BulletShan(1000, 1000, 2, bulletPic);
      bullet3[i]=new BulletFlower(100, -100, 0, bulletPic);
      bullet4[i]=new BulletAim(-100, -30, bulletPic);
      power[i]=new Drop(-100, -30, P, 2);
      life[i]=new Drop(-100, -30, player, 0);
      bomb[i]=new Drop(-100, -30, spell, 1);
    }
    for (int j=0; j<1200; j++)
    {
      maJiang1[j]=new MaJiang(-20, -20, 0, 0, bulletPic);
    }
  }
  void move()
  {
    if (alive)
    {
      imageMode(CENTER);
      image(pic, x, y, w, w);    
      x=x+dx;
      y=y+dy;
      if (moveMode==1)
      {        
        if (y>200  && y<203)
        {
          dy=0;
          dx=1;
        }
      } else if (moveMode==2)
      {      
        if (y>200  && y<203)
        {
          dy=0;
          dx=-1;
        }
      } else if (moveMode==3)
      {      
        if (y>300  && y<303)
        {
          dy=-1;
          dx=-1;
        }
      } else if (moveMode==4)
      {      
        if (y>300  && y<303)
        {
          dy=-1;
          dx=1;
        }
      } else if (moveMode==5)
      {      
        if (y>300  && y<303)
        {
          dy=-dy;
        }
      } else if (moveMode==6)
      {
        if (x > width/2+200 && x< width/2+202 && dx==2)
        {

          dx=-2;
          dy=1;
        } else if (y> height/2 && y< height/2 +2 && dy==1) {
          dx=-2;
          dy=-1;
        } else if (x < width/2-200 && x> width/2-202 && dx==-2 )
        {
          dy=0;
          dx=2;
        }
      } else if (moveMode==7)
      {
        if (dy!=0)
        {
          if ((y>67 && y<70) ||( y>467 && y<470))
          {
            dx=dy;
            dy=0;
          }
        }
      } else if (moveMode==8)
      {
        if (dx!=0) {

          if ((x>701 && x<704) || (x>301 && x<304))
          {           
            dy=-dx;
            dx=0;
          }
        }
      }
      if (angle==360)
      {
        angle=0;
      }
      angle=angle+dAngle;
    }
  }
  void fire()
  {

    for (int i=0; i<40; i++)
    {
      bullet1[i].display();
      bullet2[i].display();
      bullet3[i].display();  
      bullet4[i].display();
      power[i].display();
      life[i].display();
      bomb[i].display();
    }
    for (int p=0; p<times; p++)
    {
      maJiang1[p].dxy=5;
      maJiang1[p].move();
    }
  }

  void ready()
  {
    if (alive)
    {

      if (times<1200)
      {

        if (alive==true)
        {
          if (fireMode==0)
          {
            bullet1[times].reset(getLocationx(), getLocationY()); 
            bullet4[times].reset(getLocationx(), getLocationY());
          } else if (fireMode==1)
          {
            bullet2[times].setLocation(getLocationx(), getLocationY());
          } else if (fireMode==2)
          {
            bullet3[times].setLocation(getLocationx(), getLocationY());
          } else if (fireMode==3)
          {
            bullet4[times].reset(getLocationx(), getLocationY());
          } else if (fireMode==4)
          {
            for (int i=0; i<5; i++) //串弹
            {
              bullet1[i+times*5].reset(getLocationx(), getLocationY()+i*10-10);
            }
            bullet4[times].reset(getLocationx(), getLocationY());
          } else if (fireMode==5)
          {
            for (int i=0; i<5; i++) //串弹
            {
              bullet2[i+times*5].setLocation(getLocationx()+i*10-10, getLocationY()+i*10-10);
            }
          } else if (fireMode==6)
          {
            for (int i=0; i<5; i++) //串弹
            {
              bullet3[i+times*5].setLocation(getLocationx()+i*10-10, getLocationY()+i*10-10);
            }
          } else if (fireMode==7)
          {
            for (int i=0; i<5; i++) //串弹
            {
              bullet4[i+times*5].reset(getLocationx(), getLocationY()+i*10-10);
            }
          } else if (fireMode==8)
          {
            bullet2[times].setLocation(getLocationx(), getLocationY());
            bullet4[times].reset(getLocationx(), getLocationY());
          } else if (fireMode==9)
          {
            bullet3[times].setLocation(getLocationx(), getLocationY());
            for (int i=0; i<5; i++) //串弹
            {
              bullet4[i+times*5].reset(getLocationx(), getLocationY()+i*10-10);
            }
          } else if (fireMode==10)
          {
            bullet2[times].setLocation(getLocationx(), getLocationY());
            for (int i=0; i<5; i++) //串弹
            {
              bullet4[i+times*5].reset(getLocationx(), getLocationY()+i*10-10);
            }
          } else if (fireMode==11)
          {
            maJiang1[times].reset(getLocationx(), getLocationY(), getAngle());
          } else if (fireMode==12)
          {
            bullet1[times].reset(getLocationx(), getLocationY());
          }

          for (int i=0; i<5; i++) //串弹
          {
            //            bullet1[i+times*5].reset(getLocationx(), getLocationY()+i*10-10);    
            //            bullet2[i+times*5].setLocation(getLocationx()+i*10-10, getLocationY()+i*10-10);
            //            bullet3[i+times*5].setLocation(getLocationx()+i*10-10, getLocationY()+i*10-10);
            //            bullet4[i+times*5].reset(getLocationx(), getLocationY()+i*10-10);
          }
          //          maJiang1[times].reset(getLocationx(), getLocationY(), getAngle());
        }
        times++;
      }
    }
  }
  void hit()
  {
    if (alive && x-w/2>0 && y-w/2>0 && x<width-w/2 && y<height-w/2)
    {

      for (int i=0; i<100; i++)
      {
        if (blade1[i].x+(blade1[i].w)/2  >=  x-(w/2)  &&  x+(w/2)  >=  blade1[i].x-(blade1[i].w)/2  && blade1[i].y+(blade1[i].h)/2  >=  y-(w/2)  &&  y+(w/2)  >=  blade1[i].y-(blade1[i].h)/2)
        {                                                                                                                                                                                    
          hp=hp-1;
          blade1[i].x=-1000;
          blade1[i].y=-1000;
        }
        //           } 
        if (blade2[i].x+(blade2[i].w)/2 >= x-(w/2)&&x+(w/2) >= blade2[i].x-(blade2[i].w)/2 &&blade2[i].y+(blade2[i].h)/2 >= y-(w/2)&&y+(w/2) >= blade2[i].y-(blade2[i].h)/2)
        {                                                                                                                                                                                    
          hp=hp-1;
          blade2[i].x=-1000;
          blade2[i].y=-1000;
        } 
        if (blade3[i].x+(blade3[i].w)/2 >= x-(w/2)&&x+(w/2) >= blade3[i].x-(blade3[i].w)/2 &&blade3[i].y+(blade3[i].h)/2 >= y-(w/2)&&y+(w/2) >= blade3[i].y-(blade3[i].h)/2)
        {                                                                                                                                                                                    
          hp=hp-1;
          blade3[i].x=-1000;
          blade3[i].y=-1000;
        } 
        int Num=10;

        for (int p=0; p<Num; p++)
        {
          if (butterfly2[i].x[p]+(butterfly2[i].w)/2 >= x-(w/2) && x+(w/2) >= butterfly2[i].x[p]-(butterfly2[i].w)/2 && butterfly2[i].y[p]+(butterfly2[i].h)/2 >= y-(w/2)&&y+(w/2) >= butterfly2[i].y[p]-(butterfly2[i].h)/2)
          {                                                                                                                                                                                    
            hp=hp-1;
            butterfly2[i].x[p]=-1000;
            butterfly2[i].y[p]=-1000;
          }
          if (butterfly3[i].x[p]+(butterfly3[i].w)/2 >= x-(w/2) && x+(w/2) >= butterfly3[i].x[p]-(butterfly3[i].w)/2 && butterfly3[i].y[p]+(butterfly3[i].h)/2 >= y-(w/2)&&y+(w/2) >= butterfly3[i].y[p]-(butterfly3[i].h)/2)
          {                                                                                                                                                                                    
            hp=hp-1;
            butterfly3[i].x[p]=-1000;
            butterfly3[i].y[p]=-1000;
          }
          if (butterfly1[i].x[p]+(butterfly1[i].w)/2 >= x-(w/2) && x+(w/2) >= butterfly1[i].x[p]-(butterfly1[i].w)/2 && butterfly1[i].y[p]+(butterfly1[i].h)/2 >= y-(w/2)&&y+(w/2) >= butterfly1[i].y[p]-(butterfly1[i].h)/2)
          {                                                                                                                                                                                    
            hp=hp-1;
            butterfly1[i].x[p]=-1000;
            butterfly1[i].y[p]=-1000;
          }
        }
      }
    }
  }
  void die()
  {
    if (alive)
    {
      if (hp<=0)
      {
        alive=false;
      }
    }
  }
  void dropReset()
  {
    if (alive==false)
    {
      if (dropTimes<100 && resetDrop==false)
      {
        if (dropMode==0)
        {
          life[dropTimes].reset(getLocationx(), getLocationY());
        } 
        if (dropMode==1)
        {
          bomb[dropTimes].reset(getLocationx(), getLocationY());
        } else if (dropMode==2)
        {
          power[dropTimes].reset(getLocationx(), getLocationY());
        }      
        resetDrop=true;
      }
    }
  }


  float getLocationx()
  {
    return x;
  }
  float getLocationY()
  {
    return y;
  }
  float getAngle()
  {
    return angle;
  }
} 

class BulletStraight
{
  float x;
  float y;
  float dx;
  float dy;
  float dxy;
  float angle;
  PImage pic;
  float w;
  int time;
  BulletStraight(float x_, float y_, float dy_, PImage pic_)
  {
    x=x_;
    y=y_;
    pic=pic_;
    dx=0;
    dy=dy_;
    w=15;
    time=0;
  }
  void display()
  {
    image(pic, x, y, w, w);
    y=y+dy;
    if (shift==true)
    {
      if (x+w/2> xPlayer-4 && xPlayer+4 > x-w/2  && y+w/2> yPlayer-4 && yPlayer+4 > y-w/2 )
      {
        y=-100;
        dy=0;
        dx=0;
        lifeNum=lifeNum-1;
        bombNum=3;
        xPressed=true;        

      }
    } else if (shift==false)
    {
      if (x+w/2> xPlayer-2 && xPlayer+2 > x-w/2  && y+w/2> yPlayer-2 && yPlayer+2 > y-w/2 )
      {
        y=-100;
        dy=0;
        dx=0;
        lifeNum=lifeNum-1;
        bombNum=3;
        xPressed=true;
      }
    }
    if (count%60==0)
    {
      xPressed=false;
    }
    if (y>height || x>width || x<0 || y<0 )
    {
      y=1000;
    }
    if (xPressed)
    {
      y=1000;
      image(playerDe, xPlayer, yPlayer, 90, 90);
    }
  }

  void reset(float new_x, float new_y)
  {
    this.x=new_x;
    this.y=new_y;
  }
}

class BulletShan
{
  int flowerNum=10;
  float []x=new float [flowerNum];
  float []y=new float [flowerNum];
  float []dx=new float [flowerNum];
  float []dy=new float [flowerNum];
  float angle;
  float dAngle;
  PImage pic;
  float w;
  float dxy;
  int times;
  BulletShan(float x_, float y_, float dxy_, PImage pic_)
  {

    for (int i=0; i<flowerNum; i++)
    {
      x[i]=x_;
      y[i]=y_;
      dx[i]=0;
      dy[i]=0;
      angle=30;
      dAngle=10;
    }
    dxy=dxy_;
    pic=pic_;
    w=15;
    times=0;
  }
  void display()
  {
    for (int i=0; i<flowerNum; i++)
    {

      if (times<flowerNum)
      {
        angle=angle+dAngle;
        dx[times]=dxy*cos(radians(angle));
        dy[times]=dxy*sin(radians(angle));
        times++;
      } else {
      }
      x[i]=x[i]+dx[i];
      y[i]=y[i]+dy[i];        
      image(pic, x[i], y[i], w, w);
      if (x[i]>width||y[i]>height || x[i]<0 || y[i]<0 || xPressed)// ???
      {
        x[i]=1000;
        y[i]=1000;
      }
    }
    for (int i=0; i<flowerNum; i++)
    {
      if (shift==true)
      {
        if (x[i]+w/2> xPlayer-4 && xPlayer+4 > x[i]-w/2  && y[i]+w/2> yPlayer-4 && yPlayer+4 > y[i]-w/2 )
        {
          y[i]=-100;
          dy[i]=0;
          dx[i]=0;
          lifeNum=lifeNum-1;
          bombNum=3;
          xPressed=true;
        }
      } else if (shift==false)
      {
        if (x[i]+w/2> xPlayer-2 && xPlayer+2 > x[i]-w/2  && y[i]+w/2> yPlayer-2 && yPlayer+2 > y[i]-w/2 )
        {
          y[i]=-100;
          dy[i]=0;
          dx[i]=0;
          lifeNum=lifeNum-1;
          bombNum=3;
          xPressed=true;
        }
      }
      if (count%60==0)
      {
        xPressed=false;
      }
    }
  }


  void setLocation(float new_x, float new_y)
  {
    for (int i=0; i<x.length; i++)
    {
      this.x[i]=new_x;
      this.y[i]=new_y;
    }
  }
}

class BulletFlower
{
  int flowerNum=20;
  float []x=new float [flowerNum];
  float []y=new float [flowerNum];
  float []dx=new float [flowerNum];
  float []dy=new float [flowerNum];
  float angle;
  float dAngle;
  PImage pic;
  float w;
  float dxy;
  int times;
  int resetTimes;
  BulletFlower(float x_, float y_, float dxy_, PImage pic_)
  {

    for (int i=0; i<flowerNum; i++)
    {
      x[i]=x_;
      y[i]=y_;
      dx[i]=0;
      dy[i]=0;
      angle=30;
      dAngle=10;
    }
    resetTimes=0;
    dxy=dxy_;
    pic=pic_;
    w=15;
    times=0;
  }

  void display()
  {
    for (int i=0; i<flowerNum; i++)
    {

      if (times<flowerNum)
      {
        angle=angle+dAngle;
        dx[times]=dxy*cos(radians(degrees(angle)));
        dy[times]=dxy*sin(radians(degrees(angle)));
        times++;
      } else {
      }
      x[i]=x[i]+dx[i];
      y[i]=y[i]+dy[i];        
      image(pic, x[i], y[i], w, w);
      if (x[i]>width||y[i]>height || x[i]<0 || y[i]<0 || xPressed)// ???
      {
        x[i]=1000;
        y[i]=1000;
        //        dxy=0;
      }
    }
    for (int i=0; i<flowerNum; i++)
    {
      if (shift==true)
      {
        if (x[i]+w/2> xPlayer-4 && xPlayer+4 > x[i]-w/2  && y[i]+w/2> yPlayer-4 && yPlayer+4 > y[i]-w/2 )
        {

          y[i]=-100;
          dy[i]=0;
          dx[i]=0;
          lifeNum=lifeNum-1;
          bombNum=3;
          xPressed=true;
        }
      } else if (shift==false)
      {
        if (x[i]+w/2> xPlayer-2 && xPlayer+2 > x[i]-w/2  && y[i]+w/2> yPlayer-2 && yPlayer+2 > y[i]-w/2 )
        {

          y[i]=-100;
          dy[i]=0;
          dx[i]=0;
          lifeNum=lifeNum-1;
          bombNum=3;
          xPressed=true;
        }
      }
      if (count%60==0)
      {
        xPressed=false;
      }
    }
  }

  void setLocation(float new_x, float new_y)
  {
    for (int i=0; i<x.length; i++)
    {
      this.x[i]=new_x;
      this.y[i]=new_y;
      dxy=2;
      if (resetTimes<flowerNum)
      {
        angle=angle+dAngle;
        dx[i]=dxy*cos(radians(degrees(angle)));//???
        dy[i]=dxy*sin(radians(degrees(angle)));
        resetTimes++;
      } else {
      }
    }
  }
}
class BulletAim
{
  float x;
  float y;
  float dx;
  float dy;
  float dxy;
  float angle;
  PImage pic;
  float w;
  BulletAim(float x_, float y_, PImage pic_)
  {
    x=x_;
    y=y_;
    pic=pic_;
    dx=0;
    dy=0;
    w=15;
    dxy=0;
  }

  void display()
  {

    image(pic, x, y, w, w);
    y=y+dy;
    x=x+dx;
    if (y>height || x>width || x<0 || y<0|| xPressed)
    {
      y=-100;
      dy=0;
    }
    if (shift==true)
    {
      if (x+w/2> xPlayer-4 && xPlayer+4 > x-w/2  && y+w/2> yPlayer-4 && yPlayer+4 > y-w/2 )
      {
        y=-100;
        dy=0;
        dx=0;
        lifeNum=lifeNum-1;
        bombNum=3;
        xPressed=true;
      }
    } else if (shift==false)
    {
      if (x+w/2> xPlayer-2 && xPlayer+2 > x-w/2  && y+w/2> yPlayer-2 && yPlayer+2 > y-w/2 )
      {
        y=-100;
        dy=0;
        dx=0;
        lifeNum=lifeNum-1;
        bombNum=3;
        xPressed=true;
      }
    }
    if (count%60==0)
    {
      xPressed=false;
    }
  }
  void reset(float new_x, float new_y)
  {
    this.x=new_x;
    this.y=new_y;
    dxy=5;
    angle=degrees(atan((y-yPlayer)/(x-xPlayer)));   
    if (xPlayer<x)
    {
      angle=angle+180;
    }
    dx=dxy*cos(radians(angle));
    dy=dxy*sin(radians(angle));
  }
}
class MaJiang
{
  float x;
  float y;
  float dx;
  float dy;
  float dxy;
  float angle;
  float dAngle;
  PImage pic;
  float w;

  MaJiang(float x_, float y_, float dxy_, float angle_, PImage pic_)
  {
    x=x_;
    y=y_;
    dxy=dxy_;
    dx=0;
    dy=0;
    angle=angle_;
    w=20;
    pic= pic_;
  }

  void move()
  {

    dx=dxy*cos(radians(angle));
    dy=dxy*sin(radians(angle));
    x=x+dx;
    y=y+dy;
    if (x-w/2 > width || y-w/2 > height || xPressed)
    {
      x=1000;
      y=1000;
      angle=0;
    }
    image(pic, x, y, w, w);
    if (shift==true)
    {
      if (x+w/2> xPlayer-4 && xPlayer+4 > x-w/2  && y+w/2> yPlayer-4 && yPlayer+4 > y-w/2 )
      {
        y=-100;
        dy=0;
        dx=0;
        lifeNum=lifeNum-1;
        bombNum=3;
        xPressed=true;
      }
    } else if (shift==false)
    {
      if (x+w/2> xPlayer-2 && xPlayer+2 > x-w/2  && y+w/2> yPlayer-2 && yPlayer+2 > y-w/2 )
      {
        y=-100;
        dy=0;
        dx=0;
        lifeNum=lifeNum-1;
        bombNum=3;
        xPressed=true;
      }
    }
    if (count%60==0)
    {
      xPressed=false;
    }
  }
  void reset(float new_x, float new_y, float new_angle)
  {
    this.x=new_x;
    this.y=new_y;
    this.angle=new_angle;
  }
}

class Blade
{
  float x;
  float y;
  float dy;
  float dx;
  float vy;
  float dxy;
  float w;
  float h;
  Blade(float x_, float y_)
  {
    x=x_;
    y=y_;
    dx=0;
    dy=-5;
    vy=-10;
    w=30;
    h=40;
  }
  void display()
  {
    image(blade, x, y, w, h);
    x=x+dx;
    y=y+vy;
  }
  void reset(float new_x, float new_y)  
  {
    this.x=new_x;
    this.y=new_y;
  }
}
class Butterfly
{
  int Num=10;
  float []x=new float [Num];
  float []y=new float [Num];
  float []dy=new float [Num];
  float []dx=new float [Num];
  float dxy;
  float w;
  float h;
  float angle;
  float dAngle;
  int times;
  Butterfly(float x_, float y_)
  {
    for (int i=0; i<x.length; i++)
    {
      x[i]=x_;
      y[i]=y_;
      dx[i]=0;
      dy[i]=0;
    }
    w=15;
    h=15;
    angle=-30;
    dAngle=-10;
    times=0;
    dxy=5;
  }
  void display()
  {
    for (int i=0; i<x.length; i++)
    {
      if (times<x.length)
      {
        angle=angle+dAngle;
        dx[times]=dxy*cos(radians(angle));
        dy[times]=dxy*sin(radians(angle));
        times++;
      }
      x[i]=x[i]+dx[i];
      y[i]=y[i]+dy[i];
      if (x[i]<0 || y[i]<0 || x[i]>width-h/2 || y[i]>height+h/2)
      {
        x[i]=-1000;
        y[i]=-1000;
      }
      image(butterfly, x[i], y[i], w, h);
    }
  }
  void reset(float new_x, float new_y)  
  {
    for (int  i=0; i<Num; i++)
    {
      this.x[i]=new_x;
      this.y[i]=new_y;
    }
  }
}

class Drop
{
  float x;
  float y;
  float dy;
  PImage pic;
  float w;
  int mode;
  Drop(float x_, float y_, PImage pic_, int mode_)
  {
    x=x_;
    y=y_;
    pic=pic_;
    dy=0.5;
    w=15;
    mode=mode_;
  }
  void display()
  {
    image(pic, x, y, w, w);
    y=y+dy;

    if (y>height)
    {
      y=-100;
      dy=0;
    }
    if (x+w/2> xPlayer-20 && xPlayer+20 > x-w/2  && y+w/2> yPlayer-20 && yPlayer+20 > y-w/2 )
    {
      y=-100;
      dy=0;
      if (mode==0)
      {
        lifeNum=lifeNum+1;
      } else if (mode==1)
      {
        bombNum=bombNum+1;
        if (bombNum>8)
        {
          bombNum=8;
        }
      } else if (mode==2)
      {
        powerNum=powerNum+1;
      }
    }
  }
  void reset(float new_x, float new_y)
  {
    this.x=new_x;
    this.y=new_y;
  }
}
void keyReleased()
{
  if (key=='x' || key=='X')
  {
    xPressed=false;
  }
  if (key=='z'||key=='Z')
  {
    zPressed=false;
  }

  if (keyCode==SHIFT)
  {
    shift=false;
  }
  if (keyCode==LEFT)
  {
    left=false;
  }
  if (keyCode==RIGHT)
  {
    right=false;
  }
  if (keyCode==UP)
  {
    up=false;
  }
  if (keyCode==DOWN)
  {
    down=false;
  }
}
void fireMode()
{  
  for (int i=0; i<blade1.length; i++ )
  {
    blade1[i].display();

    butterfly1[i].display();

    if (powerNum>20)
    {
      butterfly2[i].display();
      butterfly3[i].display();
      blade2[i].display();
      blade3[i].display();
    }
  }
  if (zPressed==true&&shift==true&&butterflyNum<blade1.length)
  {
    vControl2++;
    if (vControl2%10==0)
    {  
      butterfly1[butterflyNum].reset(xPlayer, yPlayer-8);
      if (powerNum>20)
      {
        butterfly2[butterflyNum].reset(xPlayer-40, yPlayer-8);
        butterfly3[butterflyNum].reset(xPlayer+40, yPlayer-8);
      }
      butterflyNum++;
      if (butterflyNum==blade1.length)
      {
        butterflyNum=0;
      }
    }
  }


  if (zPressed==true&&shift==false&&bladeNum<blade1.length)
  {  
    vControl1++;
    if (vControl1%5==0)
    {      
      blade1[bladeNum].reset(xPlayer, yPlayer);
      if (powerNum>20)
      {
        blade2[bladeNum].reset(xPlayer-10, yPlayer);
        blade3[bladeNum].reset(xPlayer+10, yPlayer);
      }
      bladeNum++;
      if (bladeNum==blade1.length)
      {
        bladeNum=0;
      }
    }
  }
}
void fireMode1Key()
{
  if (key=='z'||key =='Z')
  {
    zPressed=true;
  }
}

void move()
{
  imageMode(CENTER);
  if (xPlayer<0)
  {
    xPlayer=0;
  } else if (xPlayer>width)
  {
    xPlayer=width;
  } else if (yPlayer<0)
  {
    yPlayer=0;
  } else if (yPlayer>height)
  {
    yPlayer=height;
  }

  if (up)
  {
    yPlayer=yPlayer-vPlayer;
  }
  if (down)
  {
    yPlayer=yPlayer+vPlayer;
  }
  if (left)
  {
    xPlayer=xPlayer-vPlayer;
  }
  if (right)
  {
    xPlayer=xPlayer+vPlayer;
  }
  if (left==true&&shift==false)
  {
    image(yaomeng2, xPlayer, yPlayer, wPlayer, hPlayer);
  } else if (right==true&&shift==false)
  {
    image(yaomeng3, xPlayer, yPlayer, wPlayer, hPlayer);
  } else if (right==false&&left==false&&shift==false)
  {
    image(yaomeng1, xPlayer, yPlayer, wPlayer, hPlayer);
  } else if (right==false&&left==false&&shift==true)
  {
    image(youyouzi1, xPlayer, yPlayer, wPlayer, hPlayer);
    image(deadButterfly, xPlayer-40, yPlayer, 20, 20);
    image(deadButterfly, xPlayer+40, yPlayer, 20, 20);
  } else if (right==true&&shift==true)
  {
    image(youyouzi3, xPlayer, yPlayer, wPlayer, hPlayer);
    image(deadButterfly, xPlayer-40, yPlayer, 20, 20);
    image(deadButterfly, xPlayer+40, yPlayer, 20, 20);
  } else if (left==true&&shift==true)
  {
    image(youyouzi2, xPlayer, yPlayer, wPlayer, hPlayer);
    image(deadButterfly, xPlayer-40, yPlayer, 20, 20);
    image(deadButterfly, xPlayer+40, yPlayer, 20, 20);
  }  
  if (shift)
  {
    vPlayer=2;
  } else
  {   
    vPlayer=8;
  }
}

void moveKey()
{

  if (key=='x' || key=='X')
  {
    if (bombNum>0)
    {
      xPressed=true;
      bombNum=bombNum-1;
    }
  }
  if (keyCode==SHIFT)
  {
    shift=true;
  }
  if (keyCode==UP)
  {
    up=true;
  }
  if (keyCode==DOWN)
  {
    down=true;
  }
  if (keyCode==LEFT)
  {
    left=true;
  }
  if (keyCode==RIGHT)
  {
    right=true;
  }
}


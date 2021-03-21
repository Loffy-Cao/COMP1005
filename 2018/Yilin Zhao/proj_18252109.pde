PImage net;
PImage frog;
PImage[] f=new PImage[2];
PImage garden;
PImage a;
PImage b;
int count;
int choice;
int w;
PImage buttons;
PImage[] d=new PImage[10];
int[]e=new int[10];
int Score;
int Pests;
int Bees;
boolean gameEnd;
float[] x=new float[5];
float[] y=new float[5];
float[] s=new float[5];

float[] p=new float[5];
float[] q=new float[5];
float[] r=new float[5];
int stageNum;
void setup()
{ 
  stageNum=0;
  size(1000, 700);
  for (int i=0; i<2; i=i+1)
  {
    f[i]=loadImage(i+".png");
  }

  garden=loadImage("garden.jpg");
  net=loadImage("net.png");
  frog=loadImage("frog.png");
  buttons=loadImage("buttons.png");
  choice=0;
  count=0;
  w=200;
  Score=0;
  Pests=0;
  Bees=0;
  image(garden, 0, 0, 1000, 700);
  gameEnd=false;
  for (int i=0; i<10; i=i+1)
  {
    d[i]=loadImage(i+".png");
    e[i]=i*100;
  }

  for (int i=0; i<5; i=i+1)
  {
    x[i] = random(-300, 0);   
    y[i] = random(0, 300);
    s[i] = random(0, 10);
  }
  a=loadImage("0.png");
  for (int i=0; i<5; i=i+1)
  {
    p[i] = random(-300, 0);   
    q[i] = random(0, 300);
    r[i] = random(0, 10);
  }
  b=loadImage("1.png");
}

void draw()
{
  if (stageNum==0)
  {
    drawWelcome();
  } else if (stageNum==1)
  {
    drawLevel1();
  } else if (stageNum==2)
  {
    drawLevel2();
  }
  else if(stageNum==4)
  {
    drawGameover();
  }
}


void drawWelcome()
{
  image(frog, 450, 500, w, w);
  image(net, 450, 400, 150, 100);

  fill(#FFF534);
  textSize(50);
  text("Busy Little Frog", 320, 200);

  fill(0);
  textSize(20);
  text("Press any key to start the game.", 50, 20);
  text("If you catch a bee, score-1 and frog grows bigger", 50, 40);
  text("If you catch a pest, score+1 and frog grows smaller", 50, 60);
  text("If you catch 3 bees, you loose.", 50, 80);
  text("If you catch a bee in your first catch, you loose.", 50, 100);
  text("The frog size changes. If it is too small, you loose.", 50, 120);
  text("If you got 10 scores, you win.", 50, 140);

  if (count%60==0)
  {
    drawf(int(random(0, 900)), int(random(0, 400)), 100, 100, choice);
    choice=choice+1;
    if (choice>1)
    {
      choice=0;
    }
  }
  count=count+1;
}
void keyPressed()
{
  stageNum=1;
}






void drawf(int x, int y, int w, int h, int c)
{
  image(f[c], x-w/2, y-h/2, w, h);
}


void drawLevel1()
{ image(garden, 0, 0, 1000, 700);
  image(frog, 450, 500, w, w);
  image(net, 450, 400, 150, 100);

  fill(255, 0, 0);
  textSize(50);
  text("Level 1", 430, 50);



  if ( Bees==3 || w<=180)
  {   
    Bees=3;
    fill(0);
    textSize(20);
    text("Pests:"+Pests, 10, 30);
    text("Bees :"+Bees, 10, 50);
    text("Score:"+Score, 10, 70);

    gameEnd=true;
    stageNum=4;
    
  } else if (Score>=10)
  {
    Score=10;
    Pests=Pests;
    Bees=Bees;
    fill(0);
    textSize(20);
    text("Pests:"+Pests, 10, 30);
    text("Bees :"+Bees, 10, 50);
    text("Score:"+Score, 10, 70);

    fill(255, 0, 0);
    textSize(50);
    text(" You Win!", 430, 300);
    image(buttons, 450, 350, 50, 100);
    stageNum=2;
    Score=0;
    Pests=0;
    Bees=0;
    w=200;
  } else
  {
    fill(0);
    textSize(20);
    text("Pests:"+Pests, 10, 30);
    text("Bees :"+Bees, 10, 50);
    text("Score:"+Score, 10, 70);


    for (int i=0; i<10; i=i+1)
    {
      image(d[i], e[i], 100, 100, 100);
      e[i]=e[i]+5;
      if (e[i]>1000)
      {
        e[i]=0;
      }
    }
  }

  if ( gameEnd=true && 
    mouseX>450&&mouseX<500&&mouseY>400&&mouseY<450)
  {
    setup();
  }
 
}


void drawLevel2()
{
  image(garden, 0, 0, 1000, 700);
  image(frog, 450, 500, w, w);
  image(net, 450, 400, 150, 100);


  fill(255, 0, 0);
  textSize(50);
  text("Level 2", 430, 50);

  fill(0);
  textSize(20);
  text("Pests:"+Pests, 10, 30);
  text("Bees :"+Bees, 10, 50);
  text("Score:"+Score, 10, 70);

  for (int i=0; i<5; i=i+1)
  {
    image(a, x[i], y[i], 80, 80);


    if (x[i] > width)      
    {
      x[i] = -200;
    }

    image(b, p[i], q[i], 100, 100);


    if (p[i] > width)      
    {
      p[i] = -200;
    }
  }


  if ( Bees==3 || w<=180)
  {   
    Bees=3;
    fill(0);
    textSize(20);
    text("Pests:"+Pests, 10, 30);
    text("Bees :"+Bees, 10, 50);
    text("Score:"+Score, 10, 70);
    stageNum=4;
  } else if (Score>=10)
  {
    Score=10;
    Pests=Pests;
    Bees=Bees;
    fill(0);
    textSize(20);
    text("Pests:"+Pests, 10, 30);
    text("Bees :"+Bees, 10, 50);
    text("Score:"+Score, 10, 70);

    fill(255, 0, 0);
    textSize(50);
    text(" You Win!", 430, 300);
    image(buttons, 450, 350, 50, 100);
    gameEnd=true;
  } else
  {
    fill(0);
    textSize(20);
    text("Pests:"+Pests, 10, 30);
    text("Bees :"+Bees, 10, 50);
    text("Score:"+Score, 10, 70);

    for (int i=0; i<5; i=i+1)
    {
      x[i] = x[i] + s[i];  
      p[i] = p[i] + r[i];
    }
  }
}

void drawGameover()
{
  image(garden,0,0,1000,700);
  fill(255, 0, 0);
    textSize(50);
    text(" Game Over!", 430, 300);
    image(buttons, 450, 350, 50, 100);
    fill(0);
    textSize(20);
    text("Pests:"+Pests, 10, 30);
    text("Bees :"+Bees, 10, 50);
    text("Score:"+Score, 10, 70);
    
     
}
    


void mousePressed()
{
  if(stageNum==1)
  {
  image(net, mouseX, mouseY, 150, 100);
  for (int i=0; i<10; i=i+1)
  {

    if (i==0||i==2||i==3||i==5||i==7)
    {
      if (mouseX>e[i] && mouseX<e[i]+100 && mouseY>100 && mouseY<200)
      {
        e[i]=(i-10)*100;
        image(net, -300, mouseY, 150, 100);
        Bees=Bees+1;
        Score=Score-1;
        w=w-20;
        if (w<=160)
        {
          w=160;
        }
      }
    }

    if (i==1||i==4||i==6||i==8||i==9)
    {   
      if (mouseX>e[i] && mouseX<e[i]+100&& mouseY>100 && mouseY<200)
      {
        e[i]=(i-10)*100;
        image(net, -300, mouseY, 150, 100);
        Pests=Pests+1;
        Score=Score+1;
        w=w+20;
        if (w>=240)
        {
          w=240;
        }
      }
    }
  }
   
  
  }
  
  else if(stageNum==2)
  {
    image(net, mouseX, mouseY, 150, 100);
  for (int i=0; i<5; i=i+1)
  {
    if (mouseX>x[i] && mouseX<x[i]+80 && mouseY>y[i] && mouseY<y[i]+80)
    {
      x[i]=-300;
      y[i]=y[i];
      image(net, -300, mouseY, 150, 100);
      Bees=Bees+1;
      Score=Score-1;
      w=w-20;
      if (w<=160)
      {
        w=160;
      }
    }
    if (mouseX>p[i] && mouseX<p[i]+100&& mouseY>q[i] && mouseY<q[i]+100 )
    {
      p[i]=-300;
      q[i]=q[i];
      image(net, -300, mouseY, 150, 100);
      Pests=Pests+1;
      Score=Score+1;
      w=w+20;
      if (w>=240)
      {
        w=240;
      }
    }
    if(gameEnd=true&&Score>=10)
    {
      Score=10;
      Bees=Bees;
      Pests=Pests;
    }
 }
  if ( gameEnd=true && 
    mouseX>450&&mouseX<500&&mouseY>350&&mouseY<400)
  {
    stageNum=2;
    Bees=0;
    Score=0;
    Pests=0;
  }
  if ( gameEnd=true && 
    mouseX>450&&mouseX<500&&mouseY>400&&mouseY<450)
  {
    setup();
  }
}

else if(stageNum==4 &&  mouseX>450&&mouseX<500&&mouseY>400&&mouseY<450)
  {
    setup();
  }
  

}

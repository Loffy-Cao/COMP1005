PImage img, buttonn, buttonr, buttonn2, buttonr2, buttonl, buttonl2;
PImage background1,background2,background3,background4,buttonp,buttonp2;
PImage background11, background12,background21,background22,background31,background32,background41,background42;
PImage g1,g2,g3,g4,logo, boss;
PImage gameover,gameover2;
PImage girl[] = new PImage [4];
int x[] = new int [4];
int y[] = new int [4];
int w[] = new int [4];
int h[] = new int [4];
int stagenum;
int total = 30;
FloatList bulletx=new FloatList();
FloatList bullety=new FloatList();
FloatList bullet1x=new FloatList();
FloatList bullet1y=new FloatList();
FloatList bullet2x=new FloatList();
FloatList bullet2y=new FloatList();

int bullet_number, bullet1_number, bullet2_number;
PImage o1[] = new PImage[total];
float [] ox = new float [total];
float [] oy = new float [total];
float [] os = new float [total];
float [] bx = new float [20];
float [] by = new float [20];


int  count, score, h1,h2,h3,h4, n, bossh,gx;
float bossy, sx;
PImage bullet1, bullet2, bullet3;
int countspre, counts;
void setup()
{
   gameover = loadImage("gameover.jpg");
  gameover2 = loadImage("end.jpg");
  img = loadImage("start.jpg");
  buttonn = loadImage("next page.png");
  buttonr = loadImage("return.png");
  buttonn2 = loadImage("next page2.png");
  buttonr2 = loadImage("return2.png");
  buttonl = loadImage("last page.png");
  buttonl2 = loadImage("last page2.png");
  buttonp = loadImage("play.png");
  buttonp2 = loadImage("play2.png");
  background1 = loadImage("background1.jpg");
  background2 = loadImage("background2.jpg");
  background3 = loadImage("background3.jpg");
  background4 = loadImage("background4.jpg");
 g1 = loadImage("g1.png");
 g2 = loadImage("g2.png");
 g3 = loadImage("g3.png");
 g4 = loadImage("g4.png");
  background11 = loadImage("background11.jpg");
  background22 = loadImage("background22.jpg");
  background32 = loadImage("background32.jpg");
  background42 = loadImage("background42.jpg");
  background12 = loadImage("background12.jpg");
  background21 = loadImage("background21.jpg");
  background31 = loadImage("background31.jpg");
  background41 = loadImage("background41.jpg");
 logo = loadImage("o1.png");
 bullet1 = loadImage("bullet1.png");
  bullet2 = loadImage("bullet2.png");
  bullet3 = loadImage("bullet3.png");
  boss = loadImage("boss.png");
  for (int i = 0; i< o1.length; i = i + 1)
  {
    o1[i] = loadImage("o1.png");
    ox[i] = random(175, 565);
    oy[i] = random(-2000, -60);
    os[i] = random(-10, 10);
  }
  for (int i = 0; i < bx.length; i = i+1)
  {
    bx[i] = 400;
    by[i] = 180;
  }

  sx = 5;
  count = 0;
  h1 = 5;
  h2 = 4;
  h3 = 3;
  h4 = 6;
  n = total;
  bossy = -400;
  bossh = 200;
  bullet_number=0;
  bullet1_number = 0;
  bullet2_number = 0;
  frameRate(80);
 
  for (int i = 0; i < girl.length; i = i + 1)
  {
    girl[i] = loadImage("girl" + i + ".png");
    x[i] = 150 + (i%2) * (300 + 20);
    y[i] = (i/2)*(280+20) + 100;
  }
  size(800, 800);
  stagenum = 0;
}
void draw()
{
  if (stagenum == 0)
  {
    drawWelcome();
  }
  if (stagenum == 1)
  {
    drawChoice0();
  }
  if (stagenum == 2)
  {
    drawInstruction1();
  }
  if ( stagenum == 3)
  {
    drawInstruction2();
  }
  if( stagenum == 4)
  {
    drawChoice1();
  }
  if( stagenum == 5)
  {
    drawChoice2();
  }
  if( stagenum == 6)
  {
    drawChoice3();
  }
  if ( stagenum == 7)
  {
    drawChoice4();
  }
  if( stagenum == 8)
  {
    drawgame1();
  }
  if( stagenum == 9)
  {
    drawgame2();
  }
  if( stagenum == 10)
  {
    drawgame3();
  }
  if( stagenum == 11)
  {
    drawgame4();
  }
  
  
  if(stagenum == 13)
  {
    drawgameover1();
  }
  if(stagenum == 14)
  {
    drawgameover2();
  }
}
void ability(int a, int b )
{
  noStroke();
  fill(255,0,0);
  rect(150,200,60*a,30);
  rect(150,300,60*b,30);
  
  textSize(30);
  text("health",25,220);
  
  text(a,170+60*a,220);
  text("damage",25,320);
  
  text(b,170+60*b,320);
  
}
void drawWelcome()
{
  image(img, 0, 0, 800, 800);
  fill(255, 0, 0);
  textSize(80);
  text("lotus land Story", 120, 100);
  textSize(80);
  text("Start game", 200, 300);
  textSize(80);
  text("instruction", 200, 500);
  textSize(80);
  text("EXIT", 320, 700);
}
void drawInstruction1()
{
  image(img, 0, 0, 800, 800);
  image(buttonn, 70, 650, 80, 80);
  image(buttonr, 590, 650, 80, 80);
  fill(255, 0, 0);
  textSize(60);
  text("background", 200, 80);
  textSize(40);
  text("To protect the temple, four different ", 50, 200);
  textSize(40);
  text("girls need to beat enemy by their ", 50, 300);
  textSize(40);
  text("different power. They can't touch the ", 50, 400);
  textSize(40);
  text("bullet shoot from monsters otherwise ", 50, 500);
  text(" they will die.", 50, 600);
  if (mouseX > 70 && mouseX < 150 && mouseY > 650 && mouseY < 730)
  {
    image(buttonn2, 70, 650, 80, 80);
  }
  if (mouseX > 590 && mouseX < 670 && mouseY > 650 && mouseY < 730)
  {
    image(buttonr2, 590, 650, 80, 80);
  }
}
void drawInstruction2()
{
  image(img, 0, 0, 800, 800);
  image(buttonl, 70, 650, 80, 80);
  image(buttonr, 590, 650, 80, 80);
  fill(255, 0, 0);
  textSize(80);
  text("instruction", 210, 80);
  textSize(40);
  text("The girl will move with your mouse.", 50, 200);
  textSize(40);
  text("Click the mouse to shoot the bullet.", 50, 300);
  textSize(40);
  
  text("Avoid the bullet and beat the enemy!", 50, 400);
  if (mouseX > 70 && mouseX < 150 && mouseY > 650 && mouseY < 730)
  {
    image(buttonl2, 70, 650, 80, 80);
  }
  if (mouseX > 590 && mouseX < 670 && mouseY > 650 && mouseY < 730)
  {
    image(buttonr2, 590, 650, 80, 80);
  }
}
void drawChoice0()
{
  image(img, 0, 0, 800, 800);
  image(buttonr, 380, 680, 60, 60);
  fill(255, 0, 0);
  textSize(60);
  text("Character Choice", 150, 80);
  for (int i = 0; i < girl.length; i = i + 1)
  {

    image(girl[i], x[i], y[i], w[i], h[i]);
    if (mouseX > x[i] && mouseX < x[i] + 170 && mouseY > y[i]&& mouseY < y[i] + 280)
    {
      h[i] = 320;
      w[i] = 220;
    } else
    {
      h[i] = 280;
      w[i] = 200;
    }
  }
  if (mouseX > 380 && mouseX< 440 && mouseY > 680 && mouseY < 740)
  {
    image(buttonr2, 380, 680, 60, 60);
  }
}

void drawChoice1()
{
  image(background1,0,0,800,800);
  image(buttonp,70,700,180,80);
  image(buttonr,350,700,80,80);
  
  fill(255,0,0);
  textSize(60);
  text("Hakurei Reimu",50,100);
  ability(5,4);
  textSize(30);
  fill(255,0,0);
 
  if(mouseX > 70 && mouseX < 250 && mouseY > 700 && mouseY < 780)
  {
    image(buttonp2,70,700,180,80);
  }
  if(mouseX > 350 && mouseX < 430 && mouseY > 700 && mouseY < 780)
  {
    image(buttonr2,350,700,80,80);
  }
}
void drawChoice2()
{
  image(background2,0,0,800,800);
  image(buttonp,70,700,180,80);
  image(buttonr,350,700,80,80);
  
  fill(255,0,0);
  textSize(60);
  text("Kirisame Marisa",50,100);
  ability(4,4);
  textSize(30);
  fill(255,0,0);
  
  if(mouseX > 70 && mouseX < 250 && mouseY > 700 && mouseY < 780)
  {
    image(buttonp2,70,700,180,80);
  }
  if(mouseX > 350 && mouseX < 430 && mouseY > 700 && mouseY < 780)
  {
    image(buttonr2,350,700,80,80);
  }
}
void drawChoice3()
{
 image(background3,0,0,800,800);
 image(buttonp,70,700,180,80);
  image(buttonr,350,700,80,80);
  
  fill(255,0,0);
  textSize(60);
  text("Saigyouji Yuyuko",50,100);
  ability(3,4);
  textSize(30);
  fill(255,0,0);
 
 if(mouseX > 70 && mouseX < 250 && mouseY > 700 && mouseY < 780)
  {
    image(buttonp2,70,700,180,80);
  }
  if(mouseX > 350 && mouseX < 430 && mouseY > 700 && mouseY < 780)
  {
    image(buttonr2,350,700,80,80);
  }
}
void drawChoice4()
{
  image(background4,0,0,800,800);
  image(buttonp,70,700,180,80);
  image(buttonr,350,700,80,80);
  
  fill(255,0,0);
  textSize(100);
  text("Cirno",50,100);
  ability(6,3);
  textSize(30);
  fill(255,0,0);
 
  if(mouseX > 70 && mouseX < 250 && mouseY > 700 && mouseY < 780)
  {
    image(buttonp2,70,700,180,80);
  }
  if(mouseX > 350 && mouseX < 430 && mouseY > 700 && mouseY < 780)
  {
    image(buttonr2,350,700,80,80);
  }
}
void drawgame1()
{
  count = count+1;
  countspre=counts;
  counts=count/10;
  image(background12, 0, 0, 800, 800);
  image(background11, 175, 0, 450, 800);
  if (mouseX > 595)
  {
    gx = 595;
  } else if (mouseX < 205)
  {
    gx = 205;
  } else
  {
    gx = mouseX;
  }

  image(g1, gx-30, mouseY-30, 60, 60);
  image(logo, 630, 50, 80, 80);
  println(mouseX, mouseY);
  fill(255, 0, 0);
  textSize(30);
  text("time:"+count/60 + "s", 30, 60);

  text("score:"+score, 30, 100);
  text("health:", 30, 630);

  noStroke();
  rect(30, 670, 20*h1, 20);
  text(h1, 30, 720);
  text("X"+n, 700, 110);

  for (int i = 0; i < o1.length; i = i+1)
  {
    image(o1[i], ox[i], oy[i], 60, 60);
    ox[i] = ox[i]+os[i] ;
    oy[i] = oy[i] + 2;

    if (ox[i] > 565 || ox[i] < 175)
    {
      os[i] = - os[i];
    }
    if (oy[i] > 800 && oy[i] < 1000)
    {
      oy[i] = random(-2000, -60);
    }
    if (oy[i] > 0)
    {
     
        if (robot_judge_timechange()==1)
        {
          robot_create_bullet(ox[i], oy[i]);
        }
         if (bullet1_number>0)
      {
        for (int j = 0; j < bullet1x.size (); j++)
        {
          image(bullet2, bullet1x.get(j)+30, bullet1y.get(j)+60, 10, 20);
          bullet1y.set(j, bullet1y.get(j)+1);
          if (bullet1y.get(j) > 800 )
          {
            bullet1x.remove(j);
            bullet1y.remove(j);   
            bullet1_number--;
          }
          if (bullet1y.get(j)+80 > mouseY -25 && bullet1y.get(j)+60 < mouseY + 25 && bullet1x.get(j)+30 > mouseX -25 && bullet1x.get(j)+40 < mouseX + 25)
          {
            bullet1x.remove(j);
            bullet1y.remove(j);   
            bullet1_number--;
            h1 = h1 -1;
          }
        }
      }
    }
  }




  if (bullet_number>0)
  {
    for (int i = 0; i < bulletx.size (); i++)
    {
      image(bullet1, bulletx.get(i), bullety.get(i), 10, 30);
      bullety.set(i, bullety.get(i)-10);
    }
    for (int i = 0; i< o1.length; i = i + 1)
    {
      for (int j = 0; j < bulletx.size (); j = j+1)
      {
        if (oy[i] > 0)
        {
          if (bullety.get(j)  < oy[i] +60 && bullety.get(j)+ 30 > oy[i] && bulletx.get(j) > ox[i] && bulletx.get(j) < ox[i] + 50)
          {
            oy[i] = 1000;

            n = n -1;
            
            score = score + 100;
            bulletx.remove(j);
            bullety.remove(j);   
            bullet_number--;
          }
        }
      }
    }
  }
  if (n == 0)
  {
    image(boss, 175, bossy, 450, 300);
    bossy = bossy + 1;
    if (bossy<50 && bossy > -400)
    {
      textSize(100);
      text("WARNING!", 170, 400);
    }
    if (bossy >= 50)
    {
      fill(255, 0, 0);
      textSize(20);
      text("HP", 175, 40);
      rect(210, 20, bossh*2, 20);
      bossy = 50;
      
        if (robot_judge_timechange()==1)
        {
          createbullet(400, 180);
          
        }
        if (bullet2_number>0)
      {
        for (int j = 0; j < bullet2x.size (); j= j+1)
        {
          image(bullet3, bullet2x.get(j), bullet2y.get(j), 10, 10);
          bullet2y.set(j, bullet2y.get(j)+3);
          bullet2x.set(j, bullet2x.get(j)+sx);

          if (bullet2y.get(j) > 800 )
          {
            bullet2x.remove(j);
            bullet2y.remove(j);   
            bullet2_number--;
          }
          if (bullet2x.get(j)>625 || bullet2x.get(j) < 175)
          {
            sx = -sx;
          }
          if (bullet2x.get(j)>mouseX-25 && bullet2x.get(j) < mouseX + 25 && bullet2y.get(j) > mouseY -25 && bullet2y.get(j) < mouseY+25)
          {
            bullet2x.remove(j);
            bullet2y.remove(j);   
            bullet2_number--;
            h1 = h1-1;
          }
        }
      }







          for (int j = 0; j < bulletx.size (); j = j+1)
          {
            if (bullety.get(j)  < 280 && bullety.get(j)+ 30 > 70 && bulletx.get(j) > 270 && bulletx.get(j)+10 < 520)
            {

              bossh = bossh -4;
              bulletx.remove(j);
              bullety.remove(j);   
              bullet_number--;
              if (bossh < 0)
              {
                bossh = 0;
              }
            }
          }
        }
      }
    

if(h1 <= 0)
{
  stagenum = 13;
}
      
if(bossh <= 0)
{
  stagenum = 14;
}



}
 void drawgame2()
{   
  count = count+1;
  countspre=counts;
  counts=count/10;
  image(background22, 0, 0, 800, 800);
  image(background21, 175, 0, 450, 800);
  if (mouseX > 595)
  {
    gx = 595;
  } else if (mouseX < 205)
  {
    gx = 205;
  } else
  {
    gx = mouseX;
  }

  image(g2, gx-30, mouseY-30, 60, 60);
  image(logo, 630, 50, 80, 80);
  println(mouseX, mouseY);
  fill(255, 0, 0);
  textSize(30);
  text("time:"+count/60 + "s", 30, 60);

  text("score:"+score, 30, 100);
  text("health:", 30, 630);

  noStroke();
  rect(30, 670, 20*h2, 20);
  text(h2, 30, 720);
  text("X"+n, 700, 110);

  for (int i = 0; i < o1.length; i = i+1)
  {
    image(o1[i], ox[i], oy[i], 60, 60);
    ox[i] = ox[i]+os[i] ;
    oy[i] = oy[i] + 2;

    if (ox[i] > 565 || ox[i] < 175)
    {
      os[i] = - os[i];
    }
    if (oy[i] > 800 && oy[i] < 1000)
    {
      oy[i] = random(-2000, -60);
    }
    if (oy[i] > 0)
    {
     
        if (robot_judge_timechange()==1)
        {
          robot_create_bullet(ox[i], oy[i]);
        }
         if (bullet1_number>0)
      {
        for (int j = 0; j < bullet1x.size (); j++)
        {
          image(bullet2, bullet1x.get(j)+30, bullet1y.get(j)+60, 10, 20);
          bullet1y.set(j, bullet1y.get(j)+1);
          if (bullet1y.get(j) > 800 )
          {
            bullet1x.remove(j);
            bullet1y.remove(j);   
            bullet1_number--;
          }
          if (bullet1y.get(j)+80 > mouseY -25 && bullet1y.get(j)+60 < mouseY + 25 && bullet1x.get(j)+30 > mouseX -25 && bullet1x.get(j)+40 < mouseX + 25)
          {
            bullet1x.remove(j);
            bullet1y.remove(j);   
            bullet1_number--;
            h2 = h2 -1;
          }
        }
      }
    }
  }




  if (bullet_number>0)
  {
    for (int i = 0; i < bulletx.size (); i++)
    {
      image(bullet1, bulletx.get(i), bullety.get(i), 10, 30);
      bullety.set(i, bullety.get(i)-10);
    }
    for (int i = 0; i< o1.length; i = i + 1)
    {
      for (int j = 0; j < bulletx.size (); j = j+1)
      {
        if (oy[i] > 0)
        {
          if (bullety.get(j)  < oy[i] +60 && bullety.get(j)+ 30 > oy[i] && bulletx.get(j) > ox[i] && bulletx.get(j) < ox[i] + 50)
          {
            oy[i] = 1000;

            n = n -1;
            
            score = score + 100;
            bulletx.remove(j);
            bullety.remove(j);   
            bullet_number--;
          }
        }
      }
    }
  }
  if (n == 0)
  {
    image(boss, 175, bossy, 450, 300);
    bossy = bossy + 1;
    if (bossy<50 && bossy > -400)
    {
      textSize(100);
      text("WARNING!", 170, 400);
    }
    if (bossy >= 50)
    {
      fill(255, 0, 0);
      textSize(20);
      text("HP", 175, 40);
      rect(210, 20, bossh*2, 20);
      bossy = 50;
      
        if (robot_judge_timechange()==1)
        {
          createbullet(400, 180);
          
        }
        if (bullet2_number>0)
      {
        for (int j = 0; j < bullet2x.size (); j= j+1)
        {
          image(bullet3, bullet2x.get(j), bullet2y.get(j), 10, 10);
          bullet2y.set(j, bullet2y.get(j)+3);
          bullet2x.set(j, bullet2x.get(j)+sx);

          if (bullet2y.get(j) > 800 )
          {
            bullet2x.remove(j);
            bullet2y.remove(j);   
            bullet2_number--;
          }
          if (bullet2x.get(j)>625 || bullet2x.get(j) < 175)
          {
            sx = -sx;
          }
          if (bullet2x.get(j)>mouseX-25 && bullet2x.get(j) < mouseX + 25 && bullet2y.get(j) > mouseY -25 && bullet2y.get(j) < mouseY+25)
          {
            bullet2x.remove(j);
            bullet2y.remove(j);   
            bullet2_number--;
            h2 = h2-1;
          }
        }
      
    }







          for (int j = 0; j < bulletx.size (); j = j+1)
          {
            if (bullety.get(j)  < 280 && bullety.get(j)+ 30 > 70 && bulletx.get(j) > 270 && bulletx.get(j)+10 < 520)
            {

              bossh = bossh -4;
              bulletx.remove(j);
              bullety.remove(j);   
              bullet_number--;
              if (bossh < 0)
              {
                bossh = 0;
              }
            }
          }
        }
      }
   if(h2 <= 0)
{
  stagenum = 13;
}
      
if(bossh <= 0)
{
  stagenum = 14;
}
  }
void drawgame3()
{   
  count = count+1;
  countspre=counts;
  counts=count/10;
  image(background32, 0, 0, 800, 800);
  image(background31, 175, 0, 450, 800);
  if (mouseX > 595)
  {
    gx = 595;
  } else if (mouseX < 205)
  {
    gx = 205;
  } else
  {
    gx = mouseX;
  }

  image(g3, gx-30, mouseY-30, 60, 60);
  image(logo, 630, 50, 80, 80);
  println(mouseX, mouseY);
  fill(255, 0, 0);
  textSize(30);
  text("time:"+count/60 + "s", 30, 60);

  text("score:"+score, 30, 100);
  text("health:", 30, 630);

  noStroke();
  rect(30, 670, 20*h3, 20);
  text(h3, 30, 720);
  text("X"+n, 700, 110);

  for (int i = 0; i < o1.length; i = i+1)
  {
    image(o1[i], ox[i], oy[i], 60, 60);
    ox[i] = ox[i]+os[i] ;
    oy[i] = oy[i] + 2;

    if (ox[i] > 565 || ox[i] < 175)
    {
      os[i] = - os[i];
    }
    if (oy[i] > 800 && oy[i] < 1000)
    {
      oy[i] = random(-2000, -60);
    }
    if (oy[i] > 0)
    {
     
        if (robot_judge_timechange()==1)
        {
          robot_create_bullet(ox[i], oy[i]);
        }
         if (bullet1_number>0)
      {
        for (int j = 0; j < bullet1x.size (); j++)
        {
          image(bullet2, bullet1x.get(j)+30, bullet1y.get(j)+60, 10, 20);
          bullet1y.set(j, bullet1y.get(j)+1);
          if (bullet1y.get(j) > 800 )
          {
            bullet1x.remove(j);
            bullet1y.remove(j);   
            bullet1_number--;
          }
          if (bullet1y.get(j)+80 > mouseY -25 && bullet1y.get(j)+60 < mouseY + 25 && bullet1x.get(j)+30 > mouseX -25 && bullet1x.get(j)+40 < mouseX + 25)
          {
            bullet1x.remove(j);
            bullet1y.remove(j);   
            bullet1_number--;
            h3 = h3 -1;
          }
        }
      }
    }
  }




  if (bullet_number>0)
  {
    for (int i = 0; i < bulletx.size (); i++)
    {
      image(bullet1, bulletx.get(i), bullety.get(i), 10, 30);
      bullety.set(i, bullety.get(i)-10);
    }
    for (int i = 0; i< o1.length; i = i + 1)
    {
      for (int j = 0; j < bulletx.size (); j = j+1)
      {
        if (oy[i] > 0)
        {
          if (bullety.get(j)  < oy[i] +60 && bullety.get(j)+ 30 > oy[i] && bulletx.get(j) > ox[i] && bulletx.get(j) < ox[i] + 50)
          {
            oy[i] = 1000;

            n = n -1;
            
            score = score + 100;
            bulletx.remove(j);
            bullety.remove(j);   
            bullet_number--;
          }
        }
      }
    }
  }
  if (n == 0)
  {
    image(boss, 175, bossy, 450, 300);
    bossy = bossy + 1;
    if (bossy<50 && bossy > -400)
    {
      textSize(100);
      text("WARNING!", 170, 400);
    }
    if (bossy >= 50)
    {
      fill(255, 0, 0);
      textSize(20);
      text("HP", 175, 40);
      rect(210, 20, bossh*2, 20);
      bossy = 50;
      
        if (robot_judge_timechange()==1)
        {
          createbullet(400, 180);
          
        }
        if (bullet2_number>0)
      {
        for (int j = 0; j < bullet2x.size (); j= j+1)
        {
          image(bullet3, bullet2x.get(j), bullet2y.get(j), 10, 10);
          bullet2y.set(j, bullet2y.get(j)+3);
          bullet2x.set(j, bullet2x.get(j)+sx);

          if (bullet2y.get(j) > 800 )
          {
            bullet2x.remove(j);
            bullet2y.remove(j);   
            bullet2_number--;
          }
          if (bullet2x.get(j)>625 || bullet2x.get(j) < 175)
          {
            sx = -sx;
          }
          if (bullet2x.get(j)>mouseX-25 && bullet2x.get(j) < mouseX + 25 && bullet2y.get(j) > mouseY -25 && bullet2y.get(j) < mouseY+25)
          {
            bullet2x.remove(j);
            bullet2y.remove(j);   
            bullet2_number--;
            h3 = h3-1;
          }
        }
      
    }







          for (int j = 0; j < bulletx.size (); j = j+1)
          {
            if (bullety.get(j)  < 280 && bullety.get(j)+ 30 > 70 && bulletx.get(j) > 270 && bulletx.get(j)+10 < 520)
            {

              bossh = bossh -5;
              bulletx.remove(j);
              bullety.remove(j);   
              bullet_number--;
              if (bossh < 0)
              {
                bossh = 0;
              }
            }
          }
        }
      }
   if(h3 <= 0)
{
  stagenum = 13;
}
      
if(bossh <= 0)
{
  stagenum = 14;
}
  }
void drawgame4()
{   
  count = count+1;
  countspre=counts;
  counts=count/10;
  image(background42, 0, 0, 800, 800);
  image(background41, 175, 0, 450, 800);
  if (mouseX > 595)
  {
    gx = 595;
  } else if (mouseX < 205)
  {
    gx = 205;
  } else
  {
    gx = mouseX;
  }

  image(g4, gx-30, mouseY-30, 60, 60);
  image(logo, 630, 50, 80, 80);
  println(mouseX, mouseY);
  fill(255, 0, 0);
  textSize(30);
  text("time:"+count/60 + "s", 30, 60);

  text("score:"+score, 30, 100);
  text("health:", 30, 630);

  noStroke();
  rect(30, 670, 20*h4, 20);
  text(h4, 30, 720);
  text("X"+n, 700, 110);

  for (int i = 0; i < o1.length; i = i+1)
  {
    image(o1[i], ox[i], oy[i], 60, 60);
    ox[i] = ox[i]+os[i] ;
    oy[i] = oy[i] + 2;

    if (ox[i] > 565 || ox[i] < 175)
    {
      os[i] = - os[i];
    }
    if (oy[i] > 800 && oy[i] < 1000)
    {
      oy[i] = random(-2000, -60);
    }
    if (oy[i] > 0)
    {
     
        if (robot_judge_timechange()==1)
        {
          robot_create_bullet(ox[i], oy[i]);
        }
         if (bullet1_number>0)
      {
        for (int j = 0; j < bullet1x.size (); j++)
        {
          image(bullet2, bullet1x.get(j)+30, bullet1y.get(j)+60, 10, 20);
          bullet1y.set(j, bullet1y.get(j)+1);
          if (bullet1y.get(j) > 800 )
          {
            bullet1x.remove(j);
            bullet1y.remove(j);   
            bullet1_number--;
          }
          if (bullet1y.get(j)+80 > mouseY -25 && bullet1y.get(j)+60 < mouseY + 25 && bullet1x.get(j)+30 > mouseX -25 && bullet1x.get(j)+40 < mouseX + 25)
          {
            bullet1x.remove(j);
            bullet1y.remove(j);   
            bullet1_number--;
            h4 = h4 -1;
          }
        }
      }
    }
  }




  if (bullet_number>0)
  {
    for (int i = 0; i < bulletx.size (); i++)
    {
      image(bullet1, bulletx.get(i), bullety.get(i), 10, 30);
      bullety.set(i, bullety.get(i)-10);
    }
    for (int i = 0; i< o1.length; i = i + 1)
    {
      for (int j = 0; j < bulletx.size (); j = j+1)
      {
        if (oy[i] > 0)
        {
          if (bullety.get(j)  < oy[i] +60 && bullety.get(j)+ 30 > oy[i] && bulletx.get(j) > ox[i] && bulletx.get(j) < ox[i] + 50)
          {
            oy[i] = 1000;

            n = n -1;
            
            score = score + 100;
            bulletx.remove(j);
            bullety.remove(j);   
            bullet_number--;
          }
        }
      }
    }
  }
  if (n == 0)
  {
    image(boss, 175, bossy, 450, 300);
    bossy = bossy + 1;
    if (bossy<50 && bossy > -400)
    {
      textSize(100);
      text("WARNING!", 170, 400);
    }
    if (bossy >= 50)
    {
      fill(255, 0, 0);
      textSize(20);
      text("HP", 175, 40);
      rect(210, 20, bossh*2, 20);
      bossy = 50;
      
        if (robot_judge_timechange()==1)
        {
          createbullet(400, 180);
          
        }
        if (bullet2_number>0)
      {
        for (int j = 0; j < bullet2x.size (); j= j+1)
        {
          image(bullet3, bullet2x.get(j), bullet2y.get(j), 10, 10);
          bullet2y.set(j, bullet2y.get(j)+3);
          bullet2x.set(j, bullet2x.get(j)+sx);

          if (bullet2y.get(j) > 800 )
          {
            bullet2x.remove(j);
            bullet2y.remove(j);   
            bullet2_number--;
          }
          if (bullet2x.get(j)>625 || bullet2x.get(j) < 175)
          {
            sx = -sx;
          }
          if (bullet2x.get(j)>mouseX-25 && bullet2x.get(j) < mouseX + 25 && bullet2y.get(j) > mouseY -25 && bullet2y.get(j) < mouseY+25)
          {
            bullet2x.remove(j);
            bullet2y.remove(j);   
            bullet2_number--;
            h4 = h4-1;
          }
        }
      
    }







          for (int j = 0; j < bulletx.size (); j = j+1)
          {
            if (bullety.get(j)  < 280 && bullety.get(j)+ 30 > 70 && bulletx.get(j) > 270 && bulletx.get(j)+10 < 520)
            {

              bossh = bossh -3;
              bulletx.remove(j);
              bullety.remove(j);   
              bullet_number--;
              if (bossh < 0)
              {
                bossh = 0;
              }
            }
          }
        }
      }
   if(h4 <= 0)
{
  stagenum = 13;
}
      
if(bossh <= 0)
{
  stagenum = 14;
}
  }
void drawgameover1()
{
  image(gameover, 0, 0,800,800);
 fill(255,255,255);
 textSize(60);
 text("try again!",500,410);
 text("Exit",570,600);
}
void drawgameover2()
{
  image(gameover2, 0, 0,800,800);
 fill(0,0,255);
 textSize(120);
 text("VICTORY!",100,250);
 textSize(80);
 text("play again!",200,400);
 text("EXIT",300,600);
  
}


void mousePressed() 
{
   if(stagenum<12 && stagenum > 7)
   {
     bullet_number++;
     bulletx.append(mouseX);
     bullety.append(mouseY);
   }
  if (stagenum == 0)
  {
    if (mouseX > 200 && mouseX < 600 && mouseY > 220 && mouseY <300)
    {
      stagenum = 1;
    }
    if (mouseX > 200 && mouseX < 600 && mouseY >420 && mouseY < 500)
    {
      stagenum = 2;
    }
    if (mouseX > 320 && mouseX < 490 && mouseY > 620 && mouseY < 700)
    {
      exit();
    }
  } else if (stagenum ==1)
  {
    if (mouseX > 380 && mouseX< 440 && mouseY > 680 && mouseY < 740)
    {
      stagenum = 0;
    }
    for(int i = 0; i < girl.length; i = i + 1)
    {
       if(mouseX > x[i] && mouseX < x[i] + 170 && mouseY > y[i]&& mouseY < y[i] + 280)
       {
          stagenum = i +4;
       }
    }
  } else if (stagenum ==2)
  {
    if (mouseX > 70 && mouseX < 150 && mouseY > 650 && mouseY < 730)
    {
      stagenum = 3;
    }
    if (mouseX > 590 && mouseX < 670 && mouseY > 650 && mouseY < 730)
    {
      stagenum =0;
    }
  } else if (stagenum ==3)
  {
    if (mouseX > 70 && mouseX < 150 && mouseY > 650 && mouseY < 730)
    {
      stagenum = 2;
    }
    if (mouseX > 590 && mouseX < 670 && mouseY > 650 && mouseY < 730)
    {
      stagenum = 0;
    }
  }
  for(int i= 4; i < 8; i = i +1)
  {
    if ( stagenum == i)
  {
    if(mouseX > 70 && mouseX < 250 && mouseY > 700 && mouseY < 780)
  {
    stagenum = i+4;
  }
  if(mouseX > 350 && mouseX < 430 && mouseY > 700 && mouseY < 780)
  {
    stagenum = 1;
  }
  }
  }
  if(stagenum == 13)
  {
    if(mouseX > 500 && mouseX <770 && mouseY > 380 && mouseY <410)
    {
      stagenum = 1;
      reset();
      
    }
    if(mouseX > 570 && mouseX < 670 && mouseY > 550 && mouseY < 600)
    {
      exit();
    }
  }
  if(stagenum == 14)
  {
    if(mouseX > 200 && mouseX < 600 && mouseY > 340 && mouseY < 410)
    {
      stagenum =1;
      reset();
    }
    if(mouseX > 300 && mouseX < 460 && mouseY > 540 && mouseY < 600)
    {
      exit();
    }
  }
}
int robot_judge_timechange()
  {
    if (countspre!=counts)
    {
      return 1;
    } else
    {
      return 0;
    }
  }


  void robot_create_bullet(float x, float y)
  {
    bullet1x.append(x);
    bullet1y.append(y);
    bullet1_number++;
  }

  void createbullet(float x, float y)
  {
    bullet2x.append(x);
    bullet2y.append(y);
    bullet2_number++;
  }
  void reset()
  {
     for (int i = 0; i< o1.length; i = i + 1)
  {
    o1[i] = loadImage("o1.png");
    ox[i] = random(175, 565);
    oy[i] = random(-2000, -60);
    os[i] = random(-10, 10);
  }
  count = 0;
  h1 = 5;
  h2 = 4;
  h3 = 3;
  h4 = 6;
  n = total;
  bossy = -400;
  bossh = 200;
  bullet_number=0;
  bullet1_number = 0;
  bullet2_number = 0;
  score = 0;
  bulletx.clear();
  bullety.clear();
  bullet1x.clear();
  bullet1y.clear();
  bullet2x.clear();
  bullet2y.clear();
  }
    

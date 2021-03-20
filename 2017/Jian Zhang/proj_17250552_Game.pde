//101=Level1,102=Level2,103=Level3
int stageNum,count,ys,xs,direction,x,y;
PImage WelcomeStage,GameStage,SuccessStage,GameOverStage;
PImage shoot1,shoot2,shoot3,shoot4;
PImage peaball,sunny,nut3;
PImage zombie,capzombie,iconzombie;
float[] peaballX = new float[1000];
float[] peaballY = new float[1000];
float[] nut3X = new float[1000];
float[] nut3Y = new float[1000];
float[] sunnyX = new float[1000];
float[] sunnyY = new float[1000];
int num;
int[] tf = new int[1000];
float[] zombieX = new float[1000];
float[] zombieY = new float[1000];
int numzb;
int[] tfzb = new int[1000];
int zbtime;
int time;
int[] life = new int[1000];
float[] speed = new float[1000];
int energy;

void setup()
{
  size(1500,700);
  WelcomeStage = loadImage("stage1.jpg");
  GameStage = loadImage("stage2.png");
  SuccessStage = loadImage("stage3.jpg");
  GameOverStage = loadImage("stage4.jpg");
  shoot1 = loadImage("pea.png");
  shoot2 = loadImage("Nut.png");
  shoot3 = loadImage("sunflower.png");
  peaball = loadImage("pea ball.png");
  nut3 = loadImage("nut3.png");
  sunny = loadImage("sunny.png");
  zombie = loadImage("Zombie.png");
  capzombie = loadImage("cap zombie.png");
  iconzombie = loadImage("icon zombie.png");
  stageNum = 0;
  count = 0;
  ys = 100;
  xs = 93;
  x = 182;
  y = 125;
  zbtime = 75;
  time = 0;
  for(int i = 1;i <=999;i++)
  {
    zombieX[i]=1800;
    zombieY[i]=125+100*int(random(0,5));
  }
}

void draw()
{
  zbtime = zbtime - 1;
  if(stageNum == 0)
  {
    drawWelcome();
  }
  
  else if(stageNum == 1)
  {
    drawGameStageLevel();
  }
  
  else if(stageNum == 101)
  {
    drawGameStageLevel1Choose();
  }
  
  else if(stageNum == 102)
  {
    drawGameStageLevel2Choose();
  }
  
  else if(stageNum == 103)
  {
    drawGameStageLevel3Choose();
  }
  
  else if(stageNum == 3)
  {
    drawGameLevel1Shoot1();
  }
  
  else if(stageNum == 4)
  {
    drawGameLevel1Shoot2();
  }
  
  else if(stageNum == 5)
  {
    drawGameLevel1Shoot3();
  }
 
  else if(stageNum == 7)
  {
    drawGameLevel2Shoot1();
  }
  
  else if(stageNum == 8)
  {
    drawGameLevel2Shoot2();
  }
  
  else if(stageNum == 9)
  {
    drawGameLevel2Shoot3();
  }
  
  else if(stageNum == 11)
  {
    drawGameLevel3Shoot1();
  }
  
  else if(stageNum == 12)
  {
    drawGameLevel3Shoot2();
  }
  
  else if(stageNum == 13)
  {
    drawGameLevel3Shoot3();
  }
  
  else if(stageNum == 70)
  {
    drawSuccessStage();
  }
  
  else if(stageNum == 71)
  {
    drawGameOverStage();
  }
}

void drawWelcome()
{
  image(WelcomeStage,0,0,1500,700);
  count = count + 1;
  if(count>180)
  {
    stageNum = 1;
  }
}

void drawGameStageLevel()
{
  image(GameStage,0,0,1700,700);
  textSize(70);
  text("Choose Level",500,200);
  textSize(50);
  text("Level1",400,350);
  text("Level2",700,350);
  text("Level3",1000,350);
}

void drawGameStageLevel1Choose()
{
  image(GameStage,0,0,1700,700);
  image(shoot1,400,350,100,100);
  image(shoot2,600,350,100,100);
  image(shoot3,800,350,90,100);
  text("Choose one of them",500,200);
  textSize(60);
}

void drawGameStageLevel2Choose()
{
  image(GameStage,0,0,1700,700);
  image(shoot1,400,350,100,100);
  image(shoot2,600,350,100,100);
  image(shoot3,800,350,90,100);
  text("Choose one of them",500,200);
  textSize(60);
}

void drawGameStageLevel3Choose()
{
  image(GameStage,0,0,1700,700);
  image(shoot1,400,350,100,100);
  image(shoot2,600,350,100,100);
  image(shoot3,800,350,90,100);
  text("Choose one of them",500,200);
  textSize(60);
}

void drawGameLevel1Shoot1()
{
  image(GameStage,0,0,1700,700);
  image(shoot1,x + 93,y,100,100);
  time = time + 1;
  energy = energy + 2;
  if(direction == UP && y > 130)
  {
    y = y - ys*1;
  }
  else if(direction == DOWN && y < 520)
  {
    y = y + ys*1;
  }
  else if(direction == LEFT && x > 200)
  {
    x = x - xs*1;
  }
  else if(direction == RIGHT && x < 1000)
  {
    x = x + xs*1;
  }
  direction = 0;
  for(int i = 1;i <= num;i++)
  {
    if(tf[i] == 1)
    {
      image(peaball,peaballX[i] + 140,peaballY[i] + 15,30,30);
      peaballX[i] = peaballX[i] + 8;
    }
  }
  zbtime = zbtime - 1;
  if(zbtime<=0)
  {
    numzb=numzb+1;
    zbtime = 75;
    tfzb[numzb] = 1;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i] == 1)
    {
      image(zombie,zombieX[i],zombieY[i],50,90);
      zombieX[i] = zombieX[i] - 2;
    }
  }
  for(int i = 1;i <= num;i++)
  {
    for(int g = 1;g <= numzb;g++)
    {
      if(tfzb[g]==1 && tf[i]==1 && peaballX[i]+130>=zombieX[g] && peaballX[i]+100<=zombieX[g]+50 && peaballY[i]==zombieY[g])
      {
        tf[i]=0;
        life[g]=life[g]-1;
        if(life[g]<=-2)
        {
          tfzb[g]=0;
        }
      }
    }
  }
  if(time>=1800)
  {
    stageNum=70;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && zombieX[i]<=175)
    {
      stageNum=71;
    }
  }
}

void drawGameLevel1Shoot2()
{
  image(GameStage,0,0,1700,700);
  image(shoot2,x + 93,y,100,100);
  time = time + 1;
  energy = energy + 3;
  if(direction == UP && y > 130)
  {
    y = y - ys*1;
  }
  else if(direction == DOWN && y < 520)
  {
    y = y + ys*1;
  }
  else if(direction == LEFT && x > 200)
  {
    x = x - xs*1;
  }
  else if(direction == RIGHT && x < 1000)
  {
    x = x + xs*1;
  }
  direction = 0;
  for(int i = 1;i <= num;i++)
  {
    if(tf[i] == 1)
    {
      image(nut3,nut3X[i] + 140,nut3Y[i] + 15,30,30);
      nut3X[i] = nut3X[i] + 8;
    }
  }
  zbtime = zbtime - 1;
  if(zbtime<=0)
  {
    numzb=numzb+1;
    zbtime = 75;
    tfzb[numzb] = 1;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i] == 1)
    {
      image(zombie,zombieX[i],zombieY[i],50,90);
      zombieX[i] = zombieX[i] - 2 + speed[i];
      if(x+150>=zombieX[i] && x+50<=zombieX[i]+50 && y==zombieY[i])
      {
        speed[i]=4;
      }
    }
  }
  for(int i = 1;i <= num;i++)
  {
    for(int g = 1;g <= numzb;g++)
    {
      if(tfzb[g]==1 && tf[i]==1 && nut3X[i]+130>=zombieX[g] && nut3X[i]+100<=zombieX[g]+50 && nut3Y[i]==zombieY[g])
      {
        tf[i]=0;
        life[g]=life[g]-1;
        if(life[g]<=-3)
        {
          tfzb[g]=0;
        }
      }
    }
  }
  if(time>=1800)
  {
    stageNum=70;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && zombieX[i]<=175)
    {
      stageNum=71;
    }
  }
}

void drawGameLevel1Shoot3()
{
  image(GameStage,0,0,1700,700);
  image(shoot3,x + 93,y,100,100);
  time = time + 1;
  energy = energy + 1;
  if(direction == UP && y > 130)
  {
    y = y - ys*1;
  }
  else if(direction == DOWN && y < 520)
  {
    y = y + ys*1;
  }
  else if(direction == LEFT && x > 200)
  {
    x = x - xs*1;
  }
  else if(direction == RIGHT && x < 1000)
  {
    x = x + xs*1;
  }
  direction = 0;
  for(int i = 1;i <= num;i++)
  {
    if(tf[i] == 1)
    {
      image(sunny,sunnyX[i] + 140,sunnyY[i] + 15,50,5);
      sunnyX[i] = sunnyX[i] + 8;
    }
  }
  zbtime = zbtime - 1;
  if(zbtime<=0)
  {
    numzb=numzb+1;
    zbtime = 75;
    tfzb[numzb] = 1;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i] == 1)
    {
      image(zombie,zombieX[i],zombieY[i],50,90);
      zombieX[i] = zombieX[i] - 2;
    }
  }
  for(int i = 1;i <= num;i++)
  {
    for(int g = 1;g <= numzb;g++)
    {
      if(tfzb[g]==1 && tf[i]==1 && sunnyX[i]+130>=zombieX[g] && sunnyX[i]+100<=zombieX[g]+50 && sunnyY[i]==zombieY[g])
      {
        tf[i]=0;
        life[g]=life[g]-1;
        if(life[g]<=-1)
        {
          tfzb[g]=0;
        }
      }
    }
  }
  if(time>=1800)
  {
    stageNum=70;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && zombieX[i]<=175)
    {
      stageNum=71;
    }
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && x+150>=zombieX[i] && x+50<=zombieX[i]+50 && y==zombieY[i])
    {
      stageNum=71;
    }
  }
}

void drawGameLevel2Shoot1()
{
  image(GameStage,0,0,1700,700);
  image(shoot1,x + 93,y,100,100);
  time = time + 1;
  energy = energy + 3;
  if(direction == UP && y > 130)
  {
    y = y - ys*1;
  }
  else if(direction == DOWN && y < 520)
  {
    y = y + ys*1;
  }
  else if(direction == LEFT && x > 200)
  {
    x = x - xs*1;
  }
  else if(direction == RIGHT && x < 1000)
  {
    x = x + xs*1;
  }
  direction = 0;
  for(int i = 1;i <= num;i++)
  {
    if(tf[i] == 1)
    {
      image(peaball,peaballX[i] + 140,peaballY[i] + 15,30,30);
      peaballX[i] = peaballX[i] + 8;
    }
  }
  zbtime = zbtime - 1;
  if(zbtime<=0)
  {
    numzb=numzb+1;
    zbtime = 75;
    tfzb[numzb] = 1;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i] == 1)
    {
      image(capzombie,zombieX[i],zombieY[i],70,110);
      zombieX[i] = zombieX[i] - 2;
    }
  }
  for(int i = 1;i <= num;i++)
  {
    for(int g = 1;g <= numzb;g++)
    {
      if(tfzb[g]==1 && tf[i]==1 && peaballX[i]+130>=zombieX[g] && peaballX[i]+100<=zombieX[g]+50 && peaballY[i]==zombieY[g])
      {
        tf[i]=0;
        life[g]=life[g]-1;
        if(life[g]<=-3)
        {
          tfzb[g]=0;
        }
      }
    }
  }
  if(time>=1800)
  {
    stageNum=70;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && zombieX[i]<=175)
    {
      stageNum=71;
    }
  }
}

void drawGameLevel2Shoot2()
{
  image(GameStage,0,0,1700,700);
  image(shoot2,x + 93,y,100,100);
  time = time + 1;
  energy = energy + 3;
  if(direction == UP && y > 130)
  {
    y = y - ys*1;
  }
  else if(direction == DOWN && y < 520)
  {
    y = y + ys*1;
  }
  else if(direction == LEFT && x > 200)
  {
    x = x - xs*1;
  }
  else if(direction == RIGHT && x < 1000)
  {
    x = x + xs*1;
  }
  direction = 0;
  for(int i = 1;i <= num;i++)
  {
    if(tf[i] == 1)
    {
      image(nut3,nut3X[i] + 140,nut3Y[i] + 15,30,30);
      nut3X[i] = nut3X[i] + 8;
    }
  }
  zbtime = zbtime - 1;
  if(zbtime<=0)
  {
    numzb=numzb+1;
    zbtime = 75;
    tfzb[numzb] = 1;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i] == 1)
    {
      image(capzombie,zombieX[i],zombieY[i],70,110);
      zombieX[i] = zombieX[i] - 3 + speed[i];
      if(x+150>=zombieX[i] && x+50<=zombieX[i]+50 && y==zombieY[i])
      {
        speed[i]=6;
      }
    }
  }
  for(int i = 1;i <= num;i++)
  {
    for(int g = 1;g <= numzb;g++)
    {
      if(tfzb[g]==1 && tf[i]==1 && nut3X[i]+130>=zombieX[g] && nut3X[i]+100<=zombieX[g]+50 && nut3Y[i]==zombieY[g])
      {
        tf[i]=0;
        life[g]=life[g]-1;
        if(life[g]<=-4)
        {
          tfzb[g]=0;
        }
      }
    }
  }
  if(time>=1800)
  {
    stageNum=70;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && zombieX[i]<=175)
    {
      stageNum=71;
    }
  }
}

void drawGameLevel2Shoot3()
{
  image(GameStage,0,0,1700,700);
  image(shoot3,x + 93,y,100,100);
  time = time + 1;
  energy = energy + 2;
  if(direction == UP && y > 130)
  {
    y = y - ys*1;
  }
  else if(direction == DOWN && y < 520)
  {
    y = y + ys*1;
  }
  else if(direction == LEFT && x > 200)
  {
    x = x - xs*1;
  }
  else if(direction == RIGHT && x < 1000)
  {
    x = x + xs*1;
  }
  direction = 0;
  for(int i = 1;i <= num;i++)
  {
    if(tf[i] == 1)
    {
      image(sunny,sunnyX[i] + 140,sunnyY[i] + 15,50,5);
      sunnyX[i] = sunnyX[i] + 8;
    }
  }
  zbtime = zbtime - 1;
  if(zbtime<=0)
  {
    numzb=numzb+1;
    zbtime = 75;
    tfzb[numzb] = 1;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i] == 1)
    {
      image(capzombie,zombieX[i],zombieY[i],70,110);
      zombieX[i] = zombieX[i] - 2;
    }
  }
  for(int i = 1;i <= num;i++)
  {
    for(int g = 1;g <= numzb;g++)
    {
      if(tfzb[g]==1 && tf[i]==1 && sunnyX[i]+130>=zombieX[g] && sunnyX[i]+100<=zombieX[g]+50 && sunnyY[i]==zombieY[g])
      {
        tf[i]=0;
        life[g]=life[g]-1;
        if(life[g]<=-2)
        {
          tfzb[g]=0;
        }
      }
    }
  }
  if(time>=1800)
  {
    stageNum=70;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && zombieX[i]<=175)
    {
      stageNum=71;
    }
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && x+150>=zombieX[i] && x+50<=zombieX[i]+50 && y==zombieY[i])
    {
      stageNum=71;
    }
  }
}

void drawGameLevel3Shoot1()
{
  image(GameStage,0,0,1700,700);
  image(shoot1,x + 93,y,100,100);
  time = time + 1;
  energy = energy + 4;
  if(direction == UP && y > 130)
  {
    y = y - ys*1;
  }
  else if(direction == DOWN && y < 520)
  {
    y = y + ys*1;
  }
  else if(direction == LEFT && x > 200)
  {
    x = x - xs*1;
  }
  else if(direction == RIGHT && x < 1000)
  {
    x = x + xs*1;
  }
  direction = 0;
  for(int i = 1;i <= num;i++)
  {
    if(tf[i] == 1)
    {
      image(peaball,peaballX[i] + 140,peaballY[i] + 15,30,30);
      peaballX[i] = peaballX[i] + 8;
    }
  }
  zbtime = zbtime - 1;
  if(zbtime<=0)
  {
    numzb=numzb+1;
    zbtime = 75;
    tfzb[numzb] = 1;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i] == 1)
    {
      image(iconzombie,zombieX[i],zombieY[i],70,110);
      zombieX[i] = zombieX[i] - 2;
    }
  }
  for(int i = 1;i <= num;i++)
  {
    for(int g = 1;g <= numzb;g++)
    {
      if(tfzb[g]==1 && tf[i]==1 && peaballX[i]+130>=zombieX[g] && peaballX[i]+100<=zombieX[g]+50 && peaballY[i]==zombieY[g])
      {
        tf[i]=0;
        life[g]=life[g]-1;
        if(life[g]<=-4)
        {
          tfzb[g]=0;
        }
      }
    }
  }
  if(time>=1800)
  {
    stageNum=70;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && zombieX[i]<=175)
    {
      stageNum=71;
    }
  }
}

void drawGameLevel3Shoot2()
{
  image(GameStage,0,0,1700,700);
  image(shoot2,x + 93,y,100,100);
  time = time + 1;
  energy = energy + 4;
  if(direction == UP && y > 130)
  {
    y = y - ys*1;
  }
  else if(direction == DOWN && y < 520)
  {
    y = y + ys*1;
  }
  else if(direction == LEFT && x > 200)
  {
    x = x - xs*1;
  }
  else if(direction == RIGHT && x < 1000)
  {
    x = x + xs*1;
  }
  direction = 0;
  for(int i = 1;i <= num;i++)
  {
    if(tf[i] == 1)
    {
      image(nut3,nut3X[i] + 140,nut3Y[i] + 15,30,30);
      nut3X[i] = nut3X[i] + 8;
    }
  }
  zbtime = zbtime - 1;
  if(zbtime<=0)
  {
    numzb=numzb+1;
    zbtime = 75;
    tfzb[numzb] = 1;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i] == 1)
    {
      image(iconzombie,zombieX[i],zombieY[i],70,110);
      zombieX[i] = zombieX[i] - 3 + speed[i];
      if(x+150>=zombieX[i] && x+50<=zombieX[i]+50 && y==zombieY[i])
      {
        speed[i]=6;
      }
    }
  }
  for(int i = 1;i <= num;i++)
  {
    for(int g = 1;g <= numzb;g++)
    {
      if(tfzb[g]==1 && tf[i]==1 && nut3X[i]+130>=zombieX[g] && nut3X[i]+100<=zombieX[g]+50 && nut3Y[i]==zombieY[g])
      {
        tf[i]=0;
        life[g]=life[g]-1;
        if(life[g]<=-5)
        {
          tfzb[g]=0;
        }
      }
    }
  }
  if(time>=1800)
  {
    stageNum=70;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && zombieX[i]<=175)
    {
      stageNum=71;
    }
  }
}

void drawGameLevel3Shoot3()
{
  image(GameStage,0,0,1700,700);
  image(shoot3,x + 93,y,100,100);
  time = time + 1;
  energy = energy + 3;
  if(direction == UP && y > 130)
  {
    y = y - ys*1;
  }
  else if(direction == DOWN && y < 520)
  {
    y = y + ys*1;
  }
  else if(direction == LEFT && x > 200)
  {
    x = x - xs*1;
  }
  else if(direction == RIGHT && x < 1000)
  {
    x = x + xs*1;
  }
  direction = 0;
  for(int i = 1;i <= num;i++)
  {
    if(tf[i] == 1)
    {
      image(sunny,sunnyX[i] + 140,sunnyY[i] + 15,50,5);
      sunnyX[i] = sunnyX[i] + 8;
    }
  }
  zbtime = zbtime - 1;
  if(zbtime<=0)
  {
    numzb=numzb+1;
    zbtime = 75;
    tfzb[numzb] = 1;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i] == 1)
    {
      image(iconzombie,zombieX[i],zombieY[i],70,110);
      zombieX[i] = zombieX[i] - 3;
    }
  }
  for(int i = 1;i <= num;i++)
  {
    for(int g = 1;g <= numzb;g++)
    {
      if(tfzb[g]==1 && tf[i]==1 && sunnyX[i]+130>=zombieX[g] && sunnyX[i]+100<=zombieX[g]+50 && sunnyY[i]==zombieY[g])
      {
        tf[i]=0;
        life[g]=life[g]-1;
        if(life[g]<=-3)
        {
          tfzb[g]=0;
        }
      }
    }
  }
  if(time>=1800)
  {
    stageNum=70;
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && zombieX[i]<=175)
    {
      stageNum=71;
    }
  }
  for(int i = 1;i <= numzb;i++)
  {
    if(tfzb[i]==1 && x+150>=zombieX[i] && x+50<=zombieX[i]+50 && y==zombieY[i])
    {
      stageNum=71;
    }
  }
}

void drawSuccessStage()
{
  image(SuccessStage,0,0,600,700);
  image(SuccessStage,600,0,600,700);
  image(SuccessStage,1200,0,600,700);
  text("Mission Success!!!",300,350);
  textSize(100);
}

void drawGameOverStage()
{
  image(GameOverStage,0,0,1700,700);
  fill(0);
  text("Game Over!!!",350,350);
  textSize(40);
  text("Press 'r' to regame",350,450);
  textSize(100);
}

void mousePressed()
{
  if (stageNum == 1 && mouseX >= 400 && mouseX <= 550
  && mouseY >= 300 && mouseY <=350)
  {
    stageNum = 101;
  }
  else if (stageNum == 1 && mouseX >= 700 && mouseX <= 850
  && mouseY >= 300 && mouseY <=350)
  {
    stageNum = 102;
  }
  else if (stageNum == 1 && mouseX >= 1000 && mouseX <= 1150
  && mouseY >= 300 && mouseY <=350)
  {
    stageNum = 103;
  }
  else if (stageNum == 101 && mouseX >= 400 && mouseX <= 500 
  && mouseY >= 350 && mouseY <= 450)
  {
    stageNum = 3;
  }
  else if(stageNum == 101 && mouseX >= 600 && mouseX <= 660
  && mouseY >= 370 && mouseY <= 440)
  {
    stageNum = 4;
  }
  else if(stageNum == 101 && mouseX >= 800 && mouseX <= 890
  && mouseY >= 350 && mouseY <= 450)
  {
    stageNum = 5;
  }
  
  else if (stageNum == 102 && mouseX >= 400 && mouseX <= 500 
  && mouseY >= 350 && mouseY <= 450)
  {
    stageNum = 7;
  }
  else if(stageNum == 102 && mouseX >= 600 && mouseX <= 660
  && mouseY >= 370 && mouseY <= 440)
  {
    stageNum = 8;
  }
  else if(stageNum == 102 && mouseX >= 800 && mouseX <= 890
  && mouseY >= 350 && mouseY <= 450)
  {
    stageNum = 9;
  }
 
  else if (stageNum == 103 && mouseX >= 400 && mouseX <= 500 
  && mouseY >= 350 && mouseY <= 450)
  {
    stageNum = 11;
  }
  else if(stageNum == 103 && mouseX >= 600 && mouseX <= 660
  && mouseY >= 370 && mouseY <= 440)
  {
    stageNum = 12;
  }
  else if(stageNum == 103 && mouseX >= 800 && mouseX <= 890
  && mouseY >= 350 && mouseY <= 450)
  {
    stageNum = 13;
  }
}

void keyPressed()
{
  if(keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT)
  {
    direction = keyCode;
  }
  if(key == 's' && energy>=30)
  {
    num=num+1;
    tf[num]=1;
    peaballX[num] = x;
    peaballY[num] = y;
    nut3X[num] = x;
    nut3Y[num] = y;
    sunnyX[num] = x;
    sunnyY[num] = y;
    energy = 0;
  }
  if(stageNum == 71 && key == 'r')
  {
    fill(255);
    for(int g = 1;g <= numzb;g++)
    {
      life[g]=-2;
    }
    setup();
  }
}

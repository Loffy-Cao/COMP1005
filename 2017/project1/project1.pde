import ddf.minim.*; //import the Minim library
Minim minim; //create Minim variable

//create AudioPlayer variable
AudioPlayer player;


int count, score, n;
PImage bg;  
PImage welcome; 
PImage gameOver;
PImage cart; 
PImage shopping; 
PImage junkfood;
PImage WIN;
PImage bigger;
PImage smaller;


PImage []food = new PImage[4];
float []foodX= new float[4];
float []foodY= new float[4];
float []foodZ= new float[4];

PImage bomb;
float bombX, bombY, bombZ;
PImage clock, juice;
float clockX, clockY, clockZ;
float juiceX, juiceY, juiceZ;
float biggerX,biggerY,biggerZ;
float smallerX,smallerY,smallerZ;

int TF;
int Time;
int cartW;



PImage restart;

int stageNum;

boolean gameover;
void setup()
{
  size(800, 800);

  minim= new Minim(this); //create a Minim object

  //load the song into the player
  player= minim.loadFile("song.mp3");



  bg=loadImage("background.jpg");
  cart=loadImage("catcher2.png");
  bomb=loadImage("bomb2.png");
  clock= loadImage("clock.png");
  juice=loadImage("juice.png");
  restart=loadImage("restart.png");
  welcome= loadImage("welcome3.png") ;
  gameOver=loadImage("game over.png"); 
  shopping=loadImage("shopping1.jpg"); 
  junkfood=loadImage("junkfood.jpg");
  WIN=loadImage("WIN.jpg");
  bigger=loadImage("bigger.png");
  smaller=loadImage("smaller.png");

 
  bombX=random(0, 760);    
  juiceX=random(0, 760);     
  clockX=random(0, 760);
  bombY=random(-20, -200); 
  juiceY=random(-50, -200);  
  clockY=random(-80, -100);
  bombZ=random(5, 10);     
  juiceZ=random(8, 10);      
  clockZ=random(5, 10);
  biggerX=random(0, 760);
  biggerY=random(-20,-200);
  biggerZ=random(5,8);
smallerX=random(0, 760);
smallerY=random(-20,-200);
smallerZ=random(5,8);

  
  
  n=700;

  count=0;
  score=0;
  cartW=100;
  for (int i= 0; i<4; i=i+1)
  {
    food[i]=loadImage("food"+i+".png");  
    foodX[i]=random(0, 760);
    foodY[i]=random(-20, -200);
    foodZ[i]=random(5, 10);

    gameover=false;
  }
  //stageNum
  // 0:welcome page
  // 1:level1 
  // 2:game over
  // 3:background instruction
  // 4:how to play
  stageNum=0;
}

void draw()
{
  image(bg, 0, 0, 800, 800);

  // function
  if (stageNum == 0)
  {
    drawWelcome();
  } 

  if (stageNum == 1)
  {
    drawGameLevel1();
    drawbigger();
    drawsmaller();

   

}

  if (stageNum == 2)
  { 
    drawgameover();
  }
  if (stageNum==3)
  {
    drawinstruction();
  }
  if (stageNum==4)
  {
    howtoplay();
  }
  if (stageNum==5)
  {
   drawwin(); 
    
  }


}


void drawWelcome()
{
  background(250, 151, 151);
  image(welcome, 0, 0, 800, 800);  

  textSize(50);
  text("press anykey to next", 165, 600);
  fill(0);
}
void drawGameLevel1()
{
  if (gameover == false)
  {

    count=count+1;
    textSize(30);
    text("Time:"+count/60+"s", 10, 30);
    text("score:"+score, 10, 60);


    fill(0, 255, 240);



    //bomb
    image(bomb, bombX, bombY, 80, 80);
    bombY=bombY+bombZ;
    if (bombY+80>=800) // bomb missing catch
    {
      bombX=random(0, 760);
      bombY=random(-20, -200);
      bombZ=random(5, 10);  
      bombY=bombY+bombZ;
    }
    if (bombX+80>=mouseX && mouseX+cartW>=bombX && bombY+80>=n)
    {
      score=score-5;

      bombX=random(0, 760);
      bombY=random(-20, -80);
      bombZ=20;  
      bombY=bombY+bombZ;
    }


    for (int i= 0; i<4; i=i+1)// food drop

    {
      image(food[i], foodX[i], foodY[i], 80, 80);


      foodY[i]=foodY[i]+foodZ[i];
    }


    image(cart, mouseX, n, cartW, 100);  

    for (int i= 0; i<4; i=i+1) // food catch 
    {
      if (foodX[i]+80>=mouseX && mouseX+cartW>=foodX[i] && foodY[i]+80>=n)
      {
        //print(foodY[i]);
        foodX[i]=random(0, 760);
        foodY[i]=-80;
        foodZ[i]=random(5, 10);  

        // foodY[i]=foodY[i]+foodZ[i];
        score=score+1+TF;
      }
    }
    for (int i= 0; i<4; i=i+1) // food missing catch
    {
      if (foodY[i]>800)
      {

        foodX[i]=random(0, 760);
        foodY[i]=random(-20, -200);
        foodZ[i]=random(5, 10);  
        foodY[i]=foodY[i]+foodZ[i];
      }
    }
    //write others in here
    //juice
    image(juice, juiceX, juiceY, 80, 80);
    juiceY=juiceY+juiceZ;
    if (juiceY>800) //juice missing
    {
      juiceX=random(0, 760);
      juiceY=random(-50, -200); 
      juiceZ=random(8, 10); 
      juiceY=juiceY+juiceZ;
    }
    if (juiceX+80>=mouseX && mouseX+cartW>=juiceX && juiceY+80>=n )  //juice catch
    {
      score= score+1;  //want to be a temporary pulse
      TF=1;
      juiceX=random(0, 760);
      juiceY=random(-50, -200); 
      juiceZ=random(10, 15); 
      juiceY=juiceY+juiceZ;
    }
    //clock
    if (TF==1)//to make score of food be mutiplied with 5seconds
    {
      Time=Time+1;
      if (Time==300)
      {
        TF=0;
        Time=0;
      }
    }

    if (count/60>=15&& score<=90 || count/60>=35 && score <=200 || count/60>=50 && score<=300) // after 15s the clock will drop from the bottom
    {
      image(clock, clockX, clockY, 50, 50);
      clockY=clockY+clockZ;
      if (clockY>800)    //clock missing
      {
        clockX=random(0, 760);
        clockY=random(-80, -100);
        clockZ=random(5, 10);
        clockY=clockY+clockZ;
      }
      if (clockX+50>=mouseX && mouseX+cartW>=clockX && clockY+50>=n && count/60>=15 )   //clock catch
      {
        count=count-300;
        clockX=random(0, 760);
        clockY=random(-500, -800);
        clockZ=15;
        clockY=clockY+clockZ;
      }
    }

    if (count/60>=20&& score >100 )
    {
      bombZ=random(8, 10);     
      juiceZ=random(10, 12);      
      clockZ=random(8, 10);
      for (int i= 0; i<4; i=i+1)
      {
        foodZ[i]=random(8, 12);
        foodY[i]=foodY[i]+foodZ[i];
      }  
      juiceY=juiceY+juiceZ;
      clockY=clockY+clockZ;
      bombY=bombY+bombZ;
      

      if (count/60>20 && count/60<23)
      {
        textSize(100);
        fill(255, 0, 0);
        text("Speed up!", 140, 240);
      }
    }
    if (count/60>=40 && score >200)
    {
      bombZ=random(10, 12);     
      juiceZ=random(12, 14);      
      clockZ=random(10, 12);
      for (int i= 0; i<4; i=i+1)
      {
        foodZ[i]=random(8, 12);
        foodY[i]=foodY[i]+foodZ[i];
      }  
      juiceY=juiceY+juiceZ;
      clockY=clockY+clockZ;
      bombY=bombY+bombZ;
      if (count/60>40 && count/60<43)
      {
        textSize(100);
        fill(255, 0, 0);
        text("Speed up!", 140, 240);
      }
    }
if(count/60>=60 && score >=400)
{
  stageNum=5;

}


  if (count/60>=20 && score <= 100 || count/60 >= 40 && score <= 200 || count/60 >= 60 && score <= 400)// passing situation
  {
    gameover=true;
    stageNum=2;
  }
} 

}

void drawinstruction()
{
  image(shopping, 0, 0, 800, 800);
  textSize(20);
  fill(0);
  text("Welcome To Play The Game", 10, 100);
  //need more detals
  text("You are going to shopping in supermarkets", 10, 150);
  text(",suddenly , plenty of foods drop from the top of the supermarket ", 10, 200);
  text("and you try your best to catch these flopping things ,however ,there still", 10, 250);
  text(" some bombs drop so you need to avoid bombs and catch goods for win ", 10, 300);

  textSize(40);
  fill(10, 241, 247);
  text("press anykey to next", 200, 720);
}

void howtoplay()
{
  image(junkfood, 0, 0, 800, 800);

  textSize(35);
  fill(255, 0, 0);
  text("use mouse to move the cart to catch foods", 50, 100);
  text("you need to get 100 score in 20 seconds", 50, 150);
  text("200 score in 40 seconds", 330, 200);
  text("400 score in 60 seconds", 330, 250);
  text("press anykey to play", 230, 700);




  image(juice, 40, 300, 80, 80);
  image(bomb, 43, 380, 80, 80);
  image(bigger,40,480,80,80);
  textSize(20);
  fill(0);
  text("multiple your score in 5 seconds", 90, 320);
  text("minues your 5 score", 90, 380);
  text("bigger your cart within 5 seconds",90,480);
  text("Attention:the speed of dropping things will accelerate in different level", 80, 600);
}






void drawgameover()
{ 
  background(255, 201, 134);

  image(gameOver, 150, 100, 500, 500);
  image(restart, 350, 560, 100, 100);

  textSize(35);
  text("Press Esc to end the game", 180, 550);
  fill(0, 255, 240);
}


void drawwin()
{
  image(WIN,0,0,800,800);
  textSize(35);
  text("Press Esc to end the game", 180, 550);
  fill(0, 255, 240);
}

void drawbigger()
{ 
  if(cartW>=100 && cartW<340)
{  image(bigger,biggerX,biggerY,80,80);
  biggerY=biggerY+biggerZ;
  if(biggerY>=800 )  //bigger missing
  {  
  
    biggerX=random(0, 760);
  biggerY=random(-20,-200);
  biggerZ=random(5,8);
 biggerY=biggerY+biggerZ;
  }
if( biggerX+80>=mouseX && mouseX+cartW>=biggerX && biggerY+80>=n)
{
   
  biggerX=random(0, 760);
  biggerY=random(-20,-200);
  biggerZ=random(5,8);
 biggerY=biggerY+biggerZ;
 
cartW=cartW+80; 

}
if(count/60>20 && score>100|| count/60<40 && score>200)
{
  biggerZ=random(8,10);
  biggerY=biggerY+biggerZ;
}

}
}


void drawsmaller()
{
 if(cartW>=180)
  {
    image(smaller,smallerX,smallerY,80,80);
   smallerY=smallerY+smallerZ;
  if(smallerY>=800 )  //bigger missing
  {
   
  smallerX=random(0, 760);
 smallerY=random(-20,-200);
 smallerZ=random(5,8);
 smallerY=smallerY+smallerZ;
  }
if( smallerX+80>=mouseX && mouseX+cartW>=smallerX && smallerY+80>=n )
{
 
  
  smallerX=random(0, 760);
  smallerY=random(-20,-200);
  smallerZ=random(5,8);
smallerY=smallerY+smallerZ;
 
cartW=cartW-80; 

}

if(count/60>20 && score>100|| count/60<40 && score>200)
{
  smallerZ=random(8,10);
 smallerY=smallerY+smallerZ;
}  
  }  

}




void keyPressed()
{

  if (keyCode==ESC)
  {
    exit ();
  }
  // press esc to end the game

  if (stageNum==0)
  {
    stageNum=3;
  }
  //to the instruction
  else if (stageNum==3)
  {
    stageNum=4;
  }
  //to game play
  else if (stageNum==4)
  {
    stageNum=1;
  }
}

void mousePressed()
{
  if (stageNum==2 && mouseX>=120 && mouseX<420 && mouseY>= 540 &&
    mouseY< 640)
  {
    setup();//restart the game
  }
}
//Minim requries this stop() function
void stop()
{
  //close the player
  player.close();

  //stop Minim
  minim.stop();
}


//define of the general properties
//**********************************************************************************************************************//
int frame=100;

//definition of all_map array
//used to store the value for the robot and the walls and so on
int [][]all_map={
{1,1,1,1,1,1,1,1,1,1},
{1,0,0,0,0,0,0,0,0,1},
{1,0,1,1,1,0,1,1,0,1},
{1,0,1,1,1,0,1,1,0,1},
{1,0,0,0,0,0,0,0,0,1},
{1,0,1,1,0,0,0,0,0,1},
{1,0,1,1,0,1,1,1,0,1},
{1,0,1,1,0,1,1,1,0,1},
{1,0,0,0,0,0,0,0,0,1},
{1,1,1,1,1,1,1,1,1,1}
};


//the sidth of the rectangular and the unit of the coordinate
float map_w;
//the length of the coordinate
int map_l=10;
int count;
int countpre;
int counts;
int countspre;
int all_gamestart;


PImage start;
PImage botton_start;
PImage botton_instruction;
int botton_start_x;
int botton_start_y;
int botton_start_width;
int botton_start_height;
int botton_instruction_x;
int botton_instruction_y;
int botton_instruction_width;
int botton_instruction_height;

/*robot class*/
//**********************************************************************************************************************//
//the current position of the rectangular
int robot_x;
int robot_y;
float robot_xppre;
float robot_yppre;


//the coordinate for draw the image
float robot_xp;
float robot_yp;


//the center point coordinate(change with robot_x and ..._y) 
float robot_xstan;
float robot_ystan;


//array used for store the route of robot in robot_x and robot_y coordinate
int [][]robot_road={
{1,1,1,1,1,1,1,1,1,1},
{1,0,0,0,0,0,0,0,0,1},
{1,0,1,1,0,1,1,1,0,1},
{1,0,1,1,0,1,1,1,0,1},
{1,0,1,1,0,1,1,0,0,1},
{1,0,1,1,0,0,0,0,1,1},
{1,0,0,0,0,1,1,1,0,1},
{1,0,1,1,0,1,1,1,0,1},
{1,0,1,1,0,0,0,0,0,1},
{1,1,1,1,1,1,1,1,1,1}
};

//array for storing the data of the result of the maze
int [][]robot_road_result=new int[map_l][map_l];
int robot_hp;

//for define the destination
int robot_xend;
int robot_yend;

//for defining the previous x and after x
//and the previous y and the after y



//image preparation
PImage robot_left_img;
PImage robot_right_img;
PImage robot_up_img;
PImage robot_down_img;
PImage robot_img;

//define the x1 and y1
int robot_x1,robot_y1; 

//bullet class
//define the bullets class
ArrayList <Bullet> bullets;


//walls class array
//ArrayList <Wall> walls;

//wall image
PImage wall_img;


//player class
//image preparation
PImage player_img;
PImage playerl_img;
PImage playerr_img;
PImage playeru_img;
PImage playerd_img;

//basic values for the player
float player_xp;
float player_yp;
int player_x;
int player_y;
int player_xpre;
int player_ypre;
float player_xstan;
float player_ystan;
int player_direction;
int player_hp;
//controls
int player_v_right;
int player_v_left;
int player_v_up;
int player_v_down;
int player_steps_l;
int player_steps_r;
int player_steps_u;
int player_steps_d;
int player_positionchange;
int player_presscount_right;
int player_presscount_left;
int player_presscount_up;
int player_presscount_down;



void setup()
{
  //basic initialization
  //********************************************************************************************************************//
  background(0);
  size(400,400);
  frameRate(frame);
  map_l=10;
  map_w=width/float(map_l);
  wall_img=loadImage("wall.png");
  count=0;
  countpre=0;
  counts=0;
  countspre=0;
  all_gamestart=0;

  start=loadImage("start.jpg");
  botton_start=loadImage("botton_start.jpg");
  botton_instruction=loadImage("botton_instruction.png");
  
  botton_start_x=width/2;
  botton_start_y=height/4;
  botton_start_width=width/2;
  botton_start_height=height/6;
  
  botton_instruction_width=width/2;
  botton_instruction_height=height/6;
  botton_instruction_x=width/2;
  botton_instruction_y=height*3/4;

  robot_xppre=0;
  robot_yppre=0;
  //robot class initialization
  //*********************************************************************************************************************//  
  robot_hp=50;
  robot_x=1;
  robot_y=1;  
  robot_xstan=(float(robot_x)+0.5)*map_w;
  robot_ystan=(float(robot_y)+0.5)*map_w;
  robot_xp=robot_xstan;
  robot_yp=robot_ystan;
  robot_xend=8;
  robot_yend=8;
  //image preparation
  robot_left_img=loadImage("robotl.png");
  robot_right_img=loadImage("robotr.png");
  robot_up_img=loadImage("robotu.png");
  robot_down_img=loadImage("robotd.png");
  robot_img=loadImage("robotl.png");
  
  
  //bullets class initialization
  //**********************************************************************************************************************//
  bullets=new ArrayList();

  
  //player class
  //assignment of the image
  player_img=loadImage("robotl.png");
  playerl_img=loadImage("robotl.png");
  playerr_img=loadImage("robotr.png");
  playeru_img=loadImage("robotu.png");
  playerd_img=loadImage("robotd.png");

  
  //assignment of the stable player values
  player_x=8;
  player_y=8;
  player_xp=(player_x+0.5)*map_w;
  player_yp=(player_y+0.5)*map_w;
  player_direction=0;
  player_v_right=0;
  player_v_left=0;
  player_v_up=0;
  player_v_down=0;
  player_xpre=player_x;
  player_ypre=player_y;
  player_steps_l=0;
  player_steps_r=0;
  player_steps_u=0;
  player_steps_d=0;
  player_presscount_right=0;
  player_presscount_left=0;
  player_presscount_up=0;
  player_presscount_down=0;  
  player_hp=50;
  
}
  
  
void draw()
{
  if(all_gamestart==0)
  {
    image(start,0,0,width,height);
    //set the dynamic value(variable that changes frequently)
    //basic
    
    imageMode(CENTER);
    image(botton_start,botton_start_x,botton_start_y,botton_start_width,botton_start_height);        
    image(botton_instruction,botton_instruction_x,botton_instruction_y,botton_instruction_width,botton_instruction_height);            
    imageMode(CORNER);
  }
  
  else if(all_gamestart==2)
  {
    background(100);
    textSize(24);
    fill(255);
    text("Press 'z' to shoot",width/4,height/4,width/2,height/6);
    text("Press 'up down left right' key to control the robot whose hp bar is red",width/4,height*3/8,width/2,height/6);
    text("Press 'r' to back to the menu",width/4,height-80,width/2,height/6);
    noFill();
  }
  
  else if(all_gamestart==1)
  {  
    background(255);
    rectMode(CENTER);
    imageMode(CENTER);
    countspre=counts;
    count++;
    
    if(robot_hp>=40)
    {
      counts=count/10;
    }
    else if(robot_hp<40&&robot_hp>30)
    {
      counts=count/5;
    }
    else if(robot_hp<=30)
    {
      counts=count;
    }
    //clean the old version of the map information
    all_cleanmap();  
        
    //robot class
    robot_xstan=(float(robot_x)+0.5)*map_w;
    robot_ystan=(float(robot_y)+0.5)*map_w;
    robot_x1=robot_x;
    robot_y1=robot_y;
    
    //player class
    //assignment of the dynamic values
    player_xpre=player_x;
    player_ypre=player_y;
    player_xstan=(player_x+0.5)*map_w;
    player_ystan=(player_y+0.5)*map_w;
    player_x=int(player_xp/map_w);
    player_y=int(player_yp/map_w);  
      
    
    //initialization of the map (define the wall 1)
    all_map[player_x][player_y]=2;
    for(int i1=0;i1<map_l;i1++)
    {
      for(int i2=0;i2<map_l;i2++)
      {
        if(all_map[i1][i2]==1)
        {
          robot_road[i1][i2]=1;
        }      
      }
    }
    
    
    //initialization of the map (define the robot 2)
  
    //update the image
    //basic all
    all_printmap();
      
    //robot class
    robot_print();
    robot_showhp();
  
    //update of the player image
    player_printplayer();
    player_showhp();
      
    //for testing
    println("the robot_xend and robot_yend are ");
    println("robot_xend is "+robot_xend);
    println("robot_yend is "+robot_yend);
    println("the robot_detectplayer is "+robot_detectplayer() ); 
    println("the player coordinate is "+ player_x+" "+player_y);
    println("the robot coordinate is "+robot_x+" "+robot_y);
    println("robot_detect value is "+robot_detect());
    
    
    
    //actions for calculation
    //robot class
    //action of robot_searchroad()
    //calculate the xend and yend  println("the endx is "+robot_xend);
    robot_search_shootpoint();
  
    
    //create the bullet class
    robot_shoot();
  
    
    //test
    println("before the excape function, the xend and yend values are ");
    println("xend is(before escape() function) "+robot_xend);
    println("yend is(before escape() function) "+robot_yend);
    println("the robot_detectplayer value is "+robot_detectplayer());
    println("the robot_x1 and robot_y1 values are ");
    
    
    if(robot_detectplayer()==0)
    {
      robot_escape();
    }
    
    println("the robot_judge_bulletclose is "+ robot_judge_bulletclose());
    println("the cleanroad detection is ");
  
    println("robot_playermove_detect is "+robot_playermove_detect());
    println("robot_judge_bulletclose is "+robot_judge_bulletclose());
    println("robot_roadreachjudge is "+robot_roadreachjudge());
    println("the endx and the endy values are ");
    println("the endx is "+robot_xend);
    println("the endy is "+robot_yend);
  //  println("robot_detect_online is"+robot_detect_online());
    
    
    if(robot_playermove_detect()==1||robot_judge_bulletclose()==1||robot_roadreachjudge()==1||robot_detect_trap()==1)
    {
      robot_cleanroad();
    }
    
    if(robot_detect_online()==1)
    {
      robot_searchroad();
    }
  
    
    
    robot_xppre=robot_xp;
    robot_yppre=robot_yp;
  
    //move the image of the robot
    
    if(robot_detectplayer()==0)
    {
      robot_move();
    }
      
    //bullet class 
    //actions
    bullet_Displayall();
    bullet_Remove_Extra();
    bullet_Remove_Collide_Wall();  
    bullet_Remove_Collide_Robot();
    bullet_Remove_Collide_Player();
    bullet_Moveall();
    
    
    //player_class
    //calculation of the player movement
    player_move();
    //show either win or fail
    all_show_win_lose();  
  }
  
}



//detect the direction(where to go)
//1:right
//2:left
//3:up
//4:down
int robot_detect()
{
  if(robot_x<map_l-1&&robot_road_result[robot_x+1][robot_y]==2)
  {
    return 1;
  }
  else if(robot_x>=1&&robot_road_result[robot_x-1][robot_y]==2)
  {
    return 2;
  }
  else if(robot_y>=1&&robot_road_result[robot_x][robot_y-1]==2)
  {
    return 3;
  }
  else if(robot_y<map_l-1&&robot_road_result[robot_x][robot_y+1]==2)
  {
    return 4;
  }
  else         //when it reaches the end point, it just stay there
  {
    return 0;
  }
  
}


//clean the previous road:
void robot_cleanroad()
{
  for(int i1=0;i1<map_l;i1++)
  {
    for(int i2=0;i2<map_l;i2++)
    {
      if(robot_road[i1][i2]==2||robot_road[i1][i2]==3)
      {
        robot_road[i1][i2]=0;
      }
    }
  }
}
      


int robot_roadreachjudge()
{
  if(robot_x==robot_xend&&robot_y==robot_yend)
  {
    return 1;
  }
  else 
  {
    return 0;
  }
}



void robot_road_loadresult()
{
  for(int i1=0;i1<map_l;i1++)
  {
    for(int i2=0;i2<map_l;i2++)
    {
      robot_road_result[i1][i2]=robot_road[i1][i2];
    }
  }
}



int robot_playermove_detect()
{
  if(player_x!=player_xpre||player_y!=player_ypre)
  {
    return 1;
  }
  else
  {
    return 0;
  }
}



//decide the searchroad type
//1:down right
//2:down left
//3:up right
//4:up left
//5:right
//6:left
//7:up
//8:down
int robot_searchtype()
{
  //go right and go down
  if(robot_xend-robot_x>0&&robot_yend-robot_y>0)
  {
    return 1;
  }
  //go left and go down
  else if(robot_x-robot_xend>0&&robot_yend-robot_y>0)
  {
    return 2;
  }
  //go right and go up
  else if(robot_xend-robot_x>0&&robot_yend-robot_y<0)
  {
    return 3;
  }
  //go left and go up
  else if(robot_xend-robot_x<0&&robot_yend-robot_y<0)
  {
    return 4;
  }
  //right 
  else if(robot_xend-robot_x>0&&robot_yend==robot_y)
  {
    return 5;
  }
  //left
  else if(robot_xend-robot_x<0&&robot_yend==robot_y)
  {
    return 6;
  }
  //up
  else if(robot_yend-robot_y<0&&robot_xend==robot_x)
  {
    return 7;
  }
  //down
  else if(robot_yend-robot_y>0&&robot_xend==robot_x)
  {
    return 8;
  }
  //others
  else 
  {
    return 0;
  }
}
  


//define the search type
void robot_search1()
{
 if(robot_x1==robot_xend&&robot_y1==robot_yend)
 {
   robot_road[robot_x1][robot_y1]=2;
   robot_road_loadresult();
 }
 else
 {
   //right
   if(robot_x1<map_l-1&&robot_road[robot_x1+1][robot_y1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_x1++;
     robot_search1();
     robot_x1--;
     robot_road[robot_x1][robot_y1]=0;
   }
   //down
   if(robot_y1<map_l-1&&robot_road[robot_x1][robot_y1+1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_y1++;
     robot_search1();
     robot_y1--;
     robot_road[robot_x1][robot_y1]=0;
   }
   //left
   if(robot_x1>0&&robot_road[robot_x1-1][robot_y1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_x1--;
     robot_search1();
     robot_x1++;
     robot_road[robot_x1][robot_y1]=0;
   }
   //up
   if(robot_y1>0&&robot_road[robot_x1][robot_y1-1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_y1--;
     robot_search1();
     robot_y1++;
     robot_road[robot_x1][robot_y1]=0;
   }
 }
}


void robot_search2()
{
  if(robot_x1==robot_xend&&robot_y1==robot_yend)
  {
    robot_road[robot_x1][robot_y1]=2;
    robot_road_loadresult();
  }  
  else
  {
    //left
    if(robot_x1-1>=0&&robot_road[robot_x1-1][robot_y1]==0)
    {
      robot_road[robot_x1][robot_y1]=2;
      robot_x1--;
      robot_search2();
      robot_x1++;
      robot_road[robot_x1][robot_y1]=0;
    }    
    //up
    if(robot_road[robot_x1][robot_y1-1]==0&&robot_y1-1>=0)
    {
      robot_road[robot_x1][robot_y1]=2;
      robot_y1--;
      robot_search2();
      robot_y1++;
      robot_road[robot_x1][robot_y1]=0;
    }    
    //right
    if(robot_road[robot_x1+1][robot_y1]==0&&robot_x1+1<map_l-1)
    {
      robot_road[robot_x1][robot_y1]=2;
      robot_x1++;
      robot_search2();
      robot_x1--;
      robot_road[robot_x1][robot_y1]=0;
    }    
    //down
    if(robot_road[robot_x1][robot_y1+1]==0&&robot_y1+1<map_l-1)
    {
      robot_road[robot_x1][robot_y1]=2;
      robot_y1++;
      robot_search2();
      robot_y1--;
      robot_road[robot_x1][robot_y1]=0;
    }
  }
}



void robot_search3()
{ 
 if(robot_x1==robot_xend&&robot_y1==robot_yend)
 {
   robot_road[robot_x1][robot_y1]=2;
   robot_road_loadresult();
 }
 else
 {
   //right
   if(robot_x1<map_l-1&&robot_road[robot_x1+1][robot_y1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_x1++;
     robot_search3();
     robot_x1--;
     robot_road[robot_x1][robot_y1]=0;
   }
   //up
   if(robot_y1-1>=0&&robot_road[robot_x1][robot_y1-1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_y1--;
     robot_search3();
     robot_y1++;
     robot_road[robot_x1][robot_y1]=0;
   }
   //left
   if(robot_x1>0&&robot_road[robot_x1-1][robot_y1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_x1--;
     robot_search3();
     robot_x1++;
     robot_road[robot_x1][robot_y1]=0;
   }
   //down
   if(robot_y1+1<map_l-1&&robot_road[robot_x1][robot_y1+1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_y1++;
     robot_search3();
     robot_y1--;
     robot_road[robot_x1][robot_y1]=0;
   }
 }
}  



void robot_search4()
{
 if(robot_x1==robot_xend&&robot_y1==robot_yend)
 {
   robot_road[robot_x1][robot_y1]=2;
   robot_road_loadresult();
 }
 else
 {
   //left
   if(robot_x1-1>=0&&robot_road[robot_x1-1][robot_y1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_x1--;
     robot_search4();
     robot_x1++;
     robot_road[robot_x1][robot_y1]=0;
   }
   //up
   if(robot_y1-1>=0&&robot_road[robot_x1][robot_y1-1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_y1--;
     robot_search4();
     robot_y1++;
     robot_road[robot_x1][robot_y1]=0;
   }
   //right
   if(robot_x1+1<map_l-1&&robot_road[robot_x1+1][robot_y1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_x1++;
     robot_search4();
     robot_x1--;
     robot_road[robot_x1][robot_y1]=0;
   }
   //down
   if(robot_y1+1<map_l-1&&robot_road[robot_x1][robot_y1+1]==0)
   {
     robot_road[robot_x1][robot_y1]=2;
     robot_y1++;
     robot_search4();
     robot_y1--;
     robot_road[robot_x1][robot_y1]=0;
   }
 }
}


//right
void robot_search5()
{
  if(robot_x1==robot_xend&&robot_y1==robot_yend)
  {
    robot_road[robot_x1][robot_y1]=2;
    robot_road_loadresult();
  }
  else 
  {
    if(robot_x1+1<map_l-1&&robot_road[robot_x1+1][robot_y1]==0)
    {
      robot_road[robot_x1][robot_y1]=2;
      robot_x1++;
      robot_search5();
      robot_x1--;
      robot_road[robot_x1][robot_y1]=0;
    }
  }
}


//left
void robot_search6()
{
  if(robot_x1==robot_xend&&robot_y1==robot_yend)
  {
    robot_road[robot_x1][robot_y1]=2;
    robot_road_loadresult();
  }
  else 
  {
    if(robot_x1-1>0&&robot_road[robot_x1-1][robot_y1]==0)
    {
      robot_road[robot_x1][robot_y1]=2;
      robot_x1--;
      robot_search6();
      robot_x1++;
      robot_road[robot_x1][robot_y1]=0;
    }
  }
}


//up
void robot_search7()
{
  if(robot_x1==robot_xend&&robot_y1==robot_yend)
  {
    robot_road[robot_x1][robot_y1]=2;
    robot_road_loadresult();
  }
  else 
  {
    if(robot_y1-1>0&&robot_road[robot_x1][robot_y1-1]==0)
    {
      robot_road[robot_x1][robot_y1]=2;
      robot_y1--;
      robot_search7();
      robot_y1++;
      robot_road[robot_x1][robot_y1]=0;
    }
  }
}


//down
void robot_search8()
{
  if(robot_x1==robot_xend&&robot_y1==robot_yend)
  {
    robot_road[robot_x1][robot_y1]=2;
    robot_road_loadresult();
  }
  else 
  {
    if(robot_y1+1<map_l-1&&robot_road[robot_x1][robot_y1+1]==0)
    {
      robot_road[robot_x1][robot_y1]=2;
      robot_y1++;
      robot_search8();
      robot_y1--;
      robot_road[robot_x1][robot_y1]=0;
    }
  }
}
      


//all search function
void robot_searchroad()
{
  if(robot_searchtype()==1)
  {
    robot_search1();
  }
  else if(robot_searchtype()==2)
  {
    robot_search2();
  }
  else if(robot_searchtype()==3)
  {
    robot_search3();
  }
  else if(robot_searchtype()==4)
  {
    robot_search4();
  }
  else if(robot_searchtype()==5)
  {
    robot_search5();
  }
  else if(robot_searchtype()==6)
  {
    robot_search6();
  }
  else if(robot_searchtype()==7)
  {
    robot_search7();
  }
  else if(robot_searchtype()==8)
  {
    robot_search8();
  }
}
  
  
  
// the bullet class functions and class declaration
//***********************************************************************************************************************//
//************************************************************************************************************************//
class Bullet
{
  //declaration of the value put outside
  float x;
  float y;
  int direction; //1:right 2:left 3:up 4:down
  int collide_result;
  
  //assignment of the initialization be put in setup
  Bullet(float bullet_x,float bullet_y,int bullet_direction)
  {
    x=bullet_x;
    y=bullet_y;
    direction=bullet_direction;
    collide_result=0;    
  }
  
  //the actions put in the draw()
  
  //go actions
  void go_right()
  {
    x+=5;
  }
  void go_left()
  {
    x-=5;
  }
  void go_up()
  {
    y-=5;
  }
  void go_down()
  {
    y+=5;
  }
    

  //detect function
  //note:          calculation:             robot_xstan=(float(robot_x)+0.5)*map_w;
  int detect_wall()
  {
    float xl;
    float xr;
    float yu;
    float yd;
    float xstan;
    float ystan;
    int result=0;
    for(int i1=0;i1<map_l;i1++)
    {
      for(int i2=0;i2<map_l;i2++)
      {
        if(all_map[i1][i2]==1)  //i1:x  i2:y
        {
          //set the stan value
          xstan=(i1+0.5)*map_w;
          ystan=(i2+0.5)*map_w;
          //set the xl,xr,yu,yd
          xl=xstan-map_w/2;
          xr=xstan+map_w/2;
          yu=ystan-map_w/2;
          yd=ystan+map_w/2;
          //compare the point all_map[i1][i2](wall) with the point of the bullet (x,y)
          if(x>xl&&x<xr&&y>yu&&y<yd)
          {
            result=1;
          }
        }
      }
    }
    return result;
  }
    
            
  //go function
  void go()
  {
    if(direction==1&&detect_wall()==0)
    {
      go_right();
    }
    else if(direction==2&&detect_wall()==0)
    {
      go_left();
    }
    else if(direction==3&&detect_wall()==0)
    {
      go_up();
    }
    else if(direction==4&&detect_wall()==0)
    {
      go_down();
    }
  }
  

  //display the image for the bullets
  void display()
  {
    stroke(0);
    strokeWeight(8);
    point(x,y);
    strokeWeight(1);
  }  
}
  

    
void keyPressed()
{
  if(keyCode==LEFT&&player_steps_d==0&&player_steps_l==0&&player_steps_u==0&&player_steps_r==0&&player_detect_wall_left()==0)
  {
    player_direction=2;
    player_presscount_left++;
    player_presscount_right=0;
    player_presscount_up=0;
    player_presscount_down=0;
    
  }  
  else if(keyCode==LEFT&&player_steps_d==0&&player_steps_l==0&&player_steps_u==0&&player_steps_r==0&&player_detect_wall_left()==1)
  {
    player_direction=20;
    player_presscount_left++;
    player_presscount_right=0;
    player_presscount_up=0;
    player_presscount_down=0;
  }
      
  else if(keyCode==RIGHT&&player_steps_d==0&&player_steps_l==0&&player_steps_u==0&&player_steps_r==0&&player_detect_wall_right()==0)
  {
    player_direction=1;
    player_presscount_right++;
    player_presscount_left=0;
    player_presscount_up=0;
    player_presscount_down=0;
  }
  else if(keyCode==RIGHT&&player_steps_d==0&&player_steps_l==0&&player_steps_u==0&&player_steps_r==0&&player_detect_wall_right()==1)
  {
    player_direction=10;
    player_presscount_right++;
    player_presscount_left=0;
    player_presscount_up=0;
    player_presscount_down=0;
  }
  
  else if(keyCode==UP&&player_steps_d==0&&player_steps_l==0&&player_steps_u==0&&player_steps_r==0&&player_detect_wall_up()==0)
  {
    player_direction=3;
    player_presscount_up++;
    player_presscount_right=0;
    player_presscount_left=0;
    player_presscount_down=0;
  }
  else if(keyCode==UP&&player_steps_d==0&&player_steps_l==0&&player_steps_u==0&&player_steps_r==0&&player_detect_wall_up()==1)
  {
    player_direction=30;
    player_presscount_up++;
    player_presscount_right=0;
    player_presscount_left=0;
    player_presscount_down=0;
  }
  
    
  else if(keyCode==DOWN&&player_steps_d==0&&player_steps_l==0&&player_steps_u==0&&player_steps_r==0&&player_detect_wall_down()==0)
  {
    player_direction=4;
    player_presscount_down++;
    player_presscount_up=0;
    player_presscount_left=0;
    player_presscount_right=0;
  }
  else if(keyCode==DOWN&&player_steps_d==0&&player_steps_l==0&&player_steps_u==0&&player_steps_r==0&&player_detect_wall_down()==1)
  {
    player_direction=40;
    player_presscount_down++;
    player_presscount_up=0;
    player_presscount_left=0;
    player_presscount_right=0;
  }
  
  
  
  if(key=='z'&&(player_direction==20||player_direction==2))
  {
    Bullet temp=new Bullet(player_xp-(map_w/2+10),player_yp,2);
    bullets.add(temp);
  }
  
  else if(key=='z'&&(player_direction==10||player_direction==1))
  {
    Bullet temp=new Bullet(player_xp+(map_w/2+10),player_yp,1);
    bullets.add(temp);
  }
  
  else if(key=='z'&&(player_direction==30||player_direction==3))
  {
    Bullet temp=new Bullet(player_xp,player_yp-(map_w/2+10),3);
    bullets.add(temp);
  }
  
  else if(key=='z'&&(player_direction==40||player_direction==4))
  {
    Bullet temp=new Bullet(player_xp,player_yp+(map_w/2+10),4);
    bullets.add(temp);
  }
  else if(key=='r')
  {
    loop();
    if(all_judge_win()==1)
    {
      frame+=50;
    }
    setup();
  }  
}
  

  
void all_printmap()
{
 for(int i1=0;i1<=9;i1++)
 {
   for(int i2=0;i2<=9;i2++)
   {
     if(all_map[i1][i2]==1)
     {
       fill(100);
       image(wall_img,map_w/2+i1*map_w,map_w/2+i2*map_w,map_w,map_w);
     }
   }
 }
}


void bullet_Moveall()
{
  for(Bullet temp:bullets)
  {
    temp.go();
  }
}



void bullet_Displayall()
{
  for(Bullet temp:bullets)
  {
    temp.display();
  }
}


void bullet_Remove_Extra()
{
  while(bullets.size()>100)
  {
    bullets.remove(0);
  }
}


void bullet_Remove_Collide_Wall()
{
  for(int i=0;i<bullets.size();i++)
  {
    if(bullets.get(i).detect_wall()==1)
    {
      bullets.remove(i);
    }
  }
}


int bullet_Detect_Collide_Robot(Bullet bullet)
{
  if(abs(bullet.x-robot_xp)<robot_img.width/2&&abs(bullet.y-robot_yp)<robot_img.height/2)
  {
    return 1;
  }
  else 
  {
    return 0;
  }
}


void bullet_Remove_Collide_Robot()
{
  for(int i=0;i<bullets.size();i++)
  {
    if(bullet_Detect_Collide_Robot(bullets.get(i))==1)
    {
      bullets.remove(i);
      robot_hp--;
    }
  }
}


int robot_detect_online()
{
  if(abs(robot_xp-robot_xstan)<2&&abs(robot_yp-robot_ystan)<2)
  {
    return 1;
  }
  else 
  {
    return 0;
  }
}


//player class
//player class
//print the player image
void player_printplayer()
{
  if(player_direction==2||player_direction==20)
  {
    player_img=playerl_img;
  }
  else if(player_direction==1||player_direction==10)
  {
    player_img=playerr_img;
  }
  else if(player_direction==3||player_direction==30)
  {
    player_img=playeru_img;
  }
  else if(player_direction==4||player_direction==40)
  {
    player_img=playerd_img;
  }
  image(player_img,player_xp,player_yp,map_w,map_w);

}

/*
//detect whether the player has moved a a unit
int player_reachdetect()
{
  if(player_xpre!=player_x||player_ypre!=player_y)
  {
    return 1;
  }
  else 
  {
    return 0;
  }
  
}
*/

//move the player according to the call
void player_move()
{
  if(player_direction==1&&player_steps_r<map_w&&player_steps_l==0&&player_steps_u==0&&player_steps_d==0&&player_presscount_right!=1)
  {
    player_xp+=5;
    player_steps_r+=5;
  }
  else if(player_direction==1&&player_steps_r>=map_w)
  {
    player_direction=10;
    player_steps_r=0;
  }
  
  else if(player_direction==2&&player_steps_l<map_w&&player_steps_r==0&&player_steps_u==0&&player_steps_d==0&&player_presscount_left!=1)
  {
    player_xp-=5;
    player_steps_l+=5;
  }
  else if(player_direction==2&&player_steps_l>=map_w)
  {
    player_direction=20;
    player_steps_l=0;
  }
  
  else if(player_direction==3&&player_steps_u<map_w&&player_steps_l==0&&player_steps_r==0&&player_steps_d==0&&player_presscount_up!=1)
  {
    player_yp-=5;
    player_steps_u+=5;    
  }
  else if(player_direction==3&&player_steps_u>=map_w)
  {
    player_direction=30;
    player_steps_u=0;
  }
  
  else if(player_direction==4&&player_steps_d<map_w&&player_steps_l==0&&player_steps_u==0&&player_steps_r==0&&player_presscount_down!=1)
  {
    player_yp+=5;
    player_steps_d+=5;    
  }
  else if(player_direction==4&&player_steps_d>=map_w)
  {
    player_direction=40;
    player_steps_d=0;
  }
  
}


int player_detect_wall_right()
{
  if(all_map[player_x+1][player_y]!=1)
  {
    return 0;
  }
  else 
  {
    return 1;
  }
}

int player_detect_wall_left()
{
  if(all_map[player_x-1][player_y]!=1)
  {
    return 0;
  }
  else 
  {
    return 1;
  }
}

int player_detect_wall_up()
{
  if(all_map[player_x][player_y-1]!=1)
  {
    return 0;
  }
  else 
  {
    return 1;
  }
}

int player_detect_wall_down()
{
  if(all_map[player_x][player_y+1]!=1)
  {
    return 0;
  }
  else
  {
    return 1;
  }
}


int robot_detect_player_prechange()
{
  if(player_xpre!=player_x||player_ypre!=player_y)
  {
    return 1;
  }
  else
  {
    return 0;
  }
}


void robot_search_shootpoint()
{
  int distance_right=0;
  int distance_left=0;
  int distance_up=0;
  int distance_down=0;
  int distance_short=0;
  int endx_right=0;
  int endy_right=0;
  int endx_left=0;
  int endy_left=0;
  int endx_up=0;
  int endy_up=0;
  int endx_down=0;
  int endy_down=0;
  int []distance_value=new int[4];
  
  //search right
  for(int i=player_x;i<map_l;i++)
  {
    if(all_map[i][player_y]==1)
    {
      endx_right=i-1;
      endy_right=player_y;
      distance_right=(i-1)-player_x;
      break;
    }
  }

  //search left
  for(int i=player_x;i>=0;i--)
  {
    if(all_map[i][player_y]==1)
    {      
      endx_left=i+1;
      endy_left=player_y;
      distance_left=player_x-(i+1);
      break;
    }
  }

  //search up
  for(int i=player_y;i>=0;i--)
  {
    if(all_map[player_x][i]==1)
    {
      endx_up=player_x;
      endy_up=i+1;
      distance_up=player_y-(i+1);
      break;
    }
  }
  
  //search down
  for(int i=player_y;i<map_l;i++)
  {
    if(all_map[player_x][i]==1)
    {
      endx_down=player_x;
      endy_down=i-1;
      distance_down=(i-1)-player_y;
      break;
    }
  }
  
  //assign the shortest value of the distance
  distance_value[0]=distance_right;
  distance_value[1]=distance_left;
  distance_value[2]=distance_up;
  distance_value[3]=distance_down;
  
  for(int count=0;count<6;count++)
  {
    boolean exchange=false;
    for(int i=3;i>0;i--)
    {
      if(distance_value[i-1]<distance_value[i])
      {
        int c;
        c=distance_value[i-1];
        distance_value[i-1]=distance_value[i];
        distance_value[i]=c;
        exchange=true;
      }
    }
    if(exchange==false)
    {
      break;
    }
  }
  
  for(int i=0;i<4;i++)
  {
    if(distance_value[i]!=0)
    {
      distance_short=distance_value[i];
      break;
    }
  }      
      
  if(distance_short==distance_right)
  {
    robot_xend=endx_right;
    robot_yend=endy_right;
  }
  
  else if(distance_short==distance_left)
  {
    robot_xend=endx_left;
    robot_yend=endy_left;
  }
    
  else if(distance_short==distance_up)
  {
    robot_xend=endx_up;
    robot_yend=endy_up;
  }
    
  else if(distance_short==distance_down)
  {
    robot_xend=endx_down;
    robot_yend=endy_down;
  }
  
  //for testing
  for(int i=0;i<4;i++)
  {
    println("the endx_right, left, up, down values are", distance_value[i]);
  }
}



int robot_detectplayer()
{
  int result=0;  

  //search right
  for(int i=robot_x;i<map_l;i++)
  {
    if(all_map[i][robot_y]==2)
    {
      result=1;
      break;
    }
    else if(all_map[i][robot_y]==1)
    {
      break;
    }
  }
  
  //left
  for(int i=robot_x;i>=0;i--)
  {
    if(all_map[i][robot_y]==2)
    {
      result=2;
      break;
    }    
    else if(all_map[i][robot_y]==1)
    {
      break;
    }
  }
  
  //up
  for(int i=robot_y;i>=0;i--)
  {
    if(all_map[robot_x][i]==2)
    {
      result=3;
      break;
    }
    else if(all_map[robot_x][i]==1)
    {
      break;
    }    
  }
  
  //down
  for(int i=robot_y;i<map_l;i++)
  {
    if(all_map[robot_x][i]==2)
    {
      result=4;
      break;
    }
    else if(all_map[robot_x][i]==1)
    {
      break;
    }
    
  }  
  return result;
}



void robot_move()
{
  //change the position that shown on the screen(but do not change the robot_x value if the image hasn't reach the next target point)
  if(robot_detect()==1&&robot_xp-robot_xstan<map_w)
  {
//    robot_img=robot_right_img;
    robot_xp+=2;
  }
  else if(robot_xp-robot_xstan>=map_w-2)
  {
    robot_x++;
    robot_road_result[robot_x-1][robot_y]=3;
  }
  else if(robot_detect()==2&&robot_xstan-robot_xp<map_w)
  {
//    robot_img=robot_left_img;
    robot_xp-=2;
  }
  else if(robot_xstan-robot_xp>=map_w)
  {
    robot_x--;
    robot_road_result[robot_x+1][robot_y]=3;
  }
  else if(robot_detect()==3&&robot_ystan-robot_yp<map_w)
  {
//    robot_img=robot_up_img;
    robot_yp-=2;
  }
  else if(robot_ystan-robot_yp>=map_w)
  {
    robot_y--;
    robot_road_result[robot_x][robot_y+1]=3;
  }    
  else if(robot_detect()==4&&robot_yp-robot_ystan<map_w)
  {
//    robot_img=robot_down_img;
    robot_yp+=2;
  }  
  else if(robot_yp-robot_ystan>=map_w)
  {
    robot_y++;
    robot_road_result[robot_x][robot_y-1]=3;
  }
}


void all_cleanmap()
{
  for(int i1=0;i1<map_l;i1++)
  {
    for(int i2=0;i2<map_l;i2++)
    {
      if(all_map[i1][i2]!=1)
      {
        all_map[i1][i2]=0;
      }
    }
  }
}


void robot_print()
{
  if(robot_detectplayer()==1)
  {
    robot_img=robot_right_img;
  }
  else if(robot_detectplayer()==2)
  {
    robot_img=robot_left_img;
  }
  else if(robot_detectplayer()==3)
  {
    robot_img=robot_up_img;
  }
  else if(robot_detectplayer()==4)
  {
    robot_img=robot_down_img;
  }
  else if(robot_detect()==1)
  {
    robot_img=robot_right_img;
  }
  else if(robot_detect()==2)
  {
    robot_img=robot_left_img;
  }
  else if(robot_detect()==3)
  {
    robot_img=robot_up_img;
  }
  else if(robot_detect()==4)
  {
    robot_img=robot_down_img;
  }
  image(robot_img,robot_xp,robot_yp,map_w,map_w);  
}

void bullet_Remove_Collide_Player()
{
  for(int i=0;i<bullets.size();i++)
  {
    if(abs(bullets.get(i).x-player_xp)<=map_w/2&&abs(bullets.get(i).y-player_yp)<=map_w/2)
    {
      bullets.remove(i);
      player_hp--;
    }
  }
}


void robot_shoot()
{
  if(robot_detectplayer()==1&&judge_timechange()==1)
  {
    Bullet temp=new Bullet(robot_xp+map_w*0.5,robot_yp,1);
    bullets.add(temp);
  }
  else if(robot_detectplayer()==2&&judge_timechange()==1)
  {
    Bullet temp=new Bullet(robot_xp-map_w*0.5,robot_yp,2);
    bullets.add(temp);    
  }
  else if(robot_detectplayer()==3&&judge_timechange()==1)
  {
    Bullet temp=new Bullet(robot_xp,robot_yp-(map_w*0.5),3);
    bullets.add(temp);    
  }
  else if(robot_detectplayer()==4&&judge_timechange()==1)
  {
    Bullet temp=new Bullet(robot_xp,robot_yp+(map_w*0.5),4);
    bullets.add(temp);    
  }  
}


int judge_timechange()
{
  if(countspre!=counts)
  {
    return 1;
  }
  else 
  {
    return 0;
  }
}

void robot_escape()
{
  for(Bullet temp:bullets)
  {
    if(abs(robot_xp-temp.x)<map_w*2&&abs(robot_yp-temp.y)<map_w*2)
    {
      if(all_map[robot_x][robot_y-1]==0&&temp.y-robot_yp>0)
      {
        robot_yend=robot_y-1;
        robot_xend=robot_x;        
      }
      else if(all_map[robot_x][robot_y+1]==0&&robot_yp-temp.y>0)
      {
        robot_yend=robot_y+1;
        robot_xend=robot_x;
      }
      else if(all_map[robot_x+1][robot_y]==0&&temp.x-robot_xp<0)
      {
        robot_xend=robot_x+1;
        robot_yend=robot_y;
      }
      else if(all_map[robot_x-1][robot_y]==0&&robot_xp-temp.x<0)
      {
        robot_xend=robot_x-1;
        robot_yend=robot_y;
      }
    }
  }
}



int robot_judge_bulletclose()
{
  int result=0;
  for(Bullet temp:bullets)
  {
    if(abs(robot_xp-temp.x)<map_w*1.25&&abs(robot_yp-temp.y)<map_w*1.25)
    {
      if(all_map[robot_x][robot_y-1]==0)
      {
        result=1;
      }
      else if(all_map[robot_x][robot_y+1]==0)
      {
        result=1;
      }
      else if(all_map[robot_x+1][robot_y]==0)
      {
        result=1;
      }
      else if(all_map[robot_x-1][robot_y]==0)
      {
        result=1;
      }
      else 
      {
        result=0;
      }
    }
    else 
    {
      result=0;
    }
  }
  return result;
}  
  
  
  
  
int robot_direction_go()
{
  if(robot_detect()==1&&robot_xp-robot_xstan<map_w)
  {
//    robot_img=robot_right_img;
    return 1;
  }
  else if(robot_detect()==2&&robot_xstan-robot_xp<map_w)
  {
//    robot_img=robot_left_img;
    return 2;
  }
  else if(robot_detect()==3&&robot_ystan-robot_yp<map_w)
  {
//    robot_img=robot_up_img;
    return 3;
  }
  else if(robot_detect()==4&&robot_yp-robot_ystan<map_w)
  {
//    robot_img=robot_down_img;
    return 4;
  }
  else 
  {
  return 0;  
  }
}


int robot_direction_escape()
{
  int result=0;
  for(Bullet temp:bullets)
  {
    if(abs(robot_xp-temp.x)<map_w*1.5&&abs(robot_yp-temp.y)<map_w*1.5)
    {
      if(all_map[robot_x][robot_y-1]==0)
      {
        result=3;
      }
      else if(all_map[robot_x][robot_y+1]==0)
      {
        result=4;
      }
      else if(all_map[robot_x+1][robot_y]==0)
      {
        result=1;
      }
      else if(all_map[robot_x-1][robot_y]==0)
      {
        result=2;
      }
    }
  }
  return result;
}


int robot_detect_trap()
{
  if(robot_xp==robot_xppre&&robot_yp==robot_yppre)
  {
    return 1;
  }
  else 
  {
    return 0;
  }
}

void robot_showhp()
{
  rectMode(CENTER);
  fill(0,255,0);
  rect(robot_xp,robot_yp-(map_w/2+2),robot_hp,5);
  noFill();
}


void player_showhp()
{
  rectMode(CENTER);
  fill(255,0,0);
  rect(player_xp,player_yp-(map_w/2+2),player_hp,5);
  noFill();
}


void all_win()
{
  background(255);
  noLoop();  
  textSize(20);
  fill(0);
  text("You Win!",width/8,height/2);
  text("Press 'r' to restart",width/4,height*3/4);  
}

void all_lose()
{
  background(0);
  noLoop();  
  textSize(20);
  fill(255);
  text("You Lose!",width/8,height/2);
  text("Press 'r' to restart",width/4,height*3/4);
}

int all_judge_win()
{
  if(robot_hp<=0)
  {
    return 1;
  }
  else if(player_hp<=0)
  {
    return 0;
  }
  else
  {
    return 2;
  }
}

void all_show_win_lose()
{
  if(all_judge_win()==1)
  {
    all_win();
  }
  else if(all_judge_win()==0)
  {
    all_lose();
  }
}


void mousePressed()
{
  if(abs(mouseX-botton_start_x)<botton_start_width/2&&abs(mouseY-botton_start_y)<botton_start_height/2)
  {
    all_gamestart=1;
  }
  else if(abs(mouseX-botton_instruction_x)<botton_instruction_width/2&&abs(mouseY-botton_instruction_y)<botton_instruction_height/2)
  {
    all_gamestart=2;
  }
  
}


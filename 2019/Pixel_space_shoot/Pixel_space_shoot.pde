import gifAnimation.*;
import ddf.minim.*;
Minim minim;
Gif effect; 
//Minim [] game = new Minim [4] ;
int snum =4 ; 
AudioPlayer [] gl = new AudioPlayer[snum] ;
AudioPlayer st0 ; 
AudioPlayer glvl1 ;
PFont ocra;
PImage SUI, GUI, jet, st, pa, paused, gunfire, in, in2, cli, insp, home, cursor,delements,ammo,delements2,hpk;
PImage bk, bk0;                   
PImage ebullet ;
int eneTyps = 4  ;
PImage [] ej  =  new PImage [eneTyps];
int jeta ,jetb,jetx,jety ; 
int gAudio ; // random control game audio play
int rand[]= new int [2]; // interger that control random effect
int temps, maintime, memtime, lgrtime,tcmd  ; //  time variables to control the array 
int bulletSpeed, bulletFreq ;
int score;
int harm ,HP ; 
int codi, codi2 ;              // interface condition game / start interface
int corx, cory ;
int arrset ;      // interger that reset the array
int N = 1500,B = 1500 ,S = 3000 ;
int startime, runtime;
int  a, v , k ;                   // initial  Y position of the image 
int rcon ;   // record the status of the pause and start 
int buttonpositionx, buttonpositiony, ba3x, ba3y, ix, iy, hx, hy; 
int loopNum  ; //  loopNum > 100 reset to 0 
int hnum ;  // the number to record the position of each pack in the array (realize the hp pack function)
int ie1,ie2,ie3, ie4;   // the interger that control the effect under the instruction interface
float hpsx[] = new float [N];    // record the speed hp pack (gain hp for player jet)
float hpsy [] = new float [N];
int [] ejM=new int [N];
int [] ejHp=new int [N];
float  hpx[] =new float [N];     /// recored the position of hp pack that generate randomly
float  hpy[] = new float [N];
float [][] ejMX= new float [S][N]; // the mouse position at each enemy bullet launch time to assisit calculate angel of bullet then calculate horiziontal speed and vertical speed
float [][] ejMY= new float [S][N];
float  difficulty ;
float [] effectX = new float [100] ;
float [] effectY = new float [100] ;
float [] effectT = new float [100] ; 
float ang, blink  ;  // control fonts of  start UI blinking
float ejt; 
float ina ; 
float [] bulletX=new float [N];
float [] bulletY=new float [N];
float [][] ebulletX=new float [S][N]; 
float [][] ebulletY=new float [S][N]; 
float [] ejY=new float [N];
float [] ejX=new float [N];
float [] ejS=new float [N];
float [] ejT=new float [N];
float [][] ejAng= new float [S][N];  // angle of enemy bullets 
boolean ine ;
boolean [][] ejAnas = new boolean [S][N];
boolean bult [] = new boolean[N] ;
boolean effectB [] = new boolean[100];
boolean eb[][] = new boolean[S][N];// detect the enemy bullet is meaningful or not 
boolean le , rt , up, dn ;
boolean hpack[] = new boolean[N] ; 

void setup() {
   size(800, 600);
   frameRate(60);
   HP = 100 ;
  difficulty = 1 ;
  le = rt = up = dn = false ;
  ocra = createFont("OCRAStd.otf",32);
  minim = new Minim(this);
  st0 = minim.loadFile("au0.mp3");
  effect = new Gif(this, "effect.gif");
  effect.play();
  delements = loadImage("delements2.png");
  SUI =       loadImage("SUI.jpg");
  GUI =       loadImage("GUI.jpg");    
  jet =       loadImage("jet.png");       
  st  =       loadImage("pause.png");
  pa  =       loadImage("pause2.png");
  paused =    loadImage("paused.png");
  home =      loadImage("home.png");
  gunfire =   loadImage("gunfire.png");
  ebullet =   loadImage("bullet2.png");
  in =        loadImage("instruction.png");
  in2 =       loadImage("instruction2.png");
  cli =       loadImage("cli.png");
  insp =      loadImage("instpage.png"); 
  bk=         loadImage("back.png");
  bk0=        loadImage("back2.png");
  cursor =    loadImage("cursor.png");
  ammo =      loadImage("ammo.png");
  delements2= loadImage("delements2.png");
  hpk =       loadImage("hpack.png" );
  tcmd = 1 ;
  rand[0] = int(random(0,2));
  hnum = 0 ;
  for (int i = 0; i < eneTyps; i+=1) {
    ej[i] = loadImage("ej"+i+".png");
  }
   for(int i =0 ; i<snum ; i+= 1  ){
//    game[i] = new Minim(this);
    gl[i] =  minim.loadFile("game"+i+".mp3");
  }
  loopNum= 0;
  arrset= 0 ;
  a = -1800 ;
  codi = 0 ;
  corx = 350;
  rcon = 1 ;
  score = 0 ;
  harm =25 ; 
  cory =600;
  startime = millis();
  ang = 0 ;
  bulletFreq = 200 ;
  bulletSpeed = 15 ;
  smooth(1000);
  frameRate(60);
  noCursor();
  jeta = 63 ; 
  jetb = 87 ;
  ejt = 0 ;
}
void draw() {

//println("coni: "+codi, "   rcon: " + rcon, "   i: "+i, "  mouseX:"+mouseX, "   mouseY:"+mouseY, "   gtime:"+temps,k, loopNum);
  maintime =  ((millis()-startime)/1000) ;
  runtime = ((millis()-startime)/bulletFreq)-arrset ;
  if (loopNum > 90) { 
    loopNum = 0 ;
    for( int j =0 ; j<100 ; j+= 1 ) { 
      effectT[j] = 0 ;
    }
  }
  if (runtime>=1000) {
    arrset=((millis()-startime)/bulletFreq);                   // prevent array out of bound
  }

//******************************************start****************************************
  if (codi==0) {        
     st0.play();
    if(rand[0] ==0){
     welcomePage();}else{ welcomePage2();}

    if (keyPressed) { 
      codi = 1;
    }
    button(720, 506 );
    image(cli, 300, 491.5, 400, 25);    
    //   image(st,300,300,75,75);
    ie1 = 6  ;
    ie2 = 94 ;
    ie3 = 101 ;
    ie4 = 57  ;
    ine = true;
 } 
  
  if(codi==2){
     
  
  }   
//***************************************game********************************************************//
  if ( codi == 1& rcon ==1) {
   gameCore();
     
  //*************************************************************************************************************
    
  }

  
  
  if ( rcon == -1  & codi == 1) { 
    image(GUI, 0, a);
    imageMode(CENTER);  
      for (int j=0; j<v; j=j+1) {
        if(bult[j]==true ){
        image( gunfire, bulletX[j], bulletY[j], gunfire.width, gunfire.height);
          }
     
        }    
      for(int j = 0  ; j < k ; j+= 1 ) {
        if(ejHp[j]>0){
        image(ej[ ejM[j] ] ,  ejX[j] ,  ejY[j],63,87);
         }        
      } 
    ang = ang +0.1 ;
    blink   =sin(ang) ;
    if (blink > 0) {                              // blink control "press any key to continue"
      imageMode(CENTER); 
      image(paused, 400, 300);
      imageMode(CORNER);
    }   
    imageMode(CORNER);
    fill(247,221,20);
    textSize(40); 
    text("SCORE:", 0,43);
    text(score, 0, 80);
  }
 //********************************************framework logic control(such as buttons) and variables reset codes**************************************************************// 
  if(codi!=0&&codi!=3){      // start music  
  st0.pause();     
  st0.rewind();
  }
  if(hnum> 100){
    hnum = 0;
  }
  
  if (codi == 1) {                               
    startbutton(765, 35);   
    home(690, 35);
  }  
  if (codi == 3) 
  {  
    
   instruction();
    back(690, 510);
  } 
  if (rcon==-1||codi==3||codi==0) {
    image(cursor, mouseX, mouseY, 36, 59);
  }
     if(codi!=1 && rcon!=1&&tcmd==1) {
    lgrtime = temps ;
    tcmd = -tcmd ;
  }
   if(codi==1 && rcon==1 && tcmd == -1 ){
     memtime = maintime ; 
     tcmd = -tcmd ;
   }
   if(codi!=1 || rcon!=1 ){
     gAudio = int(random(0,3)); 
     gl[gAudio].pause();
     gl[gAudio].rewind();
     println("pause");
   }
   if(HP==0){
   codi= -1;
   }
   if(codi ==1 && rcon==1 ) {
      
       if (gl[gAudio].position() >= gl[gAudio].length()) {
          gl[gAudio].rewind()  ; 
         gAudio = int(random(0,3)); 
         gl[gAudio].play();
         }else{ gl[gAudio].play();}

   }
 //*******************************************************************************************************// 
      
  if(codi== -1 ){
    losePage() ;
        for( int j =0 ; j<100 ; j+= 1 ) { 
      effectT[j] = 0 ;
    }
  }
  
  }
void startbutton(int x, int y ) {
  imageMode(CENTER);
  if (rcon == -1 ) {
    if (mouseX > x-37.5 & mouseX < x+37.5 & mouseY > y-37.5  & mouseY<y + 37.5) {
      image(st, x, y, 60, 60);
    } else { 
      image(st, x, y, 75, 75);
    }
  } else if (mouseX > x-37.5 & mouseX < x+37.5 & mouseY > y-37.5  & mouseY<y + 37.5& rcon ==1 ) {
    // image(pa,x,y,75,75);
    image(pa, x, y, 60, 60);
  } else { 
    image(pa, x, y, 75, 75);
  }
  imageMode(CORNER);
  buttonpositionx= x;
  buttonpositiony= y;
} 
void mousePressed() {          //game  status control  by the button 
  if (mouseX > buttonpositionx-37.5 & mouseX < buttonpositionx+37.5 & mouseY > buttonpositiony-37.5  & mouseY<buttonpositiony + 37.5&codi==1) {
    rcon = -rcon ;
  } 
  if (codi == 3 & mouseX > ba3x-37.5 & mouseX <ba3x+37.5 & mouseY > ba3y-37.5  & mouseY<ba3y + 37.5) {
    codi= 0 ;
  } else if (codi == 0 & mouseX > ix-37.5 & mouseX <ix+37.5 & mouseY > iy-37.5  & mouseY<iy + 37.5) {
    codi= 3 ;
  } else if (codi == 1 & mouseX > hx-37.5 & mouseX <hx+37.5 & mouseY > hy-37.5  & mouseY<hy + 37.5) {
    codi= 0 ;
  }
  if(codi== -1 && mouseX > 400-37.5 && mouseX <400+37.5 && mouseY > 450-37.5  && mouseY<450 + 37.5 ){
  setup();
  codi = 0; 
  }
 
}
void keyPressed() {
  if (codi== 1 && key=='p'||key =='P' ) {
    rcon = -rcon ;
  }
  if( keyCode== LEFT ) {
    le = true ;
  }
  if( keyCode== RIGHT) {
    rt = true ;
  }
  if( keyCode== UP ) {
    up = true ;
  }
  if( keyCode== DOWN  ) {
    dn = true ;
  }
}
void keyReleased(){
   if( keyCode== LEFT ) {
    le = false ;
  }
  if( keyCode== RIGHT) {
    rt = false ;
  }
  if( keyCode== UP ) {
    up = false ;
  }
  if( keyCode== DOWN  ) {
    dn = false ;
  }
}
void button(int x, int y ) {
  imageMode(CENTER);
  if (codi == 0 ) {
    if (mouseX > x-37.5 & mouseX < x+37.5 & mouseY > y-37.5  & mouseY<y + 37.5) {
      image(in2, x, y, 75, 75);
    } else { 
      image(in, x, y, 75, 75);
    }
  }
  imageMode(CORNER);
  ix = x ;
  iy = y ;
} 
void back(int x, int y ) {
  imageMode(CENTER);
  if (mouseX > x-37.5 & mouseX < x+37.5 & mouseY > y-37.5  & mouseY<y + 37.5) {
    image(bk0, x, y, 75, 75);
  } else { 
    image(bk, x, y, 75, 75);
  } 
  ba3x = x;
  ba3y = y;
  imageMode(CORNER);
}
void home(int x, int y ) {
  imageMode(CENTER);
  if (mouseX > x-37.5 & mouseX < x+37.5 & mouseY > y-37.5  & mouseY<y + 37.5) {
    image(home, x, y, 60, 60);
  } else { 
    image(home, x, y, 75, 75);
  } 
  hx = x;
  hy = y;
  imageMode(CORNER);
}    
void startinterface() {
    background(255); 
    textAlign(  CENTER,CENTER );
    textFont(ocra); 
    fill(255);    
}
void welcomePage() { 
 background(0);
 textFont(ocra); 
 fill(0,0,255);
 textAlign(CENTER,CENTER);
 textSize(100);
 text("Pixel",395,95); 
 text("SpaceShoot",395,195); 
  fill(255,0,0);
  text("Pixel",400,100); 

 text("SpaceShoot",400,200); 
    ang =  ang+ 0.1 ;
    blink   =sin(ang) ;
    if (blink< 0) {                              // blink control "press any key to continue"
 fill(255);
 textSize(35);
 text("Press any key to continue",400,350); 
  image(delements,350,390,100,100);
  }
   textAlign(TOP,LEFT);
   fill(0);
}
void welcomePage2(){
    image(SUI, 0, 0); //start interface
    noStroke();
    ang =  ang+ 0.1 ;
    blink   =sin(ang) ;
    if (blink< 0) {                              // blink control "press any key to continue"
      fill(0);
      rect(69, 298, 642, 49); 
      rect( 345, 354, 181, 99);
    }
}
void playerJet(){    // under imagemode CORNER 
   image(jet, jetx ,jety, jeta , jetb);
  if(up==true) {
    mouseY-= 9;
  }
  if(dn==true) {
    mouseY+= 9;
  }
  if(rt==true) {
    mouseX+= 9;
  }
  if(le==true) {
    mouseX-= 9;
  }
  if(mouseX<jeta/2){ 
    mouseX=jeta/2;
  }
  if(mouseX>width-jeta/2){
    mouseX= width- jeta/2;
  } 
   if(mouseY>height-jetb/2){
    mouseY= height- jetb/2;
  } 
   if(mouseY<jetb/2){
    mouseY=  jetb/2;
  } 
   jetx = mouseX ; 
   jety = mouseY ; 
  
}
void effect() {
   for(int j = 0 ; j < loopNum ; j+=1){
     if(effectB[j]==true){
       image(effect, effectX[j] ,effectY[j],50,50);
       effectT[j]= effectT[j]+1; 
    }
     if(effectT[j] >40){
     effectB[j] =false ; 
     
    }     
  }
}
void losePage() { 
  background(0); 
  textFont(ocra); 
  textAlign(CENTER ,CENTER ) ;
   textSize(80) ;
  fill(255,0,0);
  text("Mission",400,150);
  text("Failed" , 400,250);
  text("Score:"+score  , 400,350);
  textAlign(TOP , LEFT );
  
  home(400,450) ;
  image(cursor, mouseX,mouseY,36,59);
}
void instruction(){
  ang = ang +0.1 ;
  blink   =sin(2*ang) ;
  noStroke();
  background(0);
  image(delements2,300,300,200,200);  
  textFont(ocra);
  textAlign(CENTER, CENTER);
  textSize(25) ;
  fill(0,255,0);
  text("Use arrow keys or mouse to control the jet",400,80);
  text("The jet will shoot automatically",400,120);
  text( "Shoot the enemies to get scores" ,400,160);
  text("Avoid being hitted by the enemy fire",400,200);

  fill(0);
  rect (ie1+16,66,800,30);
  rect (ie2+16,105,800,30);
  rect (ie3+16,145,800,30);
  rect (ie4+16,184,800,31);  

  ie1+= 10 ;
  fill(0,255,0);
  rect(ie1,66,16,30); 
  if(ie1>800){
  rect(ie2,105,16,30);
  ie2+=10;
  } 
  if(ie2>800){

   rect(ie3,145,16,30);
   ie3+=10;
  }
  if(ie3>800){
   rect(ie4,185,16,31); 
   if(ine){
   ie4+=10;
   }
  }
  if(ie4==727) {
    ine = false;
    if(blink>0){
      fill(0);
      rect(ie4,185,16,31);
    }  
  }
  fill(0);
  rect(688,96,112,90);
  textAlign(TOP,LEFT);
} 
void gameCore()   {
     temps  =   maintime-memtime+lgrtime;
    noCursor();
    a  = a+1 ;           // background moving 
    image(GUI, 0, a) ;
   imageMode(CENTER); 
    v=runtime;
    bulletX[v]=mouseX;
    bulletY[v]=mouseY;
    bult[v] = true ; 
    for (int j=0; j<v; j=j+1) {
      if(bult[j]==true) {
      image( gunfire, bulletX[j], bulletY[j], gunfire.width, gunfire.height);
      bulletY[j]-=bulletSpeed;
        for(int i = 0 ; i< k ; i+= 1){
          if(ejX[i]-31.5<bulletX[j]&&bulletX[j] < ejX[i]+31.5&&ejY[i]-43.5<bulletY[j] &&bulletY[j]<ejY[i]+43.5&& ejHp[i]>0){
            bult[j] = false ; 
            ejHp[i] -= harm ; 
//            image(effect, bulletX[j], bulletY[j],150,150);
           
            effectX[loopNum] =  bulletX[j] ;  // explosion effect of enemy jet
            effectY[loopNum] =  bulletY[j] ;
            effectB[loopNum] =  true ; 
            loopNum+=1 ;
            if(ejHp[i]<= 0){
            score+=int( random(8,11) ); 
             if(random(0,10)>7){            // health pack 
              hpack[hnum]  = true ;
              hpx[hnum]=ejX[i] ;
              hpy[hnum] = ejY[i] ; 
              hpsx[hnum] = random(-10,11) ;
              hpsy[hnum] = random(-10,11) ; 
              hnum+=1 ; 
            }
          } 
        }
      }
    }
  } 
  for(int j = 0; j< hnum-1 ; j+=1 ) { 
    if(hpack[j]==true){
      hpx[j]+=  hpsx[j];    // hp pack move 
      hpy[j]+= hpsy[j];
      image(hpk, hpx[j] ,hpy[j] , 30, 30);
      if(hpy[j]< 15 ){
       hpsy[j] = - hpsy[j];        
      } 
      if(hpx[j]<15|| hpx[j]>785 ){
       hpsx[j] = - hpsx[j] ; 
      }
      if(mouseX -31.5 <hpx[j] && hpx[j]< mouseX + 31.5 && mouseY-41.5<hpy[j]&&hpy[j]<mouseY+41.5){
         HP+= 10 ;
         hpack[j] = false ;
      }
      if(800<hpx[j] || hpx[j]<0||600<hpy[j]||hpy[j]<0){
         hpack[j] = false ;
      }
    }
  } 
     playerJet();  
 //****************************************ENEMY JETS CORE PROGRAM********************************************************
  if(temps>5){   
    ejt= ejt + 0.166667 ;   
    if( ejt > 2500) { 
      ejt = 0;
    }
    k = int(ejt/10) ; 
    ejX[k]  = random(31.5 ,width-31.5 ) ;
    ejY[k]  = -43.5;
    ejM[k]  = int(random(0 , eneTyps)) ;
    ejS[k]  =  random(3 , 10)*difficulty;
    ejHp[k] = int( difficulty*50 ); 
    ejT[k]  = 0 ;
    for(int j =0 ; j < 1000 ;j+=1){
    ejAnas[k][j] =  true ; 
    }  
    for(int j = 0 ; j < k ; j+= 1 ) {
      if(ejHp[j] > 0 && -31.5<=ejX[j]&& ejX[j]<= 831.5&& -43.5<=ejY[j]&& ejY[j]<=643.5) {      
      ejY[j] += ejS[j] ;                      // let enemy jet locate and shoot player  
      ejT[j] += 0.166667 ;
      ebulletX[j][int(2*ejT[j]/5)] = ejX[j] ;
      ebulletY[j][int(2*ejT[j]/5)] = ejY[j] ; 
      eb[j][int(2*ejT[j]/5)] = true ;        // angle calculation 
      ejMY[j][int(2*ejT[j]/5)] = (mouseY-ejY[j])/abs(mouseY-ejY[j]); 
      ejMX[j][int(2*ejT[j]/5)] = (mouseX-ejX[j])/abs(mouseX-ejX[j]);
      for(int i = 0 ; i<k ; i += 1) {
        if(eb[j][i]==true) {
     // angel preocess
          if(ejAnas[j][i]==true){
           ejAng[j][i] =  atan(abs((mouseY-ejY[j])/ (mouseX-ejX[j])));
           ejAnas[j][i] = false ;
            }  
          }
        }
       
      }
    }
    for(int j = 0 ; j< k ; j+= 1) {
      for(int i = 0 ; i<k ; i+=1){
        if( ebulletX[j][i]<0 ||  ebulletX[j][i]>800 ||  ebulletY[j][i]<0 ||  ebulletY[j][i]>600) {
          eb[j][i]= false ;
          }
        if(eb[j][i]==true) {               
            ebulletX[j][i]+= 10*abs(cos(ejAng[j][i]))*ejMX[j][i];
            ebulletY[j][i]+= 10*abs(sin(ejAng[j][i]))*ejMY[j][i];   // convert angle data to  horizontal and vertical speed
            image(ebullet, ebulletX[j][i],ebulletY[j][i],gunfire.width,gunfire.width);
           if(mouseX -31.5 <ebulletX[j][i] && ebulletX[j][i]< mouseX + 31.5 && mouseY-41.5<ebulletY[j][i]&&ebulletY[j][i]<mouseY+41.5){
             HP-=5;
             eb[j][i]=false;
            } 
          }
        }  
         if(ejHp[j] > 0 ) {
         image(ej[ ejM[j] ] ,  ejX[j] , ejY[j],63,87);
         }
      }  
  }
  effect();
    if (a == 0) {
      a = -1800 ;    // background circulation      
    }   
    imageMode(CORNER);
    textFont(ocra); 
    textSize(40); 
    fill(247,221,20);
    text("SCORE:", 0,43);
    text(score, 168, 43);
    text("HP:", 0,90);
    text(HP, 100, 90);
}  

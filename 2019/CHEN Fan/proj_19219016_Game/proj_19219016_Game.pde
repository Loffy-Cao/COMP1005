import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;

int stageN = 0;
int dt = 0;
int x, y, easyX, easyY;

int mn = 3;
PImage [] man = new PImage [mn];
int mt = 0;
int mw = 90;
int mh = 90;
int dx, dy;

int bn = 4;
PImage [] bubble = new PImage [bn];
boolean [] v = new boolean [bn];
int [] bt = new int [bn];
int bw = 60;
int bh = 60;
float [] bx = new float [bn];
float [] by = new float [bn];
float [] ax = new float [bn];
float [] ay = new float [bn];

PImage stage1;
PImage go;
PImage win;
PImage homeb;
PImage startb;
PImage nextb;
PImage qb;
PImage h0, h1, h2, mu0, mu1;

int life;
int score;
int time;
int ttime;

void setup(){
  mu0 = loadImage("mu0.png");
  mu1 = loadImage("mu1.png");
  h0 = loadImage("h0.png");
  h1 = loadImage("h1.png");
  h2 = loadImage("h2.png");
  stage1 = loadImage("bg1.jpg");
  go = loadImage("go1.png");
  win = loadImage("win0.png");
  homeb = loadImage("homeb.png");
  nextb = loadImage("nextb.png");
  startb = loadImage("startb.png");
  qb = loadImage("qb.png");
  minim = new Minim(this);
  song = minim.loadFile("music.mp3", 2048);
  song.play();

  for(int i = 0; i < 3; i++){
    man[i] = loadImage("m" + i + ".png");
  }
  for(int i = 0; i < 4; i++){
    bubble[i] = loadImage("b" + i + ".png");
    v[i] = true;
    bt[i] = int(random(0, 3));
    ax[i] = random(-3, 3);
    ay[i] = random(-3, 3);
    bx[i] = random(0, width);
    by[i] = random(0, height);
  }
  /*bx[1] = int(random(-(6 * bw), width + 6 * bw));
  by[1] = int(random(-(6 * bh), -bh));
  
  bx[2] = int(random(-(6 * bw), width + 6 * bw));
  by[2] = int(random(height + bh, height + 6 * bh));
  
  bx[3] = int(random(- (6 * bw), -bw));
  by[3] = int(random(-(6 * bh), height + 6 * bh));
  
  bx[0] = int(random(width + bh, width + 6 * bw));
  by[0] = int(random(-(6 * bh), height + 6  *bh));*/
  
  size(800, 600);
  score = 0;
  life = 5;
  time = millis();
  x = width/2 - mw/2;
  y = height/2 - mh/2;

}

void draw(){
  //println(mouseX+ "," + mouseY);
  
  if(dt == 0){
    easyX = mouseX - mw/2;
    easyY = mouseY - mh/2;
    x = easyX;
    y = easyY;
  }
  
  
if(stageN == 0){
  image(mu0, 0, 0, width, height);
  image(startb, width/2 - 100, height/2, 200, height/3);
  image(qb, width - 90, 0, 90, 90);
}

if(stageN == 4){
  image(h0, 0, 0, width, height);
  image(nextb, width - 100, height - 100, 100, 100);
}

if(stageN == 5){
  image(h1, 0, 0, width, height);
  image(homeb, width - 70, 0, 70, 70);
}

if(stageN == 6){
  image(mu1, 0, 0, width, height);
  image(homeb, width - 70, 0, 70, 70);
}

if(stageN == 2){
  image(h2, 0, 0, width, height);
  image(nextb, width - 100, height - 100, 100, 100);
}

//Game part
if(stageN == 1){  
  ttime = (millis() - time)/1000;
  
  image(stage1, 0, 0, width, height);
  image(homeb, width - 70, 0, 70, 70);
  textSize(23);
  fill(0, 0, 0);
  //text("\nTime:\nScore:", 0, 0);
  text("Time: " + ttime + "s", 10, 30);
  text("Score: " + score, 10, 60);
  text("Life: " + life, 10, 90);
  
  if(dt == 1){
    x = x + dx;
    y = y + dy;
  }
  
  image(man[mt], x, y, mw, mh);
  
  
  for(int j = 0; j < 4; j++){
     if(v[j] == true){
  image(bubble[bt[j]], bx[j], by[j], bw, bh);
  
  //bubbles move
  bx[j] = bx[j] + ax[j];
  by[j] = by[j] + ay[j];
  if(bx[j] < 0){
    ax[j] = - ax[j];
  }else
  if(bx[j] > (width - bw)){
    ax[j] = - ax[j];
  }
  
  if (by[j] > (height - bh)){
  ay[j] = - ay[j];
  } else
  if (by[j] < 0){
  ay[j] = - ay[j];
  }
  
  
  //touch
  float aLeft = bx[j];
  float aRight = bx[j] + bw;
  float aTop = by[j];
  float aBottom = by[j] + bh;

  float bLeft = x;
  float bRight = x + mw;
  float bTop = y;
  float bBottom = y + mh;
  
    if((mt == bt[j]) && (aLeft < bRight) && (bLeft < aRight) && (aBottom > bTop) && (aTop < bBottom)){
      v[j] = false;
      score++;
      bt[j] = int(random(0, 3));
      bx[j] = random(0, width);
      by[j] = random(0, height);
      
      v[j] = true;
    } else if((mt != bt[j]) && (aLeft < bRight) && (bLeft < aRight) && (aBottom > bTop) && (aTop < bBottom)){
      v[j] = false;
      life--;
      bt[j] = int(random(0, 4));
      bx[j] = random(0, width);
      by[j] = random(0, height);
      v[j] = true;
    }
  
     }

  }
  
  if(life <= 0 || ttime >= 300){
    image(go, 0, 0, width, height);
    image(homeb, width/2 - 100, height/2, 200, height/3);
  } 
  
  if(score >= 10){
    image(win, 0, 0, width, height);
    image(homeb, width - 70, 0, 70, 70);
  }
}
  
}

void mousePressed(){
  if(stageN == 0){
    if((mouseX > (width/2 - 100)) && (mouseX < ((width/2 - 100) + 200)) && (mouseY > height/2) && (mouseY < height/2 + 200)){
      stageN = 6;
    }
    if((mouseX > width - 90) && (mouseX < width) && (mouseY > 0) && (mouseY < 90)){
      stageN = 2;
    }
  }else
  
  if(stageN == 2){
    if(mouseX > width - 100 && mouseX < width && mouseY > height - 100 && mouseY < height){
        stageN = 4;
      }
  }else

  if(stageN == 4){
    if(mouseX > width - 100 && mouseX < width && mouseY > height - 100 && mouseY < height){
      stageN = 5;
    }
  }else
  
  if(stageN == 5){
    if(mouseX > width - 70 && mouseX < width && mouseY > 0 && mouseY < 70){
    stageN = 0;
    }
  } else
  
  if(stageN == 6){
    if(mouseX > width - 70 && mouseX < width && mouseY > 0 && mouseY < 70){
    stageN = 0;
    }
    if(mouseX > 120 && mouseX < 340 && mouseY > 280 && mouseY < 410){
    dt = 0;
    stageN = 1;
    }else if(mouseX > 430 && mouseX < 680 && mouseY > 280 && mouseY < 390){
    dt = 1;
    stageN = 1;
    }
    
  } else 
  
  if(stageN == 1){
    if(life <= 0 || ttime >= 300){
      if((mouseX > (width/2 - 100)) && (mouseX < ((width/2 - 100) + 200)) && (mouseY > height/2) && (mouseY < height/2 + 200))
        stageN = 0;
        score = 0;
        life = 5;
        ttime = 0;
    }else if(mouseX > width - 70 && mouseX < width && mouseY > 0 && mouseY < 70){
      stageN = 0;
      score = 0;
      life = 5;
      ttime = 0;
    }
  }

  if(dt == 0){
    mt++;
      if(mt == 3){
        mt = 0;
      }
  }

}

void keyPressed(){
  
  if(dt == 1){
  if(keyCode == LEFT){
    dy = 0;
    dx = dx - 3;
  } else if (keyCode == RIGHT){
    dy = 0;
    dx = dx + 3;
  } else if (keyCode == UP){
    dx = 0;
    dy = dy - 3;
  } else if (keyCode == DOWN){
    dx = 0;
    dy = dy + 3;
  }else if(keyCode == ' '){
        mt++;
      if(mt == 3){
        mt = 0;
      }
    }
  }

}


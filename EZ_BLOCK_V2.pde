PImage block;

int[][][] blocks;
int[][] randoms;
int[] sums;    //sum of blocks
boolean animation_done;
int animation_que;
int animation_count;
long frames=0;
int answer=0;
int scale=6;
int n_scale;
int[] sentakusi;
boolean pushed;
int GET_POINT;
int selected;

void setup(){
  textSize(32);
  size(1200,900);
  frameRate(60);
  animation_done=false;
  animation_que=scale*scale*scale-1;
  animation_count=0;
  n_scale=1;
  sentakusi=new int[4];
  pushed=false;
  selected=0;
  
  for(int i=0; i<scale; i++){
    n_scale*=2;
  }


  block=loadImage("gp.png");
  blocks=new int[scale][scale][scale];    //[layer number][z][x] layer number 0 is highest scale-1 is lowest 
  randoms=new int[scale+1][scale+1];    //randomize the number of blocks
  sums=new int[scale];    //sum of blocks
  
  for(int i=0; i<scale; i++){
    sums[i]=0;
    for(int j=0; j<scale; j++){
      for(int k=0; k<scale; k++){
        blocks[i][j][k]=0;
      }
    }
  }
  init();
    
}

void keyPressed(){
  
  if(key=='W' || key=='w'){
    if(pushed==false){
      if(answer==answer+sentakusi[0]){
        GET_POINT=Math.min(10,10-((int)(frames-scale*scale*scale))/150);
        text("Correct answer! :"+GET_POINT+" P",300,800);
        pushed=true;
      }
      else{
        GET_POINT=0;
        text("Wrong answer! :"+GET_POINT+" P",300,800);
        pushed=true;
      }
    }
    text("ANSWER :"+answer,300,850);
    selected=1;
  }
  else if(key=='A' || key=='a'){
    if(pushed==false){
      if(answer==answer+sentakusi[1]){
        GET_POINT=Math.min(10,10-((int)(frames-scale*scale*scale))/150);
        text("Correct answer! :"+GET_POINT+" P",300,800);
        pushed=true;
      }
      else{
        GET_POINT=0;
        text("Wrong answer! :"+GET_POINT+" P",300,800);
        pushed=true;
      }
    }
    text("ANSWER :"+answer,300,850);
    selected=2;
  }
  else if(key=='S' || key=='s'){
    if(pushed==false){
      if(answer==answer+sentakusi[2]){
        GET_POINT=Math.min(10,10-((int)(frames-scale*scale*scale))/150);
        text("Correct answer! :"+GET_POINT+" P",300,800);
        pushed=true;
      }
      else{
        GET_POINT=0;
        text("Wrong answer! :"+GET_POINT+" P",300,800);
        pushed=true;
      }
    }
    text("ANSWER :"+answer,300,850);
    selected=3;
  }
  else if(key=='D' || key=='d'){
    if(pushed==false){
      if(answer==answer+sentakusi[3]){
        GET_POINT=Math.min(10,10-((int)(frames-scale*scale*scale))/150);
        text("Correct answer! :"+GET_POINT+" P",300,800);
        pushed=true;
      }
      else{
        GET_POINT=0;
        text("Wrong answer! :"+GET_POINT+" P",300,800);
        pushed=true;
      }
    }
    text("ANSWER :"+answer,300,850);
    selected=4;
  }
  
  else if(key=='r'){
    //init();
    background(200);
    repaint();
  }
  
  else if(key=='x'){
    init();
    background(200);
    //repaint();
  }
}

void draw(){
  
  noStroke();
  fill(202);
  rect(10,10,670,60);
  rect(780,130,250,400);
  stroke(255,255,255);
  strokeWeight(2);
  for(int i=0; i<11; i++){
    line(20+60*i,20,20+60*i,60);
  }
  fill(255, 0,0);
  rect(20, 30, Math.max(0,600-Math.max(0,frames-scale*scale*scale)/2.5), 20); //1
  text("TIME",20,100);
  
  if(selected==1){
    fill(255, 0, 0, 0);
  }
  else{
    fill(255, 0, 0, 250);
  }
  rect(790, 140, 200, 80); //1
  
  if(selected==2){
    fill(0, 255, 0, 0);
  }
  else{
    fill(0, 255, 0, 250);
  }
  rect(790, 240, 200, 80); //1
  
  if(selected==3){
    fill(0, 0, 255, 0);
  }
  else{
    fill(0, 0, 255, 250);
  }
  rect(790, 340, 200, 80); //1
  
  if(selected==4){
    fill(255, 255, 0, 0);
  }
  else{
    fill(255, 255, 0, 250);
  }
  rect(790, 440, 200, 80); //1
  
  fill(255);

  text("how many cubes?",700,40);
  textSize(64);
  
  text("W:"+(answer+sentakusi[0]),800,200);
  text("A:"+(answer+sentakusi[1]),800,300);
  text("S:"+(answer+sentakusi[2]),800,400);
  text("D:"+(answer+sentakusi[3]),800,500);
  textSize(32);
  text("R replay",800,700);
  
  if(animation_done==false){
    frames++;
    if(blocks[animation_que%scale][scale-1-(animation_que%(scale*scale))/scale][animation_que/(scale*scale)]!=0){
      image(block,300-((animation_que%(scale*scale))/scale)*51+51*(animation_que/(scale*scale)),70+(scale-1-(animation_que%(scale*scale))/scale)*30+30*(scale-1-animation_que/(scale*scale))+60*(animation_que%scale));
    }
    animation_que--;
    if(animation_que<0){
      animation_done=true;
    }
  }
  else{
    frames++;
    if(Math.max(0,600-Math.max(0,frames-scale*scale*scale)/2.5)==0){
      pushed=true;
    }
    
  }
  
}

void repaint(){
  animation_done=false;
  animation_que=scale*scale*scale-1;
}

void init(){
  background(200);
  frames=0;
  answer=0;
  animation_done=false;
  animation_que=scale*scale*scale-1;
  animation_count=0;
  pushed=false;
  GET_POINT=0;
  selected=0;

  blocks=new int[scale][scale][scale];    //[layer number][z][x] layer number 0 is highest scale-1 is lowest 
  randoms=new int[scale+1][scale+1];    //randomize the number of blocks
  sums=new int[scale];    //sum of blocks
  
  for(int i=0; i<scale; i++){
    sums[i]=0;
    for(int j=0; j<scale; j++){
      for(int k=0; k<scale; k++){
        blocks[i][j][k]=0;
      }
    }
  }
  int[] param=new int[3];    //height yoko*32 tate*32    server はここだけ情報をわたせばいい 例 4,15,7のように  
  param[0]=scale;
  int sc1=0;
  int sc2=0;
  while(true){
    sc1=0;
    sc2=0;
    param[1]=(int) (Math.random()*n_scale);
    param[2]=(int) (Math.random()*n_scale);
    
    
    for(int i=0; i<scale; i++){
      randoms[0][i+1]=param[1]%2;    //x jiku
      randoms[i+1][0]=param[2]%2;    //y jiku
      sc1+=param[1]%2;
      sc2+=param[2]%2;
      
      param[1]=param[1]/2;
      param[2]=param[2]/2;
    }
    
    if(sc1>=scale/2+1 && sc2>=scale/2+1){
      break;
    }
  }
  
  
  for(int i=1; i<=scale; i++){
    randoms[0][i]=randoms[0][i-1]+randoms[0][i];
    randoms[i][0]=randoms[i-1][0]+randoms[i][0];
  }
  
  
  for(int i=1; i<=scale; i++){
    for(int j=1; j<=scale; j++){
      randoms[i][j]=randoms[0][j]+randoms[i][0];
    }
  }
  
  
  for(int i=0; i<scale; i++){
    for(int j=0; j<scale; j++){
      blocks[scale-1][i][j]=Math.max(param[0]-randoms[i+1][j+1],0);
    }
  }
  

 
 for(int i=0; i<scale; i++){
   for(int j=0; j<scale; j++){
     if(blocks[scale-1][j][i]!=0){
       sums[i]+=blocks[scale-1][j][i];
     }
   }
 }
  
  for(int i=0; i<scale; i++){
    for(int j=i; j<scale; j++){
      if(sums[i]>=sums[j]){
        int[] tmp1=new int[scale];
        int[] tmp2=new int[scale];
        
        for(int k=0; k<scale; k++){
          tmp1[k]=blocks[scale-1][k][i];
          tmp2[k]=blocks[scale-1][k][j];
        }
        
        for(int k=0; k<scale; k++){
          blocks[scale-1][k][i]=tmp2[k];
          blocks[scale-1][k][j]=tmp1[k];
        }
      }
    }
  }
  
  for(int i=scale-1; i>=0; i--){
    for(int j=0; j<scale; j++){
      for(int k=0; k<scale; k++){
        if(i==scale-1){
          if(blocks[i][j][k]!=0){
            answer++;
          }
        }
        else{
          blocks[i][j][k]=Math.max(blocks[i+1][j][k]-1,0);
          if(blocks[i][j][k]!=0){
            answer++;
          }
        }
      }
    }
  }
  
  int kaitou=(int)(Math.random()*32);
  for(int i=0; i<4; i++){
    if(kaitou%2==0){
      sentakusi[i]=i;
    }
    
    else if(kaitou%2==1){
      sentakusi[i]=-1*i;
    }
    kaitou/=2;
  }
  
  int tmp1=0;
  int tmp2=0;
  
  for(int i=0; i<4; i++){
    for(int j=i; j<4; j++){
      if(sentakusi[i]>sentakusi[j]){
        tmp1=sentakusi[i];
        tmp2=sentakusi[j];
        sentakusi[i]=tmp2;
        sentakusi[j]=tmp1;
      }
    }
  }
}






//過去の遺物　一応残しておく


/*
  int[] param=new int[3];    //height yoko*32 tate*32    server はここだけ情報をわたせばいい 例 4,15,7のように
  param[0]=scale;
  int sc1=0;
  int sc2=0;
  while(true){    //サーバーのやる所
    sc1=0;
    sc2=0;
    param[1]=(int) (Math.random()*n_scale);
    param[2]=(int) (Math.random()*n_scale);
    
    
    for(int i=0; i<scale; i++){
      randoms[0][i+1]=param[1]%2;    //x jiku
      randoms[i+1][0]=param[2]%2;    //y jiku
      sc1+=param[1]%2;
      sc2+=param[2]%2;
      
      param[1]=param[1]/2;
      param[2]=param[2]/2;
    }
    
    if(sc1>=scale/2+1 && sc2>=scale/2+1){
      break;
    }
  }
  //サーバーの仕事終わり
  
  for(int i=1; i<=scale; i++){
    randoms[0][i]=randoms[0][i-1]+randoms[0][i];
    randoms[i][0]=randoms[i-1][0]+randoms[i][0];
  }
  
  
  for(int i=1; i<=scale; i++){
    for(int j=1; j<=scale; j++){
      randoms[i][j]=randoms[0][j]+randoms[i][0];
    }
  }
  
  
  for(int i=0; i<scale; i++){
    for(int j=0; j<scale; j++){
      blocks[scale-1][i][j]=Math.max(param[0]-randoms[i+1][j+1],0);
    }
  }
  
 
 for(int i=0; i<scale; i++){
   for(int j=0; j<scale; j++){
     if(blocks[scale-1][j][i]!=0){
       sums[i]+=blocks[scale-1][j][i];
     }
   }
 }
  
  for(int i=0; i<scale; i++){
    for(int j=i; j<scale; j++){
      if(sums[i]>=sums[j]){
        int[] tmp1=new int[scale];
        int[] tmp2=new int[scale];
        
        for(int k=0; k<scale; k++){
          tmp1[k]=blocks[scale-1][k][i];
          tmp2[k]=blocks[scale-1][k][j];
        }
        
        for(int k=0; k<scale; k++){
          blocks[scale-1][k][i]=tmp2[k];
          blocks[scale-1][k][j]=tmp1[k];
        }
      }
    }
  }
  
  for(int i=scale-1; i>=0; i--){
    for(int j=0; j<scale; j++){
      for(int k=0; k<scale; k++){
        if(i==scale-1){
          if(blocks[i][j][k]!=0){
            answer++;
          }
        }
        else{
          blocks[i][j][k]=Math.max(blocks[i+1][j][k]-1,0);
          if(blocks[i][j][k]!=0){
            answer++;
          }
        }
      }
    }
  }*/


float light1X;
float light1Y;

float light2X;
float light2Y;

float lightBoard1Width;
float lightBoard1Height;

float lightBoard2Width;
float lightBoard2Height;

final color WHITE = color(255, 255, 255);
final color BG_COLOR = WHITE;
final color RED=color(255, 0, 0);
final color AMBER= color(255, 194, 0);
final color GREEN = color(0, 220, 0);
float rectX = 550; 
float rectY = 500;
int start;



void setup(){
  
 size(800, 800);
 light1X= width/2;
 light1Y= height/4.5;
 
 light2X= width/2 + 200;
 light2Y= (height/4.5) + 225;
 
 lightBoard1Width = 100;
 lightBoard1Height = 250;
 
 lightBoard2Width = 100;
 lightBoard2Height = 150;
 start =0;
// greenDuration = 10;
  
    
}


void draw(){
    

  frameRate(1);
  background(BG_COLOR);
  
  
  drawRoad();
  textSize(100);
  fill(0);
  text(start, 100, 100);
 
  

  lightBoard(light1X, light1Y, lightBoard1Width, lightBoard1Height);
  float d = drawCircle(light1X, light1Y, lightBoard1Width, lightBoard1Height);
 
  
  
 
  if(start < 10){
    greenOn(light1X, light1Y, d);
  }
  
  if(start >= 10 && start < 12 ){
    amberOn(light1X, light1Y, d);
  }
  
  if(start >=12 && start < 18){
     redOn(light1X, light1Y, d);
  }
  
 
  if(start == 17){
    start = 0;
  }
   start++;
  
  
  //amberOn(light1X, light1Y, d);
  //redOn(light1X, light1Y, d);
  
  
 
  //lightBoard(light2X, light2Y, lightBoard2Width, lightBoard2Height);
  //float c = drawCircle(light2X, light2Y, lightBoard2Width, lightBoard2Height);
  
  //amberOn(light2X, light2Y, c);
  //greenOn(light2X, light2Y, c);
  //redOn(light2X, light2Y, c);
    
    
    
 //if(start < 5){
 //   greenOn(d);
 // } 
 // if(start >= 5  && start < 7){
 //   amberOn(d);
 //  }
 // if( start >= 7 && start < 10 ){
 //   redOn(light1X, light2X, d);
 // }
  
 // start++;
  
  
  
  //if(start == 9 ){
  //  start = 0;
  //}
  
 
}// DRAW

void redOn(float x, float y, float dynamic_diam ){
  fill(RED);
  ellipse(x, y - dynamic_diam , dynamic_diam, dynamic_diam);
}

void amberOn(float x, float y,float dynamic_diam){
  fill(AMBER);
  ellipse( x, y, dynamic_diam, dynamic_diam);
}

void greenOn(float x, float y, float dynamic_diam){
  fill(GREEN);
  ellipse(x ,y  + dynamic_diam , dynamic_diam, dynamic_diam);
}

//test

float drawCircle(float k, float g, float boxWidth, float boxHeight) { 
  float circle_Diam = (boxHeight/boxWidth) * 20;
  float circle_Distance = (boxHeight/boxWidth) * 20;
  
  fill(BG_COLOR);
  ellipse(k, g, circle_Diam, circle_Diam); //amber
  ellipse(k, g + circle_Distance, circle_Diam, circle_Diam); //green
  ellipse(k, g - circle_Distance, circle_Diam, circle_Diam); //red
  
  return circle_Diam;
}

void lightBoard(float x, float y, float quadWidth, float quadHeight){
 
  float aX = x - quadWidth/2;
  float aY = y - quadHeight/2;
  
  float bX = x + quadWidth/2;//
  float bY = aY;
  
  float cX = bX;
  float cY = y + quadHeight/2;
   
  float dX = aX;
  float dY = cY;
  
  float distance = 20;
  
  fill(BG_COLOR);
  quad(aX, aY, bX, bY, cX, cY, dX, dY);

  quad(aX + distance, aY + distance,
  bX - distance, bY+ distance, 
  cX - distance, cY - distance, 
  dX + distance, dY - distance);
}

void drawRoad(){
  
  fill(BG_COLOR);
  rect(0, 0, width/2 -150, height/2-80);
  rect(0, rectY, width/2 -150, height/2+80);
  rect(rectX, 0, width/2 +50, height/2-80);
  rect(rectX, rectY, width/2 -100, height/2+80);
}

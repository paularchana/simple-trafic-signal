
float light1X;
float light1Y;

float light2X;
float light2Y;

float lightBoard1Width;
float lightBoard1Height;

float lightBoard2Width;
float lightBoard2Height;

float green1, red1, amber, green2, red2;

final color WHITE = color(255, 255, 255);
final color BG_COLOR = WHITE;
final color RED=color(255, 0, 0);
final color AMBER= color(255, 194, 0);
final color GREEN = color(0, 220, 0);
float rectX = 550; 
float rectY = 500;
int currentTime;

void setup(){
 size(800, 800);
 green1 = 10;
 red1 = 6;
 
 amber = 2;
 
 red2 = green1;
 green2 = red1;
 
 
 
 light1X= width/2;
 light1Y= height/4.5;
 
 light2X= width/2 + 200;
 light2Y= (height/4.5) + 225;
 
 lightBoard1Width = 100;
 lightBoard1Height = 250;
 
 lightBoard2Width = 100;
 lightBoard2Height = 150;
 currentTime = 0;
// greenDuration = 10;
  
    
}


void draw(){
    

  frameRate(1);
  background(BG_COLOR);
  
  
  drawRoad();
  textSize(50);
  fill(0);
  int remainingTime = (int)(green1 - currentTime);
  println(remainingTime);
  int remainingTime1 = (int)(currentTime - green1+amber);
  int remainingTime2 = (int)(currentTime - green1 + amber+red1);
 
  

  
  lightBoard(light1X, light1Y, lightBoard1Width, lightBoard1Height);
  float d = drawCircle(light1X, light1Y, lightBoard1Width, lightBoard1Height);
 
  if(currentTime < green1){
    greenOn(light1X, light1Y, d);
    text("Signal Changes in " + remainingTime, 100, 600);
  }
  
  if(currentTime >= green1 && currentTime < green1+amber ){
    amberOn(light1X, light1Y, d);
    text("Signal Changes in " + remainingTime1, 100, 600);
  }
  
  if(currentTime >= green1 + amber && currentTime < green1 + amber+red1){
     redOn(light1X, light1Y, d);
      text("Signal Changes in " + remainingTime2, 100, 600);
  }
  
 
  lightBoard(light2X, light2Y, lightBoard2Width, lightBoard2Height);
  float c = drawCircle(light2X, light2Y, lightBoard2Width, lightBoard2Height);
  
  if(currentTime < red2 + amber ){
     redOn(light2X, light2Y, c);
  }
  
  if(currentTime >= red2+amber && currentTime < red2 + green2){
     greenOn(light2X, light2Y, c);
  }
  
  if(currentTime >= red2 + green2 && currentTime < red2+ green2+amber ){
    amberOn(light2X, light2Y, c);
  }
  
  
  
 
  if(currentTime == 17){
    currentTime = 0;
  }
   currentTime ++;
   
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

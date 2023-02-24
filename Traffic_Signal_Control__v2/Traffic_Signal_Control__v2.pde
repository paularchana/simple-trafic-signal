
float light1X;
float light1Y;

float light2X;
float light2Y;

float lightBoard1Width;
float lightBoard1Height;

float lightBoard2Width;
float lightBoard2Height;

final color BG_COLOR = color(255, 255, 255);
final color RED=color(255, 0, 0);
final color AMBER= color(255, 194, 0);
final color GREEN = color(0, 220, 0);
float rectX = 550; 
float rectY = 500;
int likha;


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
  likha = 0 ;
  
  drawRoad();
}


void draw(){
  //frameRate(1);
  //background(BG_COLOR);
  //textSize(50);
  //fill(0);
  //text(likha, 100, 100);
  ////println(0);
   
  
  

  lightBoard(light1X, light1Y, lightBoard1Width, lightBoard1Height);
  float d = drawCircle(light1X, light1Y, lightBoard1Width, lightBoard1Height);
 
  amberOn(d);
  greenOn(d);
  redOn(d);
  
  //lightBoard(light2X, light2Y, light2Width, light2Height);
  //drawCircle(light2X, light2Y, light2Width, light2Height);
  
  
 
}// DRAW
void redOn(float dynamic_diam){
  fill(RED);
  ellipse(light1X, light1Y - dynamic_diam , dynamic_diam, dynamic_diam);
}


void amberOn(float dynamic_diam){
  fill(AMBER);
  ellipse(light1X, light1Y , dynamic_diam, dynamic_diam);
}

void greenOn(float dynamic_diam){
  fill(GREEN);
  ellipse(light1X, light1Y + dynamic_diam , dynamic_diam, dynamic_diam);
}




float drawCircle(float k, float g, float boxWidth, float boxHeight) { 
  float circle_Diam = (boxHeight/boxWidth) * 20;
  float circle_Distance = (boxHeight/boxWidth) * 20;
  

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
  rect(0, 0, width/2 -150, height/2-80);
  rect(0, rectY, width/2 -150, height/2+80);
  rect(rectX, 0, width/2 +50, height/2-80);
  rect(rectX, rectY, width/2 -100, height/2+80);
}

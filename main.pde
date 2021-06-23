/*Author: Chilareix Shepherd (Daniel J. Bahn.)
 *LAST CHANGE: CLOCK GOES IN A CIRCLE LIKE AN OLD CLOCK
 *CHANGE DATE: APR 11, 2019 @6:13PM (MST)
 */
PVector pos=new PVector(0,0);
HashMap<String,PVector> h = new HashMap<String,PVector>();
Number[] num=new Number[6];
Colon [] cl =new Colon [2];
int mysec;
void setup() {
  size(1800, 1050);
  frameRate(60);
  
}
void draw() {
  background(0);
  translate(width/2, height/2);
  //determines a location on the circle relative to the current second
  h.put("h",new PVector(125*cos((TWO_PI/24*hour())-HALF_PI), 125*sin((TWO_PI/24*hour())-HALF_PI)));
  h.put("m",new PVector(220*cos((TWO_PI/60*minute())-HALF_PI), 220*sin((TWO_PI/60*minute())-HALF_PI)));
  h.put("s",new PVector(240*cos((TWO_PI/60*second())-HALF_PI), 240*sin((TWO_PI/60*second())-HALF_PI)));
  
  push();
  stroke(255);
  strokeWeight(4);
  line(0,0,h.get("h").x,h.get("h").y);
  strokeWeight(2);
  line(0,0,h.get("m").x,h.get("m").y);
  strokeWeight(1);
  line(0,0,h.get("s").x,h.get("s").y);
  pop();
  
  pos.x=250*cos((TWO_PI/60*second())-HALF_PI);
  pos.y=250*sin((TWO_PI/60*second())-HALF_PI);
  
  num[0]=new Number((int)pos.x    , (int)pos.y   , 10);
  num[1]=new Number((int)pos.x+60 , (int)pos.y   , 10);
  cl [0]=new Colon ((int)pos.x+130, (int)pos.y+25, 20);
  num[2]=new Number((int)pos.x+160, (int)pos.y   , 10);
  num[3]=new Number((int)pos.x+220, (int)pos.y   , 10);
  cl [1]=new Colon ((int)pos.x+290, (int)pos.y+25, 20);
  num[4]=new Number((int)pos.x+320, (int)pos.y   , 10);
  num[5]=new Number((int)pos.x+380, (int)pos.y   , 10);
  
  num[0].show(getFirstNumber(hour()));
  num[1].show(getSecondNumber(hour()));
  num[2].show(getFirstNumber(minute()));
  num[3].show(getSecondNumber(minute()));
  num[4].show(getFirstNumber(second()));
  num[5].show(getSecondNumber(second()));
  cl[0].show();
  cl[1].show();
  
  push();
  noFill();
  stroke(hour()*(round(255/24)),minute()*(round(255/60)),second()*(255/60));
  ellipseMode(CENTER);
  circle(0,0, 500);
  pop();
}

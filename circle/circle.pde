float radius = 10;
float centx = 600;
float centy = 500;
float x, y;
float radVariance, thisRadius, rad;

void setup(){
  size(1200, 1000);
  background(0);
  strokeWeight(0.5);
  smooth();

  frameRate(60);
}

void draw(){
  rect(0, 0, 1200, 1000);

  float noiseval = random(10);
  stroke(random(255), random(255), random(255));
  beginShape();
  for(float ang = 0; ang < 1440; ang += 1){
    noiseval += 0.1;
    radVariance = 500 * customNoise(noiseval);
    
    thisRadius = radius + radVariance;
    rad = radians(ang);
    x = centx + (thisRadius * cos(ang));
    y = centy + (thisRadius * sin(ang));
    curveVertex(x, y);
  }
  endShape();
}

float customNoise(float value){
  int count = int((value % 12));
  float retValue = pow(sin(value), count);
  return retValue;
}

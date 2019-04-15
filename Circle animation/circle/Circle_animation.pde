ArrayList<PVector> vec;

float r = 50;
float angle = 0;
float vel = 5;

void setup(){
  size(600, 600);
  vec = new ArrayList<PVector>();

}

void draw(){
  background(0);
  translate(width/2, height/2);
  vec.add(getVec(angle, r));
  fill(255);
  noStroke();
  for(int i = 0; i < vec.size(); i++){
    circle(vec.get(i).x, vec.get(i).y, 10);
  }
  
  if(angle >= 360){
    angle = 0;
    r += 10;
  }else{
     angle += vel;
  }
  
}

PVector getVec(float a, float radius){
  float x = radius * cos(a);
  float y = radius * sin(a);
  PVector v = new PVector(x, y);
  return v;
}

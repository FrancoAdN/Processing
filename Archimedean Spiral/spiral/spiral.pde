ArrayList<PVector> vec;

float r = 0;
float a = 0;
float vel = 1;
int rate = 50;
float max_height;
float cant_lines;
float per_lines;

final color RED = #E51400;
final color ORG = #FF9A00;
final color YLW = #FFFF00;
final color GRN = #85E21F;
final color CYN = #00FFFF;

void setup(){
  //size(600, 600);
  fullScreen();
  vec = new ArrayList<PVector>();
  max_height = height - 200;
 
}

void draw(){
  background(0);
  
  cant_lines = max_height/vel;
  per_lines = cant_lines / 5;
  
  translate(width/2, height/2);
  frameRate(rate);
  
  if(r < max_height){
    vec.add(getVector(a, r));
    a += vel;
    r += vel;
  }else{
    vec = new ArrayList<PVector>();
    r = 0;
    a = 0;
    vel++;
    rate -= 1.2;
  }
  
  for(int i = 0; i < vec.size() - 1; i++){
    if(i < per_lines)
            stroke(RED);
        else if(i > per_lines && i < per_lines * 2)
            stroke(ORG);
        else if(i > per_lines * 2 && i < per_lines * 3)
            stroke(YLW);
        else if(i > per_lines * 3 && i < per_lines * 4)
            stroke(GRN);
        else if(i > per_lines * 4)
            stroke(CYN);
    point(vec.get(i).x, vec.get(i).y);
    line(vec.get(i).x, vec.get(i).y, vec.get(i+1).x, vec.get(i+1).y);
  } 
  
}

PVector getVector(float angle, float radius){
  float x = radius * cos(angle);
  float y = radius * sin(angle);
  PVector v = new PVector(x, y);
  return v;
}

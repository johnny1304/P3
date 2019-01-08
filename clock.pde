import java.util.Collections;

float angle=0;
ArrayList<PVector> path1;
ArrayList<PVector> path2;
int limit;

void setup(){
  size(800,800);
  background(0);
  path1=new ArrayList<PVector>();
  path2=new ArrayList<PVector>();
}

void draw(){
  background(0);
  float r=(width-10)/2;
  float x=r*cos(angle)-HALF_PI;
  float y=r*sin(angle)-HALF_PI;
  limit=0;
  stroke(255);
  strokeWeight(8);
  line(r+x,r+y,r,r);
  path1.add(new PVector(r+x,r+y));
  path2.add(new PVector(r+x*0.9,r+y*0.9));
  //point(r+x,r+y);
  beginShape();
  ArrayList<Integer> lst=new ArrayList<Integer>();
  lst.add(path1.size());
    for(PVector v : path1){
      point(v.x,v.y);
    }
    for(PVector v : path2){
      point(v.x,v.y);
    }
    //max size is 629
    //divide this by to get the proportion of teh vector to draw
  endShape();
  limit+=1;
  angle+=0.01;
  if (angle>TWO_PI){
    angle=0;
    System.out.println(Collections.max(lst));
    path1.clear();
  }
}

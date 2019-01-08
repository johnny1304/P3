float angle=0;
int w=80;
int cols;
int rows;
Curves[][] curves;

void setup() {
  size(500,500,P3D);
  cols=width/w;
  rows=height/2;
  curves= new Curves[cols][rows];
  for(int j=0;j<cols;j++){
    for(int i=0;i<rows;i++){
      curves[j][i]=new Curves();
    }
  }
}

void draw(){
  background(0);
  
  for (int i=1;i<cols;i++){
    float tx=i*w+w/2;
    float ty=w/2;
    float lx=w/2;
    float ly=i*w+w/2;
    int size=w-5;
    float r=size/2;
    stroke(255);
    strokeWeight(1);
    noFill();
    ellipse(tx,ty,size,size);
    ellipse(lx,ly,size,size);
    float x=r*cos(angle*(i+1)-HALF_PI);
    float y=r*sin(angle*(i+1)-HALF_PI);
    strokeWeight(8);
    point(tx+x,ty+y);
    point(lx+x,ly+y);
    strokeWeight(1);
    line(tx+x,0,tx+x,height);
    line(0,ly+y,width,ly+y);  
    for(int j=0; j<rows;j++){
      curves[i][j].setX(tx+x);
    }
    for(int j=0; j<cols;j++){
      curves[j][i].setY(ly+y);
    }
    
  }
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      curves[i][j].addPoint();
      curves[i][j].show();
      
    }
  }
  angle-=0.01;
  
  if (angle < -TWO_PI) {
    for (int j = 0; j < rows; j++) {
      for (int i = 0; i < cols; i++) {
        curves[j][i].reset();
      }
    }
   
    angle = 0;
  }
  
}

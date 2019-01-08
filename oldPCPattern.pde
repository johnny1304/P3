int x=0;
int y=0;
int size=20;
void setup(){
  size(1000,1000);
  background(0);
}

void draw(){
  stroke(255);
  if (random(1)<0.5){
    line(x,y,x+size,y+size);
  }else{
    line(x,y+size,x+size,y);
  }
  
  x+=size;
  if(x>width && y<height){
    x=0;
    y+=size;
  }
}

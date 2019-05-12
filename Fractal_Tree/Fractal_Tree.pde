float Angle = 45;
float Ratio = 0.67;


void setup(){
  size(800,800);
}

void draw(){
  background(51);
  stroke(255);
  translate(width/2, height);
  Branch(200);
}

void Branch(float Length) {
  line(0,0,0,-Length);
  translate(0,-Length);
  if (Length > 3) {
    pushMatrix();
    rotate(Angle);
    Branch(Length*Ratio);
    popMatrix();
    pushMatrix();
    rotate(-Angle);
    Branch(Length*Ratio);
    popMatrix();
  }
}

 void mouseWheel(MouseEvent event){
   Angle += event.getCount()/10.0;
 }

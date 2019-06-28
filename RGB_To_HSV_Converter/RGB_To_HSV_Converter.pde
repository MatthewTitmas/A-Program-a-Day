InputBox[] Boxes;

float Red = 0;
float Blue = 0;
float Green = 0;
color ChosenColour;
color HSVColour;

void setup() {
  Boxes = new InputBox[3];
  Boxes[0] = new InputBox(100, 380, 200, 50, 127);
  Boxes[1] = new InputBox(100, 450, 200, 50, 127);
  Boxes[2] = new InputBox(100, 520, 200, 50, 127);
  size(800, 600);
  Red = Boxes[0].Value;
  Green = Boxes[1].Value;
  Blue = Boxes[2].Value;
  HSVColour = color(127, 127, 127);
}

void draw() {
  Red = Boxes[0].Value;
  Green = Boxes[1].Value;
  Blue = Boxes[2].Value;
  ChosenColour = color(Red, Green, Blue);
  background(#E8E8E8);
  for (InputBox Current : Boxes) {
    Current.Update();
    Current.Show();
  }
  noStroke();
  fill(ChosenColour);
  ellipse(200, 200, 300, 300);
  fill(HSVColour);
  ellipse(600, 200, 300, 300);
  noStroke();
  textAlign(CENTER, CENTER);
  fill(255);
  rect(width/2-125, 20, 250, 50);
  fill(0);
  text("CONVERT", width/2, 40);
}

void mousePressed() {
  for (InputBox Current : Boxes) {
    if (mouseX > Current.Position.x && mouseX < Current.Position.x+Current.Width && mouseY > Current.Position.y && mouseY < Current.Position.y+Current.Height) {
      for (InputBox CurrentTwo : Boxes) {
        CurrentTwo.Selected = false;
      }
      Current.Selected = !Current.Selected;
    }
  }
  if (mouseX > width/2-125 && mouseX < width/2+125 && mouseY > 20 && mouseY < 70) {
    ConvertToHSV();
  }
}

void keyPressed() {
  if (key < 58 && key > 47) {
    int variable = key-48;
    for (InputBox Current : Boxes) {
      if (Current.Selected) {
        Current.Value = Current.Value*10 + (key-48);
      }
    }
  } else if (keyCode == BACKSPACE) {
    for (InputBox Current : Boxes) {
      if (Current.Selected) {
        Current.Value = floor(Current.Value/10);
      }
    }
  }
}

void ConvertToHSV() {
  float Hue;
  float Saturation;
  float Value;
  
  
  float RedValue = Red/255;
  float GreenValue = Green/255;
  float BlueValue = Blue/255;
  float CMax = max(RedValue,GreenValue,BlueValue);
  float CMin = min(RedValue,GreenValue,BlueValue);
  float Delta = CMax - CMin;
  // Hue Calculation
  if (Delta == 0) {
    Hue = 0;
  } else {
    if (CMax == RedValue) {
      Hue = 60*(((GreenValue-BlueValue)/Delta)%6);
    } else if (CMax == GreenValue) {
      Hue = 60*((BlueValue-RedValue)/Delta + 2);
    } else {
      Hue = 60*((RedValue-GreenValue)/Delta+4);
    }
  }
  
  //Saturation Calculation
  if (CMax == 0) {
    Saturation = 0;
  } else {
    Saturation = Delta/CMax;
  } 
  
  Saturation *= 100;
  Value = CMax*100;
  
  println(Hue, Saturation, Value);
  HSVColour = ChosenColour;
  
  
}

Button[] Buttons;
Light[] Lights;
Screen Display;
String WantedString = "12345";

void setup() {
  size(600, 800);
  Display = new Screen(50, 50, 500, 100);
  Buttons = new Button[12];
  for (int i = 0; i < 10; i++) {
    Buttons[i] = new Button(50+(i%3*150), 250+floor(i/3)*130, 100, (i+1));
  }
  Buttons[9] = new Button(200, 640, 100, 0);
  Buttons[10] = new Button(50, 640, 100, -1);
  Buttons[11] = new Button(350, 640, 100, -2);

  Lights = new Light[3];
  for (int i = 0; i < 3; i++) {
    Lights[i] = new Light(525, 300+i*130, 10);
  }
}

void draw() {
  background(127);
  Display.Show();
  for (int i = 0; i < 12; i++) {
    Buttons[i].Show();
  }
  for (int i = 0; i < 3; i++) {
    Lights[i].Show();
  }
  if (Display.Value.length() == 8) {
    print("Check");
  }
}

void mousePressed() {
  for (int i = 0; i < 12; i++) {
    if (Buttons[i].Intersect(mouseX, mouseY)) {
      Buttons[i].Selected = true;
      break;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < 12; i++) {
    if (Buttons[i].Selected) {
      Buttons[i].Selected = false;
      if (Display.Value.length() < 8) {
        if (Buttons[i].Value != -1 && Buttons[i].Value != -2) {
          if (Display.Value.length() != 8) {
            Display.Value += str(Buttons[i].Value);
          }
        } else if (Buttons[i].Value == -1) {
          if (Display.Value.length() > 0) {
            Display.Value = Display.Value.substring(0, Display.Value.length()-1);
          }
        } else {
          CheckCode();
        }
      }
    }
  }
}

void CheckCode() {
  if (Display.Value.equals(WantedString)) {
    for (int i = 0; i < 3; i++) {
      Lights[i].Correct = "True";
    }
  } else {
    for (int i = 0; i < 3; i++) {
      if (Lights[i].Correct != "False") {
        Lights[i].Correct = "False";
        Display.Value = "";
        break;
      }
    }
  }
}

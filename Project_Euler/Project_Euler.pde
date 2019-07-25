Selector Projects;
boolean Sliding;
PImage Image;
PImage Answer;

void setup() {
  size(1200, 800);
  Projects = new Selector(0, 0, width/3, 75);
  String[] lines = loadStrings("Project Euler Text.txt");
  for (int i = 0; i < lines.length; i++) {
    Projects.AddBar(lines[i]);
  }
  Image = createImage(0, 0, RGB);
  Answer = createImage(0, 0, RGB);
}

void draw() {
  background(255);
  line(width/3, 0, width/3, height);
  Projects.Show();
  image(Image, 500, 100);
  image(Answer, width-Answer.width-50, 50);
}

void mouseReleased() {
  Sliding = false;
}

void mouseDragged() {
  if (Sliding) {
    if (mouseY - Projects.Slide.RectHeight/2 >= 0 && mouseY + Projects.Slide.RectHeight/2 <= height) {
      Projects.Slide.RectPosition.y = mouseY - Projects.Slide.RectHeight/2;
    }
  }
}

void mousePressed() {
  if (Projects.Slide.Intersects(mouseX, mouseY)) {
    Sliding = true;
  }
  if (Projects.Intersects(mouseX, mouseY)) {
    for (Bar Current : Projects.Bars) {
      if (Current.Selected) {
        Image = loadImage("Solutions/Solution"+Current.ID+".png");
        Answer = loadImage("Answers/Answer"+Current.ID+".png");
      }
    }
  }
}

void mouseWheel(MouseEvent Event) {
  int e = Event.getCount();
  if (e == 1) {
    if (Projects.Slide.RectPosition.y + Projects.Slide.RectHeight < height) {
      Projects.Slide.RectPosition.y += e*10;
    }
  } else {
    if (!(Projects.Slide.RectPosition.y < 0)) {
      Projects.Slide.RectPosition.y += e*10;
    }
  }
}

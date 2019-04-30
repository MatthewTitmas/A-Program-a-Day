int Rows = 22;
int Cols = 16;
color[][] Board = new color[Rows][Cols];
color[][] BackupBoard = new color[Rows][Cols];
boolean Editing = false;
int CurrentStruct = 1000;
String CurrentString = "Wall";
Player PlayerOne = new Player();

void setup() {
  background(#AAA5FF);
  size(880,740);
  int Count = 0;
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Cols; j++) {
      if ((j+Count) % 2 == 0) {
        Board[i][j] = #F7F7FF;
        BackupBoard[i][j] = #F7F7FF;
      } else {
        Board[i][j] = #E6E6FF;
        BackupBoard[i][j] = #E6E6FF;
      }
    }
    Count += 1;
  }
}

void draw() {
  fill(0);
  rect(0,0,width,50);
  rect(0,height-50,width,height);
  for (int i = 0; i < Rows; i++) {
    for (int j = 0; j < Cols; j++) {
      stroke(Board[i][j]);
      fill(Board[i][j]);
      rect(i*40,50+j*40,40,40);
    }
  }
  stroke(0);
  strokeWeight(5);
  fill(255,0,0);
  rect(PlayerOne.Position.x,PlayerOne.Position.y,25,25);
  PlayerOne.Move(Board);
  fill(255);
  rect(10,height-40,70,30);
  fill(255,0,0);
  textSize(25);
  textAlign(CENTER);
  text("Edit",10,height-40,70,30);
  if (Editing == true) {
    textAlign(LEFT);
    textSize(40);
    fill(255,0,0);
    text(("Click type: "+CurrentString),10,100);  
  } else {
    PlayerOne.CheckCollision(Board);
  }
}

void mousePressed() {
  if (mouseX >= 10 && mouseX <= 80 && 
      mouseY >= height-40 && mouseY <= height-10) {
       Editing = !Editing;
  } else if (Editing == true) {
    int XPos = int(mouseX/40);
    int YPos = int(mouseY/40) - 1;
    switch (CurrentString) {
      case "Starting area":
        Board[XPos][YPos] = #B5FEB4;
        break;
      case "Board":
        Board[XPos][YPos] = BackupBoard[XPos][YPos];
        break;
      case "Goal position":
        Board[XPos][YPos] = #B5FEB5;
        break;
      case "Wall":
        Board[XPos][YPos] = #B4B5FE;
        break;
      case "Player position":
        PlayerOne.Position.x = XPos*40 +5;
        PlayerOne.Position.y = (YPos+1)*40 + 15;
        PlayerOne.StartPos = new PVector((XPos*40+5),(YPos+1)*40+15);
    }
  }
  
}

void mouseWheel(MouseEvent event) {
  if (Editing) {
    CurrentStruct += event.getCount();
    switch(CurrentStruct % 6) {
    case 0:
      CurrentString = "Board";
      break;
    case 1:
      CurrentString = "Dot";
      break;
    case 2:
      CurrentString = "Starting area";
      break;
    case 3:
      CurrentString = "Goal position";
      break;
    case 4:
      CurrentString = "Player position";
      break;
    case 5:
      CurrentString = "Wall";
      break;
    }
  }
}

void keyPressed() {
  if (!Editing) {
    PlayerOne.Update(keyCode);
  }
}

void keyReleased() {
  if (keyCode == 87 || keyCode == 83) {
    PlayerOne.YChange = 0;
  } else if (keyCode == 65 || keyCode == 68) {
    PlayerOne.XChange = 0;
  }
}

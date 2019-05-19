class Cell {
  int Value;
  PVector Position;
  color Colour;
  boolean JustCombined = false;
  
  Cell(float X, float Y) {
    Position = new PVector(X*Spacing,Y*Spacing);
  }
  
  void Show() {
    strokeWeight(15);
    stroke(#BBADA0);
    fill(#CDC1B4);
    rect(Position.x,Position.y,Spacing,Spacing);
    if (Value != 0) {
      noStroke();
      fill(Colour);
      rect(Position.x+7.5,Position.y+7.5,Spacing-15,Spacing-15);
      fill(#776E65);
      textSize(64);
      textAlign(CENTER, CENTER);
      text(Value,Position.x+Spacing/2+3,Position.y+Spacing/2-10);
    }
  }
  
  void Update() {
    if (Value == 2) {
      Colour = color(#EEE4DA);
    } else if (Value == 4) {
      Colour = color(#EDE0C8);
    } else if (Value == 8) {
      Colour = color(#F2B179);
    } else if (Value == 16) {
      Colour = color(#F59563);
    } else if (Value == 32) {
      Colour = color(#F67C5F);
    } else if (Value == 64) {
      Colour = color(#F65E3B);
    } else if (Value == 128) {
      Colour = color(#EDCF72);
    } else if (Value == 256) {
      Colour = color(#EDCC61);
    }
  }
  
  void MoveLeft(Cell[][] Cells, int i, int j) {
    boolean Combining = false;
    int Position = -1;
    int Count = i-1;
    while (Count >= 0) {
      if (Cells[Count][j].Value != 0) {
        if (Cells[Count][j].Value == Value) {
          Combining = true;
        }
        Position = Count+1;
        break;
      }
      Count -= 1;
    }
    if (Position != -1) {
      int Temp = Value;
      Value = 0;
      if (Combining && Cells[Position-1][j].JustCombined == false) {
        Temp *= 2;
        Cells[Position-1][j].Value = Temp;
        Cells[Position-1][j].JustCombined = true;;
      } else {
        Cells[Position][j].Value = Temp;
      }
    } else {
      Count += 1;
      int Temp = Value;
      Value = 0;
      Cells[Count][j].Value = Temp;
    }
  }
  
  void MoveRight(Cell[][] Cells, int i, int j) {
    boolean Combining = false;
    int Position = -1;
    int Count = i+1;
    while (Count <= 3) {
      if (Cells[Count][j].Value != 0) {
        if (Cells[Count][j].Value == Value) {
          Combining = true;
        }
        Position = Count-1;
        break;
      }
      Count += 1;
    }
    if (Position != -1) {
      int Temp = Value;
      Value = 0;
      if (Combining && Cells[Position+1][j].JustCombined == false) {
        Temp *= 2;
        Cells[Position+1][j].Value = Temp;
        Cells[Position+1][j].JustCombined = true;
      } else {
        Cells[Position][j].Value = Temp;
      }
    } else {
      Count -= 1;
      int Temp = Value;
      Value = 0;
      Cells[Count][j].Value = Temp;
    }
  }
  
  void MoveUp(Cell[][] Cells, int i, int j) {
    boolean Combining = false;
    int Position = -1;
    int Count = j-1;
    while (Count >= 0) {
      if (Cells[i][Count].Value != 0) {
        if (Cells[i][Count].Value == Value) {
          Combining = true;
        }
        Position = Count+1;
        break;
      }
      Count -= 1;
    }
    if (Position != -1) {
      int Temp = Value;
      Value = 0;
      if (Combining && Cells[i][Position-1].JustCombined == false) {
        Temp *= 2;
        Cells[i][Position-1].Value = Temp;
        Cells[i][Position-1].JustCombined = true;;
      } else {
        Cells[i][Position].Value = Temp;
      }
    } else {
      Count += 1;
      int Temp = Value;
      Value = 0;
      Cells[i][Count].Value = Temp;
    }
  }
    
  void MoveDown(Cell[][] Cells, int i, int j) {
    boolean Combining = false;
    int Position = -1;
    int Count = j+1;
    while (Count <= 3) {
      if (Cells[i][Count].Value != 0) {
        if (Cells[i][Count].Value == Value) {
          Combining = true;
        }
        Position = Count-1;
        break;
      }
      Count += 1;
    }
    if (Position != -1) {
      int Temp = Value;
      Value = 0;
      if (Combining && Cells[i][Position+1].JustCombined == false) {
        Temp *= 2;
        Cells[i][Position+1].Value = Temp;
        Cells[i][Position+1].JustCombined = true;
      } else {
        Cells[i][Position].Value = Temp;
      }
    } else {
      Count -= 1;
      int Temp = Value;
      Value = 0;
      Cells[i][Count].Value = Temp;
    }
  }
}

ArrayList<Cell> Cells;
ArrayList<Cell> Copy;
boolean BlockSelected = false;
boolean Complete;
int Rows = 10;
float Spacing;
int CurrentSector;
Sector[] Sectors;
Block CurrentBlock = new Block();

void setup() {
  Cells = new ArrayList<Cell>();
  Copy = new ArrayList<Cell>();
  Sectors = new Sector[3];
  size(1205, 760);
  Spacing = 800/Rows;
  for (int i = 0; i < Rows; i += 1) {
    for (int j = 0; j < Rows; j += 1) {
      Cells.add(new Cell(i, j, Spacing, Spacing));
    }
  }
  for (int i = 0; i < 3; i++) {
    Sectors[i] = new Sector(760, i*250, 445, 260);
  }
  Copy = Cells;
}


void draw() {
  rectMode(CORNER);
  background(#E2CAA4);
  for (Cell Current : Cells) {  
    Current.Show();
  }
  for (int i = 0; i < 3; i++) {
    Sectors[i].Show();
    if (Sectors[i].BlockInSector == false) {
      Sectors[i].GiveBlock();
    }
  }
  if (BlockSelected) {
    rectMode(CENTER);
    switch(CurrentBlock.Type) {
    case 0:
      rect(mouseX, mouseY, 60, 60, 10);
      rect(mouseX+75, mouseY, 60, 60, 10);
      rect(mouseX+150, mouseY, 60, 60, 10);
      rect(mouseX+225, mouseY, 60, 60, 10);
      break;
    case 1:
      rect(mouseX, mouseY, 60, 60, 10);
      rect(mouseX, mouseY+75, 60, 60, 10);
      rect(mouseX, mouseY+150, 60, 60, 10);
      rect(mouseX, mouseY+225, 60, 60, 10);
      break;
    }
  }

  for (int i = 0; i < 10; i++) {
    Complete = true;
    for (int j = 0; j < 10; j++) {
      Cell Current = Copy.get(i+j*10);
      if (Current.Colour != #FF0000) {
        Complete = false;
      }
    }
    if (Complete) {
       for (int j = 0; j < 10; j++) {
         Cell Current = Cells.get(i+j*10);  
         Current.Colour = #FFFAF4;
       }
    }
  }
  
  for (int i = 0; i < 10; i++) {
    Complete = true;
    for (int j = 0; j < 10; j++) {
      Cell Current = Copy.get(i*10+j);
      if (Current.Colour != #FF0000) {
        Complete = false;
      }
    }
    if (Complete) {
       for (int j = 0; j < 10; j++) {
         Cell Current = Cells.get(i*10+j);
         Current.Colour = #FFFAF4;
       }
    }
  }
  Copy = Cells;
}



void mousePressed() {
  boolean Placed = true;
  if (mouseX < 850) {
    for (int i = 0; i < Cells.size(); i++) {
      Cell Current = Cells.get(i);
      if (Current.CheckIntersection(mouseX, mouseY) && BlockSelected) {      
        switch (CurrentBlock.Type) {
        case 0:
          if (i < 70) {
            for (int j = 0; j < 4; j++) {
              Cell Current2 = Cells.get(i+j*10);
              if (Current2.Colour == #FF0000) {
                for (int k = 0; k < j; k++) {
                  Cell Current3 = Cells.get(i+k*10); 
                  Current3.Colour = #FFFAF4;
                }
                Placed = false;
                break;
              }
              Current2.Colour = #FF0000;
            }
          } else {
            Placed = false;
          }
          break;
        case 1:
          if (i % 10 < 7) {
            for (int j = 0; j < 4; j++) {
              Cell Current2 = Cells.get(i+j);
              if (Current2.Colour == #FF0000) {
                for (int k = 0; k < j; k++) {
                  Cell Current3 = Cells.get(i+k); 
                  Current3.Colour = #FFFAF4;
                }
                Placed = false;
                break;
              }
              Current2.Colour = #FF0000;
            }
          } else {
            Placed = false;
          }
          break;
        }
        if (Placed == true) {
          Sectors[CurrentSector].BlockInSector = false;
          BlockSelected = false;
        }
      }
    }
  } else if (!(BlockSelected)) {
    if (mouseY < 250) {
      CurrentSector = 0;
    } else if (mouseY < 500) {
      CurrentSector = 1;
    } else {
      CurrentSector = 2;
    }
    CurrentBlock.Type = Sectors[CurrentSector].BlockType;
    BlockSelected = true;
  }
}

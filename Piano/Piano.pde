import ddf.minim.*;
Minim NotePlayer;
AudioPlayer[] Sounds;
Key[] Keys;


void setup() {
  size(700, 400);
  NotePlayer = new Minim(this);
  Sounds = new AudioPlayer[12];
  Keys = new Key[12];
  SetUpSounds();
  SetUpKeys();
}

void draw() {
  for (int i = 0; i < Keys.length; i++) {
    Keys[i].Show();
  }
}


void SetUpKeys() {
  Keys[0] = new WhiteKey(0, 0, 100, height, Sounds[0]);
  Keys[1] = new WhiteKey(100, 0, 100, height, Sounds[1]);
  Keys[2] = new WhiteKey(200, 0, 100, height, Sounds[2]);
  Keys[3] = new WhiteKey(300, 0, 100, height, Sounds[3]);
  Keys[4] = new WhiteKey(400, 0, 100, height, Sounds[4]);
  Keys[5] = new WhiteKey(500, 0, 100, height, Sounds[5]);
  Keys[6] = new WhiteKey(600, 0, 100, height, Sounds[6]);
  Keys[7] = new BlackKey(75, 0, 50, 250, Sounds[7]);
  Keys[8] = new BlackKey(175, 0, 50, 250, Sounds[8]);
  Keys[9] = new BlackKey(375, 0, 50, 250, Sounds[9]);
  Keys[10] = new BlackKey(475, 0, 50, 250, Sounds[10]);
  Keys[11] = new BlackKey(575, 0, 50, 250, Sounds[11]);
}

void SetUpSounds() {
  Sounds[0] = NotePlayer.loadFile("C.mp3");
  Sounds[1] = NotePlayer.loadFile("D.mp3");
  Sounds[2] = NotePlayer.loadFile("E.mp3");
  Sounds[3] = NotePlayer.loadFile("F.mp3");
  Sounds[4] = NotePlayer.loadFile("G.mp3");
  Sounds[5] = NotePlayer.loadFile("A.mp3");
  Sounds[6] = NotePlayer.loadFile("B.mp3");
  Sounds[7] = NotePlayer.loadFile("C#.mp3");
  Sounds[8] = NotePlayer.loadFile("D#.mp3");
  Sounds[9] = NotePlayer.loadFile("F#.mp3");
  Sounds[10] = NotePlayer.loadFile("G#.mp3");
  Sounds[11] = NotePlayer.loadFile("A#.mp3");
}

void mousePressed() {
  for (int i = Keys.length-1; i >= 0; i--) {
    if (Keys[i].Intersects(mouseX, mouseY)) {
      println(mouseX, mouseY);
      break;
    }
  }
}

//void mouseReleased() {
//  for (int i = 0; i < Sounds.length; i++) {
//    Sounds[i].pause();
//    Sounds[i].rewind();
//  }
//}

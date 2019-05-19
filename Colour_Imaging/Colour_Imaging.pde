PImage Image;
PImage BlackAndWhite;
PImage ToShowBW;
PImage ToShowBrightness;
int Radius = 50;


void setup() {
  size(1024,512);
  Image = loadImage("Image.jpg");
  BlackAndWhite = createImage(512,512,RGB);
  ToShowBW = createImage(512,512,RGB);
  ToShowBrightness = createImage(512,512,RGB);
  loadPixels();
  for (int x = 0; x < Image.width*Image.height; x++) {
    float Red = red(Image.pixels[x])/255;
    float Green = green(Image.pixels[x])/255;
    float Blue = blue(Image.pixels[x])/255;
    float CLinear = 0.2126 * Red + 0.7152 * Green + 0.0722 * Blue;
    float CRSGB;
    if (CLinear <= 0.0031308) {
      CRSGB = 12.92 * CLinear * 255;
    } else {
      CRSGB = (1.055 * pow(CLinear,1/2.4) - 0.055) * 255;
    }
    BlackAndWhite.pixels[x] = color(CRSGB);
    ToShowBW.pixels[x] = color(CRSGB);
  }
}

void draw() {
  noFill();
  image(ToShowBW,0,0);
  image(ToShowBrightness,width/2,0);
  noStroke();
  UpdateBWImage();
  UpdateBrightnessImage();

}


void UpdateBWImage() {
  loadPixels();
  for (int i = 0; i < width/2; i++) {
    for (int j = 0; j < height; j++) {
      if ((i-mouseX)*(i-mouseX) + (j-mouseY) * (j-mouseY) < Radius*Radius) {
        ToShowBW.set(i,j,Image.get(i,j));    
      } else {
        ToShowBW.set(i,j,BlackAndWhite.get(i,j));   
      }
    }
  }
  updatePixels();
}

void UpdateBrightnessImage() {
  for (int i = 512; i < width; i++) {
    for (int j = 0; j < height; j++) {
      if ((i-mouseX)*(i-mouseX) + (j-mouseY) * (j-mouseY) < Radius*Radius) {
        int ToChange = Image.get(i-512,j);
        float Dist = dist(mouseX,mouseY,i,j);
        float Red = red(ToChange);
        float Blue = blue(ToChange);
        float Green = green(ToChange);
        Red += 255*(Radius-Dist)/Radius;
        Red = map(Red,0, 700, 0, 255);
        Green += 255*(Radius-Dist)/Radius;
        Green = map(Green,0, 700, 0, 255);
        Blue += 255*(Radius-Dist)/Radius;
        Blue = map(Blue,0, 700, 0, 255);
        ToShowBrightness.set(i-512,j,color(Red,Green,Blue));
      } else {
        ToShowBrightness.set(i-512,j,color(0,0,0));
      }
    }
  }
}

void mouseWheel(MouseEvent Event) {
  Radius += Event.getCount() * 2;
  
}

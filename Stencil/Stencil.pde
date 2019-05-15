PImage Image;
PImage Stencil;
PImage GrayScale;
int Strength;

void setup() {
  Strength = 10;
  float Red;
  float Green;
  float Blue;
  size(1024,512);
  background(255);
  GrayScale = createImage(512,512,RGB);
  Stencil = createImage(512,512,RGB);
  Image = loadImage("ToStencil.jpg");
  loadPixels();
  color Gray;
  for (int x = 0; x < Image.pixels.length; x++) {
    Red = red(Image.pixels[x])/255;
    Green = green(Image.pixels[x])/255;
    Blue = blue(Image.pixels[x])/255;
    float CLinear = 0.2126*Red + 0.7152*Green + 0.0722*Blue;
    if (CLinear <= 0.0031308) {
      Gray = int(12.92*CLinear*255);
    } else {
      Gray = int((1.055 * pow(CLinear,(1/2.4)))*255);
    }
    GrayScale.pixels[x] = Gray;
  }
  
  for (int x = 0; x < Stencil.pixels.length-1; x++) {
    if (blue(GrayScale.pixels[x]) <= blue(GrayScale.pixels[x+1])+Strength && blue(GrayScale.pixels[x]) >= blue(GrayScale.pixels[x+1])-Strength) {
      Stencil.pixels[x] = color(255);
    } else {
      Stencil.pixels[x] = color(0);
    }

  }
}

void draw() {
  image(Stencil,0,0);
  image(Image,width/2,0);
}

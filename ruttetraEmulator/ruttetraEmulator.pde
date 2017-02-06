//Christian Attard
//2015 @ introwerks 

PImage img;
String name = "maria"; //file name 
String type = "jpg"; //file type
color col;
int c;

int space = 5; // space between lines
float weight = 1; // line weight
float depth = 0.9; // z depth
int zoom = 100; // zoom image

void setup() {
  size(100,100,P3D);
  surface.setResizable(true);
}

void draw() {
  img = loadImage(name + "." + type);
  surface.setSize(img.width,img.height);
  background(0);

  if (frameCount == 1 ) // skip 1st frame as setSize happens NEXT frame ...
    return;
    
  println("christian attard, 2015 @ introwerks");

  for (int i = 0; i < img.width; i+=space) {
    beginShape();
    for (int j = 0; j < img.height; j+=space) {
      c = i+(j*img.width);
      col = img.pixels[c];
      stroke(red(col), green(col), blue(col), 255);
      strokeWeight(weight);
      noFill();
      vertex (i, j, (depth * brightness(col))-zoom);
    }
    endShape();
  }
      
  int count = int(random(666));
  save(name + "_" + count + "." + type);
  println("done");
  exit();

}
PImage myImage;
int halfImage;

void setup() {
  size(356,633);
  myImage = loadImage(""); // <== Insert your images path here
  myImage.loadPixels();
  for (int i = 0; i < width * height; i++) {
    int x = i%width;
    int y = floor(i/width);
    //myImage.pixels[i+halfImage] = myImage.pixels[i];
    float r, g, b, avc;
    r = red(myImage.pixels[i]);
    g = green(myImage.pixels[i]);
    b = blue(myImage.pixels[i]);
    
    avc = (r + g + b);
    
    float randR = 0, randG = 0, randB = 0, randZ, randZZ;
    int randCol1, randCol2;
    boolean limit = false;
    
    while (limit == false){
    randZ = random(avc + 1);
    if (randZ > 255) {        //color cant be greater than 255
      randZ = 255;
    }
    randCol1 = floor(random(1,4));
    //println(randCol1);
    if (randCol1 == 1){
      randR = randZ;
      
    } else if (randCol1 == 2){
      randG = randZ;
    } else {
      randB = randZ;
    }
    
    randZ = avc - randZ;
    randZZ = random(randZ);
    if (randZZ > 255) {         //color cant be greater than 255
      randZZ = 255;
    }
    if (randZ - randZZ < 256){
     limit = true; 
    }
    randCol2 = floor(random(1,3));
    if (randCol2 == 1){
      if (randCol1 == 1){
        randG = randZZ;
        randB = randZ - randZZ;
        
      } else if (randCol1 == 2){
      randR = randZZ;
      randB = randZ - randZZ;
      
      } else {
        randR = randZZ;
        randG = randZ - randZZ;
        
      }
    } else {
      if (randCol1 == 1){
        randB = randZZ;
        randG = randZ - randZZ;
      } else if (randCol1 == 2){
      randB = randZZ;
      randR = randZ - randZZ;
      
      } else {
        randG = randZZ;
        randR = randZ - randZZ;
        
      }
    }
    }
    stroke(randR,randG,randB);
    //stroke(avc/3);
    rect(x,y,1,1);
    }
    //save("BabyGeorgeSecret1.bmp");
    //image(myImage,0,0);
}

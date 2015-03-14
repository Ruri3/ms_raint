// SETUP \\
void setup(){
  size (800, 500);
  background(#FFFFFF);
  frameRate(1080);
}

// FLOAT \\
  float posX;
  float posY;

// INT \\
  int radius = 50;
  //colors
    int col1 = 255;
    int col2 = 0;
    int col3 = 0;
  //stats
    int count = 0;
    int previewX = 20;
    int previewY = 20;

// DRAW \\
void draw(){
  //detect mouse location
  posY = mouseY;
  posX = mouseX;
  
  // prevent color values from going below 255
  if (col1 < 0){
    col1 = 0;}
  if (col2 < 0){
    col2 = 0;}
  if (col3 < 0){
    col3 = 0;}
  if (radius < 0){
    radius = 0;}
  if (count < 0){
    count = 0;}
    
  //prevent color values from going above 255
  if (col1 > 255){
    col1 = 255;}
  if (col2 > 255){
    col2 = 255;}
  if (col3 > 255){
    col3 = 255;}
  
  //bottom right stats
  stroke(3);
  fill (#FFFFFF);
  rect (width - 50, height - 130, width - 700, height - 370);
  fill (#000000);
  text (col1, width - 40, height - 80);
  text (col2, width - 40, height - 65);
  text (col3, width - 40, height - 50);
  text (radius, width - 40, height - 20);
  //color preview
  stroke(3);
  fill (col1, col2, col3);
  ellipse(width - 25, height - 115, previewX, previewY);
  noStroke();
  
//MOUSE ACTIONS\\
  if (mousePressed){
    if (mouseButton == LEFT){ //Left mouse button
      fill (col1, col2, col3);
      ellipse (posX, posY, radius, radius);
      count = count + 1;
    }
    if (mouseButton == RIGHT){ //Right mouse button
      fill (255, 255, 255);
      ellipse (posX, posY, radius, radius);
      count = count -1;}
  } //end of mousePressed
  
// KEYBOARD \\
  if (keyPressed){
  // color
    if (key == 'w' || key == 'W'){ //red up
      col1 = col1 + 1;}
    if (key == 'q' || key == 'Q'){ //red down
      col1 = col1 - 1;}
    if (key == 's' || key == 'S'){ //green up
      col2 = col2 + 1;}
    if (key == 'a' || key == 'A'){ //green down
      col2 = col2 - 1;}
    if (key == 'x' || key == 'X'){ //blue up
      col3 = col3 + 1;}
    if (key == 'z' || key == 'Z'){ //blue down
      col3 = col3 - 1;}
  // size
      if (key == 'e' || key == 'E'){ //brush size up
        radius = radius + 1;}
      if (key == 'd' || key == 'D'){ //brush size down
        radius = radius - 1;}
  //misc
      if (key == 'c' || key == 'C'){ //clear
      background(#FFFFFF);
      count = 0;}
      if (key == 'g' || key == 'G'){ //save
      saveFrame();
      key = 0;}
      if (key == 'h' || key == 'H'){ //key legend
      fill (#818181);
      rect (width - 50, height - 100, width - 100, height - 100);
      fill (255, 0, 0);//red
      text (" Q / W", width - 40, height - 80);
      fill (0, 255, 0);//green
      text (" A / S", width - 40, height - 65);
      fill (0, 0, 255);//blue
      text (" Z / X", width - 40, height - 50);
      fill (#FFFFFF);
      text ( "C", width - 40, height - 20);
      text ( "E / D", width - 40, height - 5);}
  }//end of keyPressed
}//end of draw

int rows = 10;
int cols = 10;
float scale;

Snake snake;

void setup() {
  size(700,700);
  float scaleX = width/rows;
  float scaleY = height/cols;
  scale = min(scaleX,scaleY);
  
//  int startX = floor(cols/2);
//  int startY = floor(rows/2);
  snake = new Snake(cols/2,rows/2);
}

void draw() {
  background(0);
  snake.update();
  drawGrid();
  snake.show();
}

void drawGrid() {
  strokeWeight(5);
  stroke(255);
  noFill();
  for (int i=0;i<cols;i++) {
    for (int j=0;j<rows;j++) {
      rect(i*scale,j*scale,scale,scale);
    }
  }
}

PVector pmouse;

void touchStarted() {
  pmouse = new PVector(mouseX, mouseY);
}

void touchEnded() {
  PVector mouse = new PVector(mouseX, mouseY);
  mouse.sub(pmouse);
  int angle = round(mouse.heading()/HALF_PI);
  switch (angle) {
    case -1:
      snake.xdir = 0;
      snake.ydir = -1;
      break;
    case 0:
      snake.xdir = 1;
      snake.ydir = 0;
      break;
    case 1:
      snake.xdir = 0;
      snake.ydir = 1;
      break;
    case -2:
      snake.xdir = -1;
      snake.ydir = 0;
      break;
  }
}
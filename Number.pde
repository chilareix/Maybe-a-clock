class Number {
  short[] numbers = {0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B};
  PVector[] rectPos =new PVector[7];
  PVector[] rectSize=new PVector[7];
  PVector vertsize;
  PVector horisize;
  PVector pos;

  Number(PVector Pos, int s) {
    this.pos=Pos;
    this.vertsize=new PVector(1, 3);
    this.horisize=new PVector(2, 1);
    this.vertsize.mult(s);
    this.horisize.mult(s);
    for (int i=0; i<rectPos.length; i++) {
      this.rectPos [i]=new PVector(0, 0);
      this.rectSize[i]=new PVector(0, 0);
    }
    //Sets the sizes of the rectangles
    for (int i=0; i<rectSize.length; i++) {
      if (i==0||i==3||i==6) {
        this.rectSize[i]=this.horisize;
      } else {
        this.rectSize[i]=this.vertsize;
      }
    }
    //Sets the position of each rectangle relative to each other (helps make scaling easier)
    this.rectPos [6].x=this.vertsize.x;
    this.rectPos [6].y=0;
    this.rectPos [5].x=this.rectPos[6].x+this.horisize.x;
    this.rectPos [5].y=this.horisize.y;
    this.rectPos [4].x=this.rectPos[5].x;
    this.rectPos [4].y=this.rectPos[5].y+this.vertsize.y+this.horisize.y;
    this.rectPos [3].x=this.vertsize.x;
    this.rectPos [3].y=this.horisize.y*2+this.vertsize.y*2;
    this.rectPos [2].x=0;
    this.rectPos [2].y=this.rectPos[4].y;
    this.rectPos [1].x=0;
    this.rectPos [1].y=this.horisize.y;
    this.rectPos [0].x=this.vertsize.x;
    this.rectPos [0].y=this.horisize.y+this.vertsize.y;

    //Puts all rectangles relative to where you set the position for the number
    for (int i=0; i<rectPos.length; i++) {
      this.rectPos[i].add(Pos);
    }
  }
  Number(float x, float y, int s) {
    this.pos=new PVector(x,y);
    PVector Pos=new PVector(x, y);
    this.vertsize=new PVector(1, 3);
    this.horisize=new PVector(2, 1);
    this.vertsize.mult(s);
    this.horisize.mult(s);
    //Kills the NullPointerException error >:x
    for (int i=0; i<rectPos.length; i++) {
      this.rectPos [i]=new PVector(0, 0);
      this.rectSize[i]=new PVector(0, 0);
    }
    //Sets the sizes of the rectangles
    for (int i=0; i<rectSize.length; i++) {
      if (i==0||i==3||i==6) {
        this.rectSize[i]=this.horisize;
      } else {
        this.rectSize[i]=vertsize;
      }
    }
    //Sets the position of each rectangle relative to each other (helps make scaling easier)
    this.rectPos [6].x=this.vertsize.x;
    this.rectPos [6].y=0;
    this.rectPos [5].x=this.rectPos[6].x+this.horisize.x;
    this.rectPos [5].y=this.horisize.y;
    this.rectPos [4].x=this.rectPos[5].x;
    this.rectPos [4].y=this.rectPos[5].y+this.vertsize.y+this.horisize.y;
    this.rectPos [3].x=this.vertsize.x;
    this.rectPos [3].y=this.horisize.y*2+this.vertsize.y*2;
    this.rectPos [2].x=0;
    this.rectPos [2].y=this.rectPos[4].y;
    this.rectPos [1].x=0;
    this.rectPos [1].y=this.horisize.y;
    this.rectPos [0].x=this.vertsize.x;
    this.rectPos [0].y=this.horisize.y+this.vertsize.y;
    
    //Puts all rectangles relative to where you set the position for the number
    for (int i=0; i<rectPos.length; i++) {
      this.rectPos[i].add(Pos);
    }
  }
  //Draws the rectangles for the number
  void show(int num) {
    push();
    noStroke();
    for (int i=0; i<rectPos.length; i++) {
      //Gets the alpha fill value for each number
      fill(getColor(numbers[num], i));
      //Draws the rectangle
      rect(this.rectPos[i].x, this.rectPos[i].y, this.rectSize[i].x, this.rectSize[i].y,10);
    }
    pop();
  }
  //Gets an alpha value for each rectangle using a hexadecimal
  color getColor(short val, int shift) {
    int a=10+255*(((val>>shift)&1));
    return color(255, 0, 0, a);
  }
  /*Functions for translating the numbers. If you have multiple, you can use a for loop if they're in an array.
   *e.g.
   *for(int i=0;i<numArray.length;i++)numArray[i].trans(distanceVector);
   *OR
   *for(int i=0;i<numArray.length;i++)numArray[i].trans(xdist,ydist);
   */
  void trans(PVector distance){
    for(int i=0;i<rectPos.length;i++)rectPos[i].add(distance);
  }
  void trans(int xdist, int ydist){
    PVector distance = new PVector(xdist,ydist);
    for(int i=0;i<rectPos.length;i++)rectPos[i].add(distance);
  }
}

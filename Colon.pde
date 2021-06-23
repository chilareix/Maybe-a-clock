class Colon {
  PVector pos=new PVector(0,0);
  int size;

  Colon(PVector Pos, int s) {
    this.pos.x=(int)Pos.x;
    this.pos.y=(int)Pos.y;
    this.size=s;
  }
  Colon(int x,int y, int s) {
    this.pos.x=x;
    this.pos.y=y;
    this.size=s;
  }
  
  void show(){
    push();
    noStroke();
    fill(255,0,0);
    circle(this.pos.x,this.pos.y,this.size);
    circle(this.pos.x,this.pos.y+this.size*2,this.size);
    pop();
  }
  void trans(PVector dis){
    this.pos.add(dis);
  }
  void trans(int x,int y){
    PVector dis = new PVector(x,y);
    this.pos.add(dis);
  }
}

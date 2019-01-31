class Cell{
 
  PVector position;
  int csize = 0;
  int x=0,y=0;
  boolean visited = false;

  Cell(int columns,int rows, int size){
    this.csize = size;
    x = columns;
    y = rows;
    position = new PVector(columns * csize, rows * csize);
 
  }

  int index(int x,int y){
    if(x < 0 || x > columns-1 || y < 0 || y > rows-1 ){
      return -1;}
    else{
      return (x + y * columns);
  }}

  void checkNeighbours(Queue<Cell> children){

    Cell top = null,right = null,bottom = null, left = null;

    if(index(this.x,this.y-1) != -1){
      println("top added");
      top = cells.get(index(this.x,this.y-1));
    }
    if(index(this.x+1,this.y) != -1){
      println("right added");
      right = cells.get(index(this.x+1,this.y));
    }
    if(index(this.x,this.y+1) != -1){
      println("bottom added");
      bottom = cells.get(index(this.x,this.y+1));
    }
    if(index(this.x-1,this.y) != -1){
      println("left added");
      left = cells.get(index(this.x-1,this.y));
    }

    if(top != null && top.visited == false){
      children.add(top);
    }
    if(right != null && right.visited == false){
      children.add(right);
    }
    if(bottom != null && bottom.visited == false){
      children.add(bottom);
    }
    if(left != null && left.visited == false){
      children.add(left);
    }

  }

  void display(){
    if(visited){
     fill(255); 
     }
    else{
      fill(125);
    }
    rect(position.x,position.y,csize,csize);
  }
}

import java.util.*;

int rows = 0, columns = 0;
int size = 20;
ArrayList<Cell> cells;
Cell current,next,goal;
Queue<Cell> children;

void setup(){
  
  size(800,800, P3D);
  //frameRate(100);
  rows = height/size;
  columns = width/size;
  cells = new ArrayList<Cell>();

  for(int i = 0;i < rows; i++){
    for(int j = 0;j< columns; j++){
      print((j+i*columns)+" ");  // x+y*columns
      cells.add(new Cell(j,i,size));
    }
    println(" ");
    children = new LinkedList<Cell>();
  }
  
  
  current = cells.get(0);
  current.visited = true;
  goal = cells.get(int(random(cells.size()/2,cells.size())));
  //goal.visited = true;
  background(0);
}

void draw(){
  background(0);

  for(Cell c : cells){
    c.display();
  }

  current.checkNeighbours(children);

  if(!children.isEmpty()){
    next = children.remove();
    while(next.visited && next != null){
      next = children.remove();
    }
  }else{
    noLoop();
  }
  
  current = next;
  current.visited = true;

  if(current==goal){
    noLoop();
  }
  
  highlightCurrent(); // different functions because of different colors
  highlightGoal();
}

void highlightCurrent(){
  fill(0,255,0);  
  rect(current.position.x,current.position.y,size,size);
}

void highlightGoal(){
  fill(255,0,0);  
  rect(goal.position.x,goal.position.y,size,size);
}

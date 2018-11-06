  ArrayList<Base> bases = new ArrayList<Base>();
  ArrayList<Bezier> beziers = new ArrayList<Bezier>();
  Base selected = null;



void setup() {
  size(1600, 800);
}

void draw() {
  update();
  background(255, 255, 255);
  
  for(Bezier l : beziers) {
    l.Draw();
  }
  
  for(Base b : bases) {
    b.Draw();
  }
}

void update() {  
  if(selected != null) {
      selected.Move(mouseX, mouseY);
  }
}
void mouseReleased() {
  
}
void mousePressed() {
   if(mouseButton == LEFT) {
     Base to = new Base(new PVector(mouseX, mouseY));
     
     if(bases.size() > 0 ){
       Base from = bases.get(bases.size() -1);
       Bezier l = new Bezier(from.getPos(), to.getPos());  
       beziers.add(l);
     }
     bases.add(to); 
  }
}

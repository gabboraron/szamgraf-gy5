abstract class Bezier extends Curve {
  
  Bezier(PVector from, PVector to) {
    curve.add(new SinWave(from, to));
    curve.add(new SinWave(from, to));
    curve.add(new SinWave(from, to));
    curve.add(new Eval);
  }
  
  void Draw(){
    //(1-t) * A + t * B
    /*for(int bidx = 0; bidx<bases.size
    for(Base b : bases){
      int x1 = int(b.getPos().x);
      int y1 = int(b.getPos().y);
       beginShape();
         for (int i = 0; i < detailness; i++) {
             line(x1, y1, x2, y2);
         }
       endShape(CLOSE);
    }*/
    
    beginShape(LINES);
     for (int i = 1; i < detailness; i++) {
       float t1 = 1.0 / detailness *i;
       float t2 = 1.0 / detailness * (i+1);
       PVector p1 = Eval(t1);
       PVector p2 = Eval(t2);
       
       
       vertex(p1.x, p1.y);
       vertex(p2.x, p2.y);
     } 
   endShape(CLOSE);
   
  }
  
  
  PVector Eval(float t){
    PVector P0 = bases.get(0);
    PVector P1 = bases.get(1);
    PVector P2 = bases.get(2);
    
    PVector A = P0.copy().mult(1-t).add(P1.copy().mult(t));
    PVector B = P1.copy().mult(1-t).add(P2.copy().mult(t));
    
    return A.copy().mult(1-t).add(B.copy().mult(t));
  }
}

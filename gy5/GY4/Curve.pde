abstract class Curve {
  int detailness = 10;
  ArrayList<PVector> bases = new ArrayList<PVector>();
  
  abstract void Draw();   //kirajozolja, bejár egy 1..1 intervallumot  detailness-szer
  abstract PVector Eval (int index, float t); //az eval kiszámolja a pontot ami rajta van a görbén, kiszámolja a szomszédos értékeket is a 
}

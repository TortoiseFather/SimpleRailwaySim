int Distance;
float a;
ArrayList<Anomaly> Anomalies = new ArrayList<Anomaly>();
int anomalycount = 0;
 boolean wr = false;
void setup()
{
  PFont f;
  Distance = 10;
  stroke(255);
  size(1920,1080);
  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.tff",24);
  textFont(f);
  a = height;
  textAlign(LEFT,LEFT);
}
void draw()
{
 background(178,190,181);
 int margin = 10;
 translate(margin*4, margin*4);
 Distance++;
 text("Train Distance: "+Distance/10, 10, 25);
 Train();
 TrainTrack();
 Anomalies();
}
public class Anomaly{
  int Angle = int(random(45));
  float Speed = random(10,20);
  int DfromT = int(random(850));
  int StartD = (int(random(1000)));
}
void Anomalies()
{
  int r = int(random(100));
  if (Distance>100 && r==25){
    Anomaly a = new Anomaly();
    Anomalies.add(a);
    anomalycount++;
  }
  for(int i = 0; i<anomalycount; i++){
    if(((Anomalies.get(i).DfromT)<850&&(Anomalies.get(i).DfromT)<1900)||(Anomalies.get(i).StartD<900)){
      DrawAnomaly(i);
    }
  }
}
void DrawAnomaly(int AnomalyCount){
  int Distance = Anomalies.get(AnomalyCount).DfromT;
  int Angle = Anomalies.get(AnomalyCount).Angle;
  float Speed = Anomalies.get(AnomalyCount).Speed;
  int StartD = (Anomalies.get(AnomalyCount).StartD);
  Anomalies.get(AnomalyCount).DfromT = Distance+1;
  circle(Distance, StartD, 50);
}
void Train(){
  rect(825,900,215,100);
}
void TrainTrack()
{
  for(int x=1; x<35;x++){
    line(850, (a+(50*x)-100), width-(900), (a+(50*x))-100);  
  }
  a = a + 2;
    if (a>100) { 
      a = 0; 
      
    }
}

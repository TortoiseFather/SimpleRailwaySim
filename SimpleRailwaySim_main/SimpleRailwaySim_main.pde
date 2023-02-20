int Distance;
float a;
int TrainSpeed;
ArrayList<Anomaly> Anomalies = new ArrayList<Anomaly>();
int anomalycount = 0;
 boolean wr = false;
void setup()
{
  PFont f;
  Distance = 10;
  stroke(255);
  TrainSpeed=14;
  size(1920,1080);
  f = createFont("Yu Gothic UI Regular",24);
  textFont(f);
  a = height;
  textAlign(LEFT,LEFT);
}
void draw()
{
 background(178,190,181);
 int margin = 10;
 translate(margin*4, margin*4);
 Distance=Distance+ TrainSpeed;
 text("Train Distance: "+Distance/10, 10, 25);
 Train();
 TrainTrack();
 Anomalies();
}

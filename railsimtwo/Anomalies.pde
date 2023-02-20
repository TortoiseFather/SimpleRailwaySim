ArrayList<Anomaly> Anomalies = new ArrayList<Anomaly>();
int anomalycount = 0;
color c;
double AnomalyY;
int StartD;
float AnomalyX;
float Speed;
double Angle;
double TimeToTrack;
public class Anomaly{
   double Angle = int(random(-90,90));
   float Speed = random(0.1,0.2);
   float AnomalyX = int(random(1280));
   int StartD = (int(random(200,450)));
   double AnomalyY = StartD;
   double XatContact;
   boolean hit = false;
   int UpOrDown = int(random(1,3));
   color c;
}
void Anomalies()
{
  int r = int(random(100));
  if (r==25){
    Anomaly a = new Anomaly();
    Anomalies.add(a);
    anomalycount++;
  }
    for(int i = 0; i<anomalycount; i++){
    if((Anomalies.get(i).AnomalyY)<720){
      SetAnomaly(i);
      PredictAnomaly(i);
      DrawAnomaly();
    }
  }
}

void DrawAnomaly () {
  fill(c);
  circle (AnomalyX, (float)AnomalyY, 10);

}
void SetAnomaly (int AnomalyCount) {
  AnomalyX = Anomalies.get(AnomalyCount).AnomalyX;
  Angle =  (Anomalies.get(AnomalyCount).Angle)/90;
  Speed = (Anomalies.get(AnomalyCount).Speed);
  AnomalyY= (Anomalies.get(AnomalyCount). AnomalyY);
  c = (Anomalies.get(AnomalyCount).c);
  Anomalies.get(AnomalyCount).AnomalyX = (float) (AnomalyX+Speed*Angle);
  Anomalies.get (AnomalyCount).AnomalyY = AnomalyY+Speed*(1-Math.abs(Angle));
    if((AnomalyX>trainx) && (AnomalyX < trainx+14) && (AnomalyY>535) && (AnomalyY<545))
    {
     Anomalies.get(AnomalyCount).c=color(255,0,0);
     Anomalies.get(AnomalyCount).hit = true;
    }
  if (AnomalyY>545&&Anomalies.get (AnomalyCount).hit == false) {
  Anomalies.get(AnomalyCount).c = color (0,255,0);
  }
}
void PredictAnomaly (int i) {
//To predict the anomaly we need to know the X per second
double DistancePerSecond = AnomalyY+Speed*(1-Math.abs(Angle));
//To know the X/sec we can divide speed by relativeangle
//Relativeangle is https://i.imgur.com/K2Gfgo6.png
TimeToTrack = (((535-AnomalyY)/DistancePerSecond) *100);

double Adjacent = Math.abs(545-AnomalyY);
double Radians = Math.toRadians(Angle*90);
double Hypotenuse = Math.abs(Adjacent/(Math.cos(Radians))); 
double Opposite = sqrt((float)((Hypotenuse*Hypotenuse)-(Adjacent*Adjacent)));
 double PredictedX;
if(Angle>0){
   PredictedX = AnomalyX + Opposite;
}
else{
   PredictedX = AnomalyX - Opposite;
}

line(AnomalyX, (float)AnomalyY, (float)(AnomalyX), 545);
line(AnomalyX, (float)AnomalyY, (float)(PredictedX), 545);
text("Angle: " + Angle*90 + "\nCurrent Pos: " + AnomalyY + "\nOpposite: " + Opposite +"\nPredicted X: " +PredictedX, (float)AnomalyX, (float)AnomalyY-10);
}

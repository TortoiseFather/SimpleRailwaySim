ArrayList<Anomaly> Anomalies = new ArrayList<Anomaly>();
int anomalycount = 0;
public class Anomaly{
  double Angle = int(random(-90,90));
  float Speed = random(0.1,0.2);
  float AnomalyX = int(random(1280));
  int StartD = (int(random(200,450)));
  double AnomalyY = StartD;
}
void Anomalies()
{
  int r = int(random(26));
  if (r==25){
    Anomaly a = new Anomaly();
    Anomalies.add(a);
    anomalycount++;
  }
    for(int i = 0; i<anomalycount; i++){
    if((Anomalies.get(i).AnomalyY)<720){
      DrawAnomaly(i);
    }
  }
}
void DrawAnomaly(int AnomalyCount){
  float AnomalyX = Anomalies.get(AnomalyCount).AnomalyX;
  double Angle = Anomalies.get(AnomalyCount).Angle;
  double RealAngle = calculateRealAngle(Angle);
  float Speed = (Anomalies.get(AnomalyCount).Speed);
  double AnomalyY = (Anomalies.get(AnomalyCount).AnomalyY);
  Anomalies.get(AnomalyCount).AnomalyX = (float)(AnomalyX+Speed*RealAngle);
  Anomalies.get(AnomalyCount).AnomalyY = AnomalyY+Speed*(1-RealAngle);
  circle(AnomalyX, (float)AnomalyY, 10);
  text("Angle: "+Angle + " Speed: "+(Speed*10), AnomalyX, (float)AnomalyY-10);
}
double calculateRealAngle(double Angle){
  Angle = Angle/90;
  return Angle;
}

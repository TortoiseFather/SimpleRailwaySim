public class Anomaly{
  float Angle = int(random(-90,90));
  double Speed = random(1,2);
  float DfromT = int(random(700,1000));
  float AnomlyY = (int(random(-800,200)));
  boolean Hit = false;
}
void Anomalies()
{
  int r = int(random(20));
  if (Distance>100 && r==15){
    Anomaly a = new Anomaly();
    Anomalies.add(a);
    anomalycount++;
  }
  for(int i = 0; i<anomalycount; i++){
    if(((Anomalies.get(i).DfromT)>950)&&((Anomalies.get(i).DfromT)<970)&&((Anomalies.get(i).AnomlyY)>900)){
        Anomalies.get(i).Hit = true;      
    }
    if(Anomalies.get(i).Hit == false){
       DrawAnomaly(i);
    }
  }
}
void DrawAnomaly(int AnomalyCount){
  float AnomalyX = Anomalies.get(AnomalyCount).DfromT;
  float Angle = Anomalies.get(AnomalyCount).Angle/90;
  double Speed = Anomalies.get(AnomalyCount).Speed;
  float AnomlyY = (Anomalies.get(AnomalyCount).AnomlyY);
  Anomalies.get (AnomalyCount).DfromT = (float)(AnomalyX+Speed*(1-Math.abs(Angle)));
  //Anomalies.get(AnomalyCount).DfromT = AnomalyX+(float)Speed;
 //Anomalies.get(AnomalyCount).AnomlyY = AnomlyY+(TrainSpeed-(float)Speed);
  Anomalies.get(AnomalyCount).AnomlyY =  (TrainSpeed)+(float)(AnomlyY+Speed*Angle);
  circle(AnomalyX, AnomlyY, 5);
  double Adjacent = Math.abs(950-AnomalyX);
  double Radians = Math.toRadians(Angle*90);
  double Hypotenuse = Math.abs(Adjacent/(Math.cos(Radians))); 
  double Opposite = sqrt((float)((Hypotenuse*Hypotenuse)-(Adjacent*Adjacent)));
   double PredictedY;
    if(Angle>0){
       PredictedY = AnomlyY + Opposite;
    }
    else{
       PredictedY = AnomlyY - Opposite;
    }
  line(AnomalyX, AnomlyY, 950, AnomlyY);
  PFont f = createFont("Yu Gothic UI Regular",12);
  textFont(f);
  line(AnomalyX, (float)AnomlyY, 950, (float)PredictedY);
  text("Angle: " + Angle + "\nSpeed: " + Speed + "\nDirection: "+ AnomalyX, AnomalyX-50, AnomlyY+20);
}

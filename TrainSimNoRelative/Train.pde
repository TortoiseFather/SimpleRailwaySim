float trainx;
void DrawTrain(){
  rect(trainx,535,50,10);
  text(trainx, trainx, 575);
  trainx = trainx + 14;
    if (trainx>6000) { 
      trainx = 0; 
    }
}

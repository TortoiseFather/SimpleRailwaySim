
void Train(){
  rect(950,900,20,100);
}
void TrainTrack()
{
  for(int x=1; x<35;x++){
    line(950, (a+(50*x)-100), 970, (a+(50*x))-100);  
  }
  a = a + TrainSpeed;
    if (a>100) { 
      a = 0; 
      
    }
}

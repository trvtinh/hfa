
#include <Adafruit_MLX90614.h>
#include <AceSorting.h>
Adafruit_MLX90614 mlx90614 = Adafruit_MLX90614();
  float AmbientTempC;
  float ObjectTempC;
  float AmbientTempF;
  float ObjectTempF;
void setup() {
  Serial.begin(9600);
  if (!mlx90614.begin()) {
    Serial.println("Error connecting to MLX sensor. Check wiring.");
    while (1);
  };
}
const int N = 200;
float dataTemp[N];
float readTemp(){
  for(int i = 0; i< N; i++){
    dataTemp[i] = mlx90614.readObjectTempC();    
  }
  ace_sorting::bubbleSort(dataTemp, N);
  float sum = 0;
  for(int i = 0.2 * N; i < 0.8 * N; i++){
    sum += dataTemp[i];

  }
  return sum / (0.6 * N);
}
void loop() {
  long start = millis();
    // AmbientTempC = mlx90614.readAmbientTempC();
    // ObjectTempC = mlx90614.readObjectTempC();
    // AmbientTempF = mlx90614.readAmbientTempF();
    // ObjectTempF = mlx90614.readObjectTempF();
    // Serial.print("\tAmbient"); Serial.println("\tObject");
    // Serial.print("*C:\t"); Serial.print(AmbientTempC); Serial.print("\t");Serial.println(ObjectTempC);
    // Serial.print("*F:\t"); Serial.print(AmbientTempF); Serial.print("\t");Serial.println(ObjectTempF);
    Serial.println(readTemp());
    //Serial.println(millis() - start);
}

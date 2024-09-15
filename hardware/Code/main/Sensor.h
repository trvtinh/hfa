#include <Adafruit_MLX90614.h>
#include <DFRobot_MAX30102.h>
#include <AceSorting.h>

Adafruit_MLX90614 mlx90614 = Adafruit_MLX90614();
DFRobot_MAX30102 max30102;

class Sensor
{
public:
  float AmbientTempC;
  float ObjectTempC;
  float AmbientTempF;
  float ObjectTempF;

  int32_t SPO2; //SPO2
  int8_t SPO2Valid; //Flag to display if SPO2 calculation is valid
  int32_t heartRate; //Heart-rate
  int8_t heartRateValid; //Flag to display if heart-rate calculation is valid 
  Sensor(){
  }
  bool init(){ // call on setup
    if(!mlx90614.begin()){
      Serial.println("Error connecting to MLX sensor. Check wiring");
    }
    else if(!max30102.begin()){
      Serial.println("MAX30102 was not found");
    }
    return mlx90614.begin() && max30102.begin();
  }
  void sensorConfig(){    // gọi khi dùng cảm biến MAX30102 
    max30102.sensorConfiguration(
      /*ledBrightness=*/50, 
      /*sampleAverage=*/SAMPLEAVG_4, 
      /*ledMode=*/MODE_MULTILED, 
      /*sampleRate=*/SAMPLERATE_100, 
      /*pulseWidth=*/PULSEWIDTH_411, 
      /*adcRange=*/ADCRANGE_16384
    );
    // Đặt tốc độ lấy mẫu
    max30102.setSampleRate(100);  // Ví dụ: 100 mẫu/giây
    // Đặt kích thước LED Pulse Width (giảm để lấy dữ liệu nhanh hơn)
    max30102.setPulseWidth(69);   // 69us để có tốc độ nhanh hơn
  }

  void getDataTemp(){
    AmbientTempC = mlx90614.readAmbientTempC();
    ObjectTempC = mlx90614.readObjectTempC();
    AmbientTempF = mlx90614.readAmbientTempF();
    ObjectTempF = mlx90614.readObjectTempF();
    Serial.print("\tAmbient"); Serial.println("\tObject");
    Serial.print("*C:\t"); Serial.print(AmbientTempC); Serial.print("\t");Serial.println(ObjectTempC);
    Serial.print("*F:\t"); Serial.print(AmbientTempF); Serial.print("\t");Serial.println(ObjectTempF);
  }
  void getDataHR_SPO2(){
    max30102.heartrateAndOxygenSaturation(/**SPO2=*/&SPO2, 
                                          /**SPO2Valid=*/&SPO2Valid, 
                                          /**heartRate=*/&heartRate, 
                                          /**heartRateValid=*/&heartRateValid);
    Serial.print("heartRate=");  Serial.print(heartRate); 
    Serial.print(", heartRateValid=");   Serial.print(heartRateValid);
    Serial.print("; SPO2=");   Serial.print(SPO2);
    Serial.print(", SPO2Valid=");    Serial.println(SPO2Valid);
  }
};





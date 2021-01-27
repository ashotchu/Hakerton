#define trigPin 2                
#define echoPin 3                

void setup()

{
  Serial.begin (9600);         // 보드레이트를 9600으로 설정
  pinMode(trigPin, OUTPUT);   // 출력핀
  pinMode(echoPin, INPUT);    // 입력핀

}

void loop()
{
  long duration, distance;                   
  digitalWrite(trigPin, LOW);                 // trigPin에 LOW 출력
  delayMicroseconds(2);                    // 2 마이크로초 delay
  digitalWrite(trigPin, HIGH);                // trigPin에 HIGH 출력
  delayMicroseconds(10);                  // 10마이크로초 delay
  digitalWrite(trigPin, LOW);                // trigPin에 LOW 출력
  duration = pulseIn(echoPin, HIGH);   // echoPin핀에서 펄스값 받아옴
  
 distance = duration * 17 / 1000;          //  duration을 연산하여 센싱한 거리값을 distance에 저장

  if (distance >= 200 || distance <= 0)       // 거리가 200cm가 넘거나 0보다 작으면
  {
    Serial.println("error");   // 에러 출력
  }
  else                                                    // 거리가 200cm가 넘지 않거나 0보다 작지 않으면
  {
    Serial.println(distance);                         // distance를 시리얼 모니터에 출력
  }

  delay(500);                                         
}

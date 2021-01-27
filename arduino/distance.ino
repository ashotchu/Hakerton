#define trigPin 2                   // trigPin을 2로 설정합니다.
#define echoPin 3                // echoPin을 3으로 설정합니다.

void setup()

{

  Serial.begin (9600);              // 시리얼 모니터를 사용하기 위해 보드레이트를 9600으로 설정합니다.

  pinMode(trigPin, OUTPUT);   // trigPin 핀을 출력핀으로 설정합니다.

  pinMode(echoPin, INPUT);    // echoPin 핀을 입력핀으로 설정합니다.

}

void loop()

{

  long duration, distance;                   // 각 변수를 선언합니다.

  digitalWrite(trigPin, LOW);                 // trigPin에 LOW를 출력하고

  delayMicroseconds(2);                    // 2 마이크로초가 지나면

  digitalWrite(trigPin, HIGH);                // trigPin에 HIGH를 출력합니다.

  delayMicroseconds(10);                  // trigPin을 10마이크로초 동안 기다렸다가
  digitalWrite(trigPin, LOW);                // trigPin에 LOW를 출력합니다.
  duration = pulseIn(echoPin, HIGH);   // echoPin핀에서 펄스값을 받아옵니다.


distance = duration * 17 / 1000;          //  duration을 연산하여 센싱한 거리값을 distance에 저장




  if (distance >= 200 || distance <= 0)       // 거리가 200cm가 넘거나 0보다 작으면

  {
    Serial.println("error");   // 에러를 출력합니다.
  }

  else                                                    // 거리가 200cm가 넘지 않거나 0보다 작지 않으면
  {
    Serial.println(distance);                         // distance를 시리얼 모니터에 출력합니다.
 
  }

  delay(500);                                         // 0.5초동안 기다립니다.
}

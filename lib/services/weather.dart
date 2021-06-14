class Weather {
  int date; //ngày
  int sunset; //mặt trời mọc
  int sunrise; //mặt trời lặn
  String name;
  int timezone; //múi giờ
  int humidity; //độ ẩm
  int condition;
  double latitude; //vĩ độ
  double longitude; //kinh độ
  String windSpeed; //tốc độ gió
  double tempMin; //nhiệt độ thấp nhất
  double tempMax; //nhiệt độ cao nhất
  double temperature; //nhiệt độ hiện tại
  String description;

  Weather({
    this.name,
    this.date,
    this.sunset,
    this.sunrise,
    this.timezone,
    this.humidity,
    this.condition,
    this.latitude,
    this.longitude,
    this.windSpeed,
    this.tempMin,
    this.tempMax,
    this.temperature,
    this.description,
  });

  String getIcon({String overrideNight}) {
    DateTime now = DateTime.now().toUtc(); //lây thời gian theo múi giờ UTC (VN là GMT+7)
    DateTime zoneTime = now.add(Duration(seconds: timezone ?? 0));
    String night = zoneTime.hour > 18 || zoneTime.hour <= 6 ? "-night" : "";

    if (overrideNight != null) {
      night = overrideNight;
    }
    //Đừng dẫn xét điều kiện (condition) https://openweathermap.org/weather-conditions
    //trả về tình trạng theo điều kiện
    if (condition >= 200 && condition < 300) {
      return "thunder"; // sấm sét
    } else if (condition >= 300 && condition <= 321) {
      return "drizzle"; //mưa phùn
    } else if (condition >= 500 && condition <= 504) {
      return "rain";
    } else if (condition >= 600 && condition <= 622) {
      return "snow"; //tuyết
    } else if (condition == 800) {
      return "clear" + night;
    } else if (condition == 801) {
      return "sunny" + night;
    } else if (condition == 741) {
      return "foggy";
    } else if (condition == 803 || condition == 804) {
      return "broken";
    } else {
      return "few" + night;
    }
  }

  @override
  String toString() {
    final String data1 =
        'name: $name, '
        'description: $description, '
        'condition: $condition, '
        'temperature: $temperature';
    final String data2 =
        'humidity: $humidity,'
        'sunrise: $sunrise,'
        'sunset: $sunset,'
        'date: $date,'
        'min: $tempMin,'
        'max: $tempMax';
    return 'Weather($data1, $data2, '
        'windSpeed: $windSpeed, '
        'timezone: $timezone, '
        'latitude: $latitude, '
        'longitude $longitude)';
  }
}

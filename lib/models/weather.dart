class Weather {
  final double
      temperature; //kode som sikrer at vi henter ut temp fra openweathermap.org

  Weather({required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'],
    );
  }
}

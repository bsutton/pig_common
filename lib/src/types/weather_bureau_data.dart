/// Minimal representation of a WeatherBureau
/// for a country
class WeatherBureauData {
  final int id;

  final String countryName;

  WeatherBureauData({required this.id, required this.countryName});

  factory WeatherBureauData.fromJson(Map<String, dynamic> json) =>
      WeatherBureauData(
        id: json['id'] as int,
        countryName: json['countryName'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'countryName': countryName,
      };
}

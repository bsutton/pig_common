/// Minimal representation of a WeatherStation
class WeatherStationData {
  WeatherStationData({required this.id, required this.name});

  factory WeatherStationData.fromJson(Map<String, dynamic> json) =>
      WeatherStationData(id: json['id'] as int, name: json['name'] as String);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  final int id;
  final String name;
}

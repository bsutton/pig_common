import 'package:meta/meta.dart';

@immutable
class WeatherLocationData {
  const WeatherLocationData({
    required this.id,
    required this.name,
    required this.state,
    required this.geohash,
  });

  factory WeatherLocationData.fromJson(Map<String, dynamic> json) =>
      WeatherLocationData(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        state: json['state'] as String? ?? '',
        geohash: json['geohash'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'state': state,
        'geohash': geohash,
      };

  final String id;
  final String name;
  final String state;
  final String geohash;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherLocationData &&
          id == other.id &&
          geohash == other.geohash;

  @override
  int get hashCode => Object.hash(id, geohash);
}

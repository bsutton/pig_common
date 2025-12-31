import '../../pig_common.dart';

/// Container for the list of endpoints and optional weather data
class EndPointListData {
  final List<EndPointData> endPoints;

  final List<WeatherBureauData> bureaus;

  final List<WeatherStationData> stations;

  EndPointListData({
    required this.endPoints,
    required this.bureaus,
    required this.stations,
  });

  /// Deserializes the JSON map into an EndPointListData.
  factory EndPointListData.fromJson(Map<String, dynamic> json) {
    final rawEndpoints = json['endPoints'] as List<dynamic>? ?? [];
    final epList = rawEndpoints
        .map((e) => EndPointData.fromJson(e as Map<String, dynamic>))
        .toList();

    final rawBureaus = json['weatherBureaus'] as List<dynamic>? ?? [];
    final bureauList = rawBureaus
        .map((b) => WeatherBureauData.fromJson(b as Map<String, dynamic>))
        .toList();

    final rawStations = json['weatherStations'] as List<dynamic>? ?? [];
    final stationList = rawStations
        .map((s) => WeatherStationData.fromJson(s as Map<String, dynamic>))
        .toList();

    return EndPointListData(
      endPoints: epList,
      bureaus: bureauList,
      stations: stationList,
    );
  }

  /// Convert this DTO into a JSON‐serializable map.
  Map<String, dynamic> toJson() => {
        'endPoints': endPoints.map((e) => e.toJson()).toList(),
        'weatherBureaus': bureaus.map((b) => b.toJson()).toList(),
        'weatherStations': stations.map((s) => s.toJson()).toList(),
      };
}

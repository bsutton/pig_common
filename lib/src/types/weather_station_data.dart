/// Minimal representation of a weather station.
class WeatherStationData {
  WeatherStationData({
    required this.bureauId,
    required this.stationId,
    required this.name,
  });

  factory WeatherStationData.fromJson(Map<String, dynamic> json) =>
      WeatherStationData(
        bureauId: json['bureauId'] as int? ?? 0,
        stationId: json['stationId'] as String? ?? '',
        name: json['name'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'bureauId': bureauId,
        'stationId': stationId,
        'name': name,
      };

  final int bureauId;
  final String stationId;
  final String name;
}

/// Shared BOM weather station definition without fetch logic.
enum BOMWeatherStation {
  viewBank(
    identifier: 'IDCJAC0009',
    observationSource: 'https://www.bom.gov.au/fwo/IDV60801/'
        'IDV60801.95874.json',
    forecastSource: 'https://ftp.bom.gov.au/anon/gen/fwo/'
        'IDV10703.xml',
    forecastLocationName: 'Melbourne',
  );

  const BOMWeatherStation({
    required this.identifier,
    required this.observationSource,
    required this.forecastSource,
    required this.forecastLocationName,
  });

  /// BOM station identifier used in BOM APIs.
  final String identifier;

  /// URL for BOM observation data.
  final String observationSource;

  /// URL for BOM forecast data.
  final String forecastSource;

  /// Location name used to match forecast entries.
  final String forecastLocationName;

  /// Human-friendly display name for UI lists.
  String get displayName {
    final spaced = name.replaceAllMapped(
      RegExp('([A-Z])'),
      (match) => ' ${match.group(1)}',
    );
    final trimmed = spaced.trim();
    if (trimmed.isEmpty) {
      return trimmed;
    }
    return trimmed[0].toUpperCase() + trimmed.substring(1);
  }
}

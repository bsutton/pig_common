class WeatherDayForecastData {
  WeatherDayForecastData({
    required this.date,
    required this.minTempC,
    required this.maxTempC,
    required this.rainChancePercent,
    required this.rainMinMm,
    required this.rainMaxMm,
  });

  factory WeatherDayForecastData.fromJson(Map<String, dynamic> json) =>
      WeatherDayForecastData(
        date: json['date'] as String? ?? '',
        minTempC: (json['minTempC'] as num?)?.toDouble() ?? 0.0,
        maxTempC: (json['maxTempC'] as num?)?.toDouble() ?? 0.0,
        rainChancePercent:
            (json['rainChancePercent'] as num?)?.toDouble() ?? 0.0,
        rainMinMm: (json['rainMinMm'] as num?)?.toDouble() ?? 0.0,
        rainMaxMm: (json['rainMaxMm'] as num?)?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'minTempC': minTempC,
        'maxTempC': maxTempC,
        'rainChancePercent': rainChancePercent,
        'rainMinMm': rainMinMm,
        'rainMaxMm': rainMaxMm,
      };

  final String date;
  final double minTempC;
  final double maxTempC;
  final double rainChancePercent;
  final double rainMinMm;
  final double rainMaxMm;
}

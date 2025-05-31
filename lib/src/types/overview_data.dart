// lib/src/model/overview_data.dart

/// This class mirrors whatever your server's `/overview` JSON returns,
/// plus space for BOM weather. We assume you already had fields like:
///   – gardenBedsCount (int)
///   – endpointsCount (int)
///   –`1List<WateringEvent>` lastWateringEvents
///
/// Now we add:
///   – double temp
///   – double forecastHigh
///   – double forecastLow
///   – double rain24
///   – double rain7days
class OverviewData {
  OverviewData({
    required this.gardenBedsCount,
    required this.endpointsCount,
    required this.lastWateringEvents,
    // The five new “weather” fields:
    required this.temp,
    required this.forecastHigh,
    required this.forecastLow,
    required this.rain24,
    required this.rain7days,
  });

  /// Count of configured garden beds (from your existing back-end).
  final int gardenBedsCount;

  /// Count of configured endpoints (from your existing back-end).
  final int endpointsCount;

  /// The last few watering events, so you can show them in the Overview.
  final List<WateringEvent> lastWateringEvents;

  // ─────────────────────────────────────────────────────────────────
  // NEW: weather info (all required, non-nullable)
  double temp;
  double forecastHigh;
  double forecastLow;
  double rain24;
  double rain7days;
  // ─────────────────────────────────────────────────────────────────

  /// Standard “fromJson” constructor for your existing fields. If your
  /// server doesn’t return “temp”, “forecastHigh”, etc., you can default them
  /// to zero here, since OverviewApi will overwrite them afterwards.
  factory OverviewData.fromJson(Map<String, dynamic> json) {
    return OverviewData(
      gardenBedsCount: json['gardenBedsCount'] as int,
      endpointsCount: json['endpointsCount'] as int,
      lastWateringEvents: (json['lastWateringEvents'] as List<dynamic>)
          .map((e) => WateringEvent.fromJson(e as Map<String, dynamic>))
          .toList(),

      // If your server did NOT send “temp” fields, default everything to 0.0
      // We’ll patch them in after we call BomApi.
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      forecastHigh: (json['forecastHigh'] as num?)?.toDouble() ?? 0.0,
      forecastLow: (json['forecastLow'] as num?)?.toDouble() ?? 0.0,
      rain24: (json['rain24'] as num?)?.toDouble() ?? 0.0,
      rain7days: (json['rain7days'] as num?)?.toDouble() ?? 0.0,
    );
  }

  /// If you ever need to send an OverviewData back as JSON, implement toJson():
  Map<String, dynamic> toJson() => {
        'gardenBedsCount': gardenBedsCount,
        'endpointsCount': endpointsCount,
        'lastWateringEvents':
            lastWateringEvents.map((e) => e.toJson()).toList(),

        // Send your weather fields (though most of the time you won’t post them):
        'temp': temp,
        'forecastHigh': forecastHigh,
        'forecastLow': forecastLow,
        'rain24': rain24,
        'rain7days': rain7days,
      };
}

/// Data class for watering events
class WateringEvent {
  WateringEvent({
    required this.start,
    required this.durationMinutes,
    required this.gardenBedName,
  });

  factory WateringEvent.fromJson(Map<String, dynamic> json) => WateringEvent(
        start: DateTime.parse(json['start'] as String),
        durationMinutes: json['durationMinutes'] as int,
        gardenBedName: json['gardenBedName'] as String,
      );

  /// Converts a `WateringEvent` instance into JSON.
  Map<String, dynamic> toJson() => {
        'start': start.toIso8601String(),
        'durationMinutes': durationMinutes,
        'gardenBedName': gardenBedName,
      };

  final DateTime start;
  final int durationMinutes;
  final String gardenBedName;
}

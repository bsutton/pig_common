// lib/src/model/history_data.dart

import 'package:pig_common/pig_common.dart'; // Adjust import if needed

/// A transfer‐object that combines raw History fields with a human‐readable
/// feature (garden bed) name, analogous to GardenBedData.
class HistoryData {
  /// Unique identifier of the history record (nullable if inserting a new record).
  int? id;

  /// The ID of the garden‐feature (e.g. a garden bed).
  int gardenFeatureId;

  /// Human‐readable name of the feature (e.g. "Backyard Bed").
  String featureName;

  /// When the event started.
  DateTime eventStart;

  /// Duration of the event in seconds (nullable if still in progress).
  Duration? eventDuration;

  /// When this history row was created in the database.
  DateTime createdDate;

  /// When this history row was last modified.
  DateTime modifiedDate;

  HistoryData({
    this.id,
    required this.gardenFeatureId,
    required this.featureName,
    required this.eventStart,
    this.eventDuration,
    required this.createdDate,
    required this.modifiedDate,
  });

  /// Build a HistoryData from a raw [History] entity plus its feature name.
  ///
  /// You must supply `featureName` by looking up the corresponding GardenBed (or other feature).
  HistoryData.fromHistory(
    History history, {
    required this.featureName,
  })  : id = history.id,
        gardenFeatureId = history.gardenFeatureId,
        eventStart = history.eventStart,
        eventDuration = history.eventDuration,
        createdDate = history.createdDate,
        modifiedDate = history.modifiedDate;

  /// Converts this object into a JSON‐serializable map.
  Map<String, dynamic> toJson() => {
        'id': id,
        'gardenFeatureId': gardenFeatureId,
        'featureName': featureName,
        'eventStart': eventStart.toIso8601String(),
        'eventDurationSeconds': eventDuration?.inSeconds ?? 0,
        'createdDate': createdDate.toIso8601String(),
        'modifiedDate': modifiedDate.toIso8601String(),
      };

  /// Constructs a `HistoryData` from a JSON map (e.g. incoming in an API response).
  factory HistoryData.fromJson(Map<String, dynamic> json) {
    return HistoryData(
      id: json['id'] as int?,
      gardenFeatureId: json['gardenFeatureId'] as int,
      featureName: json['featureName'] as String,
      eventStart: DateTime.parse(json['eventStart'] as String),
      eventDuration:
          Duration(seconds: json['eventDurationSeconds'] as int? ?? 0),
      createdDate: DateTime.parse(json['createdDate'] as String),
      modifiedDate: DateTime.parse(json['modifiedDate'] as String),
    );
  }

  /// Convenience getter: returns eventStart formatted as `YYYY/MM/DD HH:MM`.
  String get eventStartString {
    final dt = eventStart;
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$y/$m/$d $hh:$mm';
  }

  /// Convenience getter: returns eventDuration in “Xm Ys” format, or “In Progress”.
  String get durationString {
    if (eventDuration == null) {
      return 'In Progress';
    }
    final totalSec = eventDuration!.inSeconds;
    final minutes = totalSec ~/ 60;
    final seconds = totalSec % 60;
    return '${minutes}m ${seconds}s';
  }
}

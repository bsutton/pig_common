import '../../pig_common.dart';

class GardenBedData {
  /// [id] can be null if we are creating a new bed
  int? id;

  String? name;

  String? description;

  int? valveId;

  int? masterValveId;

  bool allowDelete;

  bool isOn;

  /// If the bed is running on a timer this will
  /// contain the remaining time.
  Duration remainingDuration;

  /// Last watering date and time
  DateTime? lastWateringDateTime;

  /// Duration of the last watering event in seconds
  int? lastWateringDuration;

  GardenBedData({
    this.id,
    this.name,
    this.description,
    this.valveId,
    this.masterValveId,
    this.allowDelete = false,
    this.isOn = false,
    this.remainingDuration = Duration.zero,
    this.lastWateringDateTime,
    this.lastWateringDuration,
  });

  GardenBedData.fromBed(GardenBed bed,
      {required this.allowDelete,
      required this.isOn,
      required this.remainingDuration,
      this.lastWateringDateTime,
      this.lastWateringDuration})
      : id = bed.id,
        name = bed.name,
        description = bed.description,
        valveId = bed.valveId,
        masterValveId = bed.masterValveId;

  /// Constructs a `GardenBedData` from a JSON object.
  factory GardenBedData.fromJson(Map<String, dynamic> json) => GardenBedData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        valveId: json['valveId'] as int?,
        masterValveId: json['masterValveId'] as int?,
        allowDelete: json['allowDelete'] as bool? ?? false,
        isOn: json['isOn'] as bool? ?? false,
        remainingDuration: Duration(seconds: json['remainingDuration'] as int),
        lastWateringDateTime: json['lastWateringDateTime'] != null
            ? DateTime.parse(json['lastWateringDateTime'] as String)
            : null,
        lastWateringDuration: json['lastWateringDuration'] as int?,
      );

  /// Converts the `GardenBedData` instance to a JSON-serializable object.
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'valveId': valveId,
        'masterValveId': masterValveId,
        'allowDelete': allowDelete,
        'isOn': isOn,
        'remainingDuration': remainingDuration.inSeconds,
        'lastWateringDateTime': lastWateringDateTime?.toIso8601String(),
        'lastWateringDuration': lastWateringDuration,
      };

  /// Optional convenience getters
  String get lastWateringDateTimeString => lastWateringDateTime != null
      ? _formatDateTime(lastWateringDateTime!)
      : 'None';

  String get lastWateringDurationString => lastWateringDuration != null
      ? _formatDuration(lastWateringDuration!)
      : '--';

  String get remainingDurationString => remainingDuration != Duration.zero
      ? _formatDuration(remainingDuration.inSeconds)
      : 'None';

  static String _formatDateTime(DateTime dt) {
    final day = dt.day.toString().padLeft(2, '0');
    final month = dt.month.toString().padLeft(2, '0');
    final year = dt.year;
    final hour = dt.hour.toString().padLeft(2, '0');
    final minute = dt.minute.toString().padLeft(2, '0');
    return '$year/$month/$day $hour:$minute';
  }

  static String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes}m ${secs}s';
  }
}

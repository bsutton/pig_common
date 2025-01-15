import 'package:pig_common/pig_common.dart';

class GardenBedData {
  GardenBedData({
    this.id,
    this.name,
    this.description,
    this.valveId,
    this.masterValveId,
    this.allowDelete = false,
    this.isOn = false,
  });

  GardenBedData.fromBed(GardenBed bed,
      {required this.allowDelete, required this.isOn})
      : id = bed.id,
        name = bed.name,
        description = bed.description,
        valveId = bed.valveId,
        masterValveId = bed.masterValveId;

  int? id;
  String? name;
  String? description;
  int? valveId;
  int? masterValveId;
  bool allowDelete;
  bool isOn;

  /// Converts the `GardenBedData` instance to a JSON-serializable object.
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'valveId': valveId,
        'masterValveId': masterValveId,
        'allowDelete': allowDelete,
        'isOn': isOn,
      };

  /// Constructs a `GardenBedData` from a JSON object.
  factory GardenBedData.fromJson(Map<String, dynamic> json) => GardenBedData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        valveId: json['valveId'] as int?,
        masterValveId: json['masterValveId'] as int?,
        allowDelete: json['allowDelete'] as bool? ?? false,
        isOn: json['isOn'] as bool? ?? false,
      );
}

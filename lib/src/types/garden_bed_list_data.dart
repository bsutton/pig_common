import 'package:pig_common/pig_common.dart';

class GardenBedListData {
  GardenBedListData({
    this.beds = const <GardenBedData>[],
    this.valves = const <EndPointInfo>[],
    this.masterValves = const <EndPointInfo>[],
  });

  List<GardenBedData> beds;

  /// List of available valves
  List<EndPointInfo> valves;

  /// List of available master valves
  List<EndPointInfo> masterValves;

  /// Converts the `GardenBedListData` instance to a JSON-serializable object.
  Map<String, dynamic> toJson() => {
        'beds': beds.map((bed) => bed.toJson()).toList(),
        'valves': valves.map((valve) => valve.toJson()).toList(),
        'masterValves':
            masterValves.map((masterValve) => masterValve.toJson()).toList(),
      };

  /// Constructs a `GardenBedListData` from a JSON object.
  factory GardenBedListData.fromJson(Map<String, dynamic> json) =>
      GardenBedListData(
        beds: (json['beds'] as List<dynamic>?)
                ?.map((bed) =>
                    GardenBedData.fromJson(bed as Map<String, dynamic>))
                .toList() ??
            const <GardenBedData>[],
        valves: (json['valves'] as List<dynamic>?)
                ?.map((valve) =>
                    EndPointInfo.fromJson(valve as Map<String, dynamic>))
                .toList() ??
            const <EndPointInfo>[],
        masterValves: (json['masterValves'] as List<dynamic>?)
                ?.map((masterValve) =>
                    EndPointInfo.fromJson(masterValve as Map<String, dynamic>))
                .toList() ??
            const <EndPointInfo>[],
      );
}

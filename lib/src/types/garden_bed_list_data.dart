import '../../pig_common.dart';

class GardenBedListData {
  GardenBedListData({
    this.beds = const <GardenBedData>[],
    this.valves = const <EndPointData>[],
    this.masterValves = const <EndPointData>[],
  });

  List<GardenBedData> beds;

  /// List of available valves
  List<EndPointData> valves;

  /// List of available master valves
  List<EndPointData> masterValves;

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
                    EndPointData.fromJson(valve as Map<String, dynamic>))
                .toList() ??
            const <EndPointData>[],
        masterValves: (json['masterValves'] as List<dynamic>?)
                ?.map((masterValve) =>
                    EndPointData.fromJson(masterValve as Map<String, dynamic>))
                .toList() ??
            const <EndPointData>[],
      );
}

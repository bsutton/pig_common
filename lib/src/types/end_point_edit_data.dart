import '../../pig_common.dart';

/// Data returned from `/end_point/edit_data`
class EndPointEditData {
  EndPointEditData({
    required this.availablePins,
    required this.activationTypes,
    this.endPoint,
  });

  factory EndPointEditData.fromJson(Map<String, dynamic> json) {
    EndPointData? ep;
    final endPointJson = json['endPoint'] as Map<String, dynamic>?;
    if (endPointJson != null) {
      ep = EndPointData.fromJson(endPointJson);
      // You might store pinNo or activationType in a new data class, etc.
    }
    final pins = (json['availablePins'] as List<dynamic>? ?? [])
        .map((p) => GPIOPinAssignment.fromJson(p as Map<String, dynamic>))
        .toList();

    final acts = (json['activationTypes'] as List<dynamic>? ?? [])
        .map((a) => PinActivationType.fromJson(a as String))
        .toList();

    return EndPointEditData(
      endPoint: ep,
      availablePins: pins,
      activationTypes: acts,
    );
  }
  final EndPointData? endPoint; // null if new
  final List<GPIOPinAssignment> availablePins;
  final List<PinActivationType> activationTypes;
}

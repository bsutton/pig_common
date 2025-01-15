import 'package:pig_common/pig_common.dart';

class EndPointInfo {
  EndPointInfo(
      {required this.id,
      required this.name,
      required this.activationType,
      required this.pinAssignment,
      required this.endPointType,
      required this.isOn});

  EndPointInfo.fromEndPoint(EndPoint endPoint, {bool on = false})
      : id = endPoint.id,
        name = endPoint.name,
        activationType = endPoint.activationType,
        pinAssignment = GPIOPinAssignment.getByPinNo(endPoint.gpioPinNo),
        endPointType = endPoint.endPointType,
        isOn = on;

  factory EndPointInfo.fromJson(Map<String, dynamic> json) => EndPointInfo(
        id: json['id'] as int?,
        name: json['name'] as String,
        activationType: PinActivationType.fromJson(json['activationType']),
        pinAssignment: GPIOPinAssignment.fromJson(json['pinAssignment']),
        isOn: json['isOn'] as bool,
        endPointType: EndPointType.fromName(json['endPointType'] as String),
      );

  /// Converts an EndPoint to JSON. Adjust fields to match your usage.
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'activationType': activationType.name,
        'pinAssignment': pinAssignment.toJson(),
        'endPointType': endPointType.name,
        'isOn': isOn,
      };

  final int? id;
  final String name;
  final GPIOPinAssignment pinAssignment;
  final PinActivationType activationType;
  final bool isOn;
  final EndPointType endPointType;
}

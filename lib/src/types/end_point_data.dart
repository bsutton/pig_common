import '../../pig_common.dart';

class EndPointData {
  final int? id;

  final int ordinal;

  final String name;

  final GPIOPinAssignment gpioPinAssignment;

  final PinActivationType activationType;

  final bool isOn;

  final EndPointType endPointType;

  EndPointData({
    required this.id,
    required this.ordinal,
    required this.name,
    required this.activationType,
    required this.gpioPinAssignment,
    required this.endPointType,
    required this.isOn,
  });

  EndPointData.fromEndPoint(EndPoint endPoint, {bool on = false})
      : id = endPoint.id,
        ordinal = endPoint.ordinal,
        name = endPoint.name,
        activationType = endPoint.activationType,
        gpioPinAssignment = GPIOPinAssignment.getByPinNo(endPoint.gpioPinNo),
        endPointType = endPoint.endPointType,
        isOn = on;

  factory EndPointData.fromJson(Map<String, dynamic> json) => EndPointData(
        id: json['id'] as int?,
        ordinal: json['ordinal'] as int? ?? 0,
        name: json['name'] as String,
        activationType:
            PinActivationType.fromJson(json['activationType'] as String),
        gpioPinAssignment: GPIOPinAssignment.fromJson(
            json['pinAssignment'] as Map<String, dynamic>),
        endPointType: EndPointType.fromName(json['endPointType'] as String),
        isOn: json['isOn'] as bool,
      );

  EndPoint toEndPoint() {
    final entity = EndPoint(
      id: id!,
      ordinal: ordinal,
      name: name,
      activationType: activationType,
      gpioPinNo: gpioPinAssignment.gpioPin,
      endPointType: endPointType,
      createdDate: DateTime.now(),
      modifiedDate: DateTime.now(),
    );

    return EndPoint.forUpdate(
        entity: entity,
        ordinal: ordinal,
        name: name,
        endPointType: endPointType,
        activationType: activationType,
        gpioPinNo: gpioPinAssignment.gpioPin);
  }

  /// Converts an EndPointInfo to JSON, including ordinal.
  Map<String, dynamic> toJson() => {
        'id': id,
        'ordinal': ordinal,
        'name': name,
        'activationType': activationType.name,
        'pinAssignment': gpioPinAssignment.toJson(),
        'endPointType': endPointType.name,
        'isOn': isOn,
      };
}

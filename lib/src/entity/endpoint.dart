import 'package:fixed/fixed.dart';
import 'package:pig_common/src/types/pin_activation_type.dart';

import '../types/endpoint_type.dart';
import 'entities.dart';

class EndPoint extends Entity<EndPoint> {
  EndPoint({
    required super.id,
    required this.name,
    required this.endPointType,
    required this.activationType,
    required this.gpioPinNo,
    required super.createdDate,
    required super.modifiedDate,
    this.drainLine = false,
    this.startAmps,
    this.runningAmps,
    this.startupInterval,
  }) : super();

  EndPoint.forInsert({
    required this.name,
    required this.endPointType,
    required this.activationType,
    required this.gpioPinNo,
    this.drainLine = false,
    this.startAmps,
    this.runningAmps,
    this.startupInterval,
  }) : super.forInsert();

  EndPoint.forUpdate({
    required super.entity,
    required this.name,
    required this.endPointType,
    required this.activationType,
    required this.gpioPinNo,
    this.drainLine = false,
    this.startAmps,
    this.runningAmps,
    this.startupInterval,
  }) : super.forUpdate();

  factory EndPoint.fromMap(Map<String, dynamic> map) => EndPoint(
        id: map['id'] as int,
        name: map['end_point_name'] as String,
        endPointType:
            EndPointType.values.byName(map['end_point_type'] as String),
        activationType:
            PinActivationType.values.byName(map['activation_type'] as String),
        gpioPinNo: map['pin_no'] as int,
        drainLine: map['drain_line'] == 1,
        startAmps: map['start_amps'] != null
            ? Fixed.fromInt(map['start_amps'] as int)
            : null,
        runningAmps: map['running_amps'] != null
            ? Fixed.fromInt(map['running_amps'] as int)
            : null,
        startupInterval: map['startup_interval'] != null
            ? Duration(seconds: map['startup_interval'] as int)
            : null,
        createdDate: DateTime.parse(map['created_date'] as String),
        modifiedDate: DateTime.parse(map['modified_date'] as String),
      );

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'end_point_name': name,
        'end_point_type': endPointType.name,
        'activation_type': activationType.name,
        'pin_no': gpioPinNo,
        'drain_line': drainLine ? 1 : 0,
        'start_amps': startAmps?.minorUnits,
        'running_amps': runningAmps?.minorUnits,
        'startup_interval': startupInterval?.inSeconds,
        'created_date': createdDate.toIso8601String(),
        'modified_date': modifiedDate.toIso8601String(),
      };

  String name;
  EndPointType endPointType;
  PinActivationType activationType;

  /// gpio pin no (as opposed to the header pin number)
  int gpioPinNo;
  bool drainLine;
  Fixed? startAmps;
  Fixed? runningAmps;
  Duration? startupInterval;

  bool get isDrainingLine => drainLine;

  @override
  String toString() => 'EndPoint: $name, pin: $gpioPinNo, $activationType';
}

import 'dart:convert';

import '../../pig_common.dart';

/// Different types of notices sent to WebSocket listeners.
enum NoticeType {
  start,
  stop,
}

enum FeatureType {
  gardenBed,
  lighting;

  static FeatureType fromFeature(GardenFeature feature) {
    switch (feature) {
      case GardenBed _:
        return FeatureType.gardenBed;
      case Lighting _:
        return FeatureType.lighting;
    }
    throw ArgumentError('Unknown FeatureType: ${feature.runtimeType}');
  }
}

/// Encapsulates a message that can be sent to a listening WebSocket client.
class Notice {
  Notice({
    required this.noticeType,
    required this.featureType,
    required this.featureId,
    required this.description,
  });
  final NoticeType noticeType;
  final FeatureType featureType;
  final int featureId;
  final String description;

  Map<String, dynamic> toJson() => {
        'noticeType': noticeType.toString(),
        'featureId': featureId,
        'featureType': featureType.toString(),
        'description': description,
      };

  /// Converts a [Map] to a [Notice] instance.
  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        noticeType: NoticeType.values.firstWhere(
          (e) => e.toString() == json['noticeType'],
          orElse: () =>
              throw ArgumentError('Invalid notice type: ${json['noticeType']}'),
        ),
        featureId: json['featureId'] as int,
        featureType: FeatureType.values.firstWhere(
          (e) => e.toString() == json['featureType'],
          orElse: () => throw ArgumentError(
              'Invalid feature type: ${json['featureType']}'),
        ),
        description: json['description'] as String,
      );

  @override
  String toString() => jsonEncode(toJson());
}

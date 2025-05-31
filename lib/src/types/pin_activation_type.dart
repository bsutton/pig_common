/// Represents the activation type of a GPIO pin.
enum PinActivationType {
  highIsOn(
    label: 'High is On',
    onState: PinVoltage.high,
    offState: PinVoltage.low,
  ),
  lowIsOn(
    label: 'Low is On',
    onState: PinVoltage.low,
    offState: PinVoltage.high,
  );

  const PinActivationType({
    required this.label,
    required this.onState,
    required this.offState,
  });

  /// Human-readable label for the activation type.
  final String label;

  /// The state of the pin when it is considered "on".
  final PinVoltage onState;

  /// The state of the pin when it is considered "off".
  final PinVoltage offState;

  /// Converts the enum to a JSON-serializable string.
  String toJson() => name;

  /// Constructs a `PinActivationType` from a JSON string.
  factory PinActivationType.fromJson(String json) {
    return PinActivationType.values.firstWhere(
      (e) => e.name == json,
      orElse: () => throw ArgumentError('Invalid PinActivationType: $json'),
    );
  }
}

enum PinLogic { on, off }

/// Represents the state of a GPIO pin.
enum PinVoltage {
  high,
  low;

  /// Converts the enum to a JSON-serializable string.
  String toJson() => name;

  /// Constructs a `PinState` from a JSON string.
  factory PinVoltage.fromJson(String json) {
    return PinVoltage.values.firstWhere(
      (e) => e.name == json,
      orElse: () => throw ArgumentError('Invalid PinState: $json'),
    );
  }
}

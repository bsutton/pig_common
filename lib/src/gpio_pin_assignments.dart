/// Used to map header pin numbers to the GPIO pin name.
enum GPIOPinAssignment {
  gpio5(5, 29),
  gpio6(6, 31),
  gpio12(12, 32),
  gpio13(13, 33),
  gpio16(16, 36),
  gpio19(19, 35),
  gpio20(20, 38),
  gpio21(21, 40),
  gpio26(26, 37),
  gpio17(17, 11),
  gpio18(18, 12),
  gpio22(22, 13),
  gpio23(23, 15),
  gpio24(24, 16),
  gpio25(25, 18),
  gpio27(27, 22);

  const GPIOPinAssignment(this.gpioPin, this.headerPin);

  final int gpioPin;
  final int headerPin;

  /// Get a GPIOPinAssignments by GPIO pin number.
  static GPIOPinAssignment getByPinNo(int gpioPin) =>
      values.firstWhere((assignment) => assignment.gpioPin == gpioPin);

  /// Converts the enum to a JSON-serializable object.
  Map<String, dynamic> toJson() => {
        'gpioPin': gpioPin,
        'headerPin': headerPin,
      };

  /// Constructs a `GPIOPinAssignments` from a JSON object.
  factory GPIOPinAssignment.fromJson(Map<String, dynamic> json) {
    final gpioPin = json['gpioPin'] as int;
    return getByPinNo(gpioPin);
  }

  @override
  String toString() => 'GPIO: $gpioPin Header: $headerPin';
}

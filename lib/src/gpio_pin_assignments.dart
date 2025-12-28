/// Used to map header pin numbers to the GPIO pin name.
enum GPIOPinAssignment {
  none(-1, -1),
  gpio2(2, 3),
  gpio3(3, 5),
  gpio4(4, 7),
  gpio5(5, 29),
  gpio6(6, 31),
  gpio7(7, 26),
  gpio8(8, 24),
  gpio9(9, 21),
  gpio10(10, 19),
  gpio11(11, 23),
  gpio12(12, 32),
  gpio13(13, 33),
  gpio14(14, 8),
  gpio15(15, 10),
  gpio16(16, 36),
  gpio17(17, 11),
  gpio18(18, 12),
  gpio19(19, 35),
  gpio20(20, 38),
  gpio21(21, 40),
  gpio22(22, 13),
  gpio23(23, 15),
  gpio24(24, 16),
  gpio25(25, 18),
  gpio26(26, 37),
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

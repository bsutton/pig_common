/// Enum representing different types of endpoints in the irrigation system.
enum EndPointType {
  valve('Valve'),
  light('Light'),
  masterValve('Master Valve');

  const EndPointType(this.displayName);

  /// Display name for the enum value.
  final String displayName;

  static EndPointType fromName(String name) =>
      values.firstWhere((value) => value.name == name);

  @override
  String toString() => displayName;
}

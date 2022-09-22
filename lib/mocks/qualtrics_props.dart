class QualtricsProperties {
  final int userId;
  final String os;
  final String osName;
  final String country;
  final String manufacture;
  final String deviceModel;
  final String language;

  QualtricsProperties({
    required this.userId,
    required this.os,
    required this.osName,
    required this.country,
    required this.manufacture,
    required this.deviceModel,
    required this.language,
  });
}

final mockProperties = [
  QualtricsProperties(
    userId: 123,
    os: 'Android',
    osName: 'Jelly Bean',
    country: 'Israel',
    manufacture: 'Samsung',
    deviceModel: 'S22',
    language: 'Hebrew',
  ),
  QualtricsProperties(
    userId: 234,
    os: 'Android',
    osName: 'Ice Cream Sandwich',
    country: 'Romania',
    manufacture: 'HTC',
    deviceModel: 'U11',
    language: 'Romanian',
  ),
  QualtricsProperties(
    userId: 567,
    os: 'iOS',
    osName: '14',
    country: 'USA',
    manufacture: 'Apple',
    deviceModel: 'iPhone 13 Pro Max',
    language: 'English',
  ),
];

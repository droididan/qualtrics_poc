class QualtricsBaseParams {
  final String brandId;
  final String projectId;
  final String? interceptId;

  const QualtricsBaseParams({
    required this.brandId,
    required this.projectId,
    this.interceptId,
  });
}

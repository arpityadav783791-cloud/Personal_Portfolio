class ProjectModel {
  const ProjectModel({
    required this.id,
    required this.title,
    required this.tagline,
    required this.description,
    required this.technologies,
    required this.keyFeatures,
    required this.architecture,
    required this.challenges,
    required this.results,
    this.githubUrl,
    this.liveUrl,
    this.isFeatured = false,
  });

  final String id;
  final String title;
  final String tagline;
  final String description;
  final List<String> technologies;
  final List<String> keyFeatures;
  final String architecture;
  final String challenges;
  final String results;
  final String? githubUrl;
  final String? liveUrl;
  final bool isFeatured;
}

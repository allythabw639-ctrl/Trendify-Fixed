class StyleFilterModel {
  final String id;
  final String name;
  final String displayName;
  final String previewUrl;
  final bool isPremium;

  StyleFilterModel({
    required this.id,
    required this.name,
    required this.displayName,
    required this.previewUrl,
    this.isPremium = false,
  });

  static List<StyleFilterModel> get defaults => [
    StyleFilterModel(id: '1', name: 'anime', displayName: 'Anime', previewUrl: ''),
    StyleFilterModel(id: '2', name: 'sketch', displayName: 'Sketch', previewUrl: ''),
    StyleFilterModel(id: '3', name: 'oil_painting', displayName: 'Oil Painting', previewUrl: ''),
    StyleFilterModel(id: '4', name: 'watercolor', displayName: 'Watercolor', previewUrl: ''),
    StyleFilterModel(id: '5', name: 'pop_art', displayName: 'Pop Art', previewUrl: ''),
  ];
}

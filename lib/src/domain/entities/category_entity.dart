class CategoryEntity {
  final String title;
  final String subtitle;
  final String imagePath;

  CategoryEntity({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'imagePath': imagePath,
    };
  }

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      imagePath: map['imagePath'] as String,
    );
  }
}

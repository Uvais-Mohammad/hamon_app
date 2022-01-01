class ClassRoom2 {
  final int id;
  final String name;
  final String layout;
  final int size;
  final int subject;

  ClassRoom2(
      {required this.id,
      required this.name,
      required this.layout,
      required this.size,
      required this.subject});

  factory ClassRoom2.fromJson(Map<String, dynamic> json) {
    return ClassRoom2(
        id: json['id'],
        name: json['name'],
        layout: json['layout'],
        size: json['size'],
        subject: json['subject']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['layout'] = layout;
    data['size'] = size;
    data['subject'] = subject;
    return data;
  }
}

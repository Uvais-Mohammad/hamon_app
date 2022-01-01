class ClassRoom {
  final int id;
  final String name;
  final String layout;
  final int size;
  var subject;

  ClassRoom(
      {required this.id,
      required this.name,
      required this.layout,
      required this.size,
      this.subject});

  factory ClassRoom.fromJson(Map<String, dynamic> json) {
    print(json['id'].runtimeType);
    print(json['name'].runtimeType);
    print(json['layout'].runtimeType);
    print(json['size'].runtimeType);
    print(json['subject'].runtimeType);
    return ClassRoom(
        id: json['id'],
        name: json['name'],
        layout: json['layout'],
        size: json['size'],
        subject: json['subject'].runtimeType == int ? json['subject'] : '');
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

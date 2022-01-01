
class ClassRoom {
  final int id;
  final String name;
  final String layout;
  final int size;

  ClassRoom(
      {required this.id,
      required this.name,
      required this.layout,
      required this.size});

  factory ClassRoom.fromJson(Map<String, dynamic> json) {
    return ClassRoom(
      id: json['id'],
      name: json['name'],
      layout: json['layout'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['layout'] = layout;
    data['size'] = size;
    return data;
  }
}

class Subject {
  final int id;
  final String name;
  final String teacher;
  final int credits;

  Subject({required this.id,required this.name,required this.teacher,required this.credits});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
      teacher: json['teacher'],
      credits: json['credits'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['teacher'] = teacher;
    data['credits'] = credits;
    return data;
  }
}

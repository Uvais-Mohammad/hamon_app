class Subject {
  final int id;
  final String name;
  final String taecher;
  final int credit;

  Subject({required this.id,required this.name,required this.taecher,required this.credit});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
      taecher: json['teacher'],
      credit: json['credit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['teacher'] = taecher;
    data['credit'] = credit;
    return data;
  }
}

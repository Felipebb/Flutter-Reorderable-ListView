class Materias {
  String id;
  String curso;
  String materia;
  String professor;

  Materias({this.id, this.curso, this.materia, this.professor});

  Materias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    curso = json['curso'];
    materia = json['materia'];
    professor = json['professor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['curso'] = this.curso;
    data['materia'] = this.materia;
    data['professor'] = this.professor;
    return data;
  }
}
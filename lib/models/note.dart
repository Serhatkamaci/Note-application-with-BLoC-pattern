class Note{
  int note_id;
  String lesson_name;
  int first_note;
  int second_note;

  Note({required this.note_id, required this.lesson_name, required this.first_note, required this.second_note});

  factory Note.fromJson(Map<String, dynamic> json){
    return Note(
        note_id: json["not_id"],
        lesson_name: json["ders_adi"],
        first_note: json["not1"],
        second_note: json["not2"],
    );
  }
}
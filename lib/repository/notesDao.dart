import 'package:notes_app_sqlite_block_pattern/databaseAccess/databaseAcess.dart';
import '../models/note.dart';

class NotesDao{

  Future<List<Note>> getAllNotes() async{

    List<Note> noteList= <Note>[];
    var db= await DatabaseAcess.databaseAcess();
    List<Map<String, dynamic>> data= await db.rawQuery("select * from notlar");
    List.generate(data.length, (index){
      var note= Note.fromJson(data[index]);
      noteList.add(note);
    });
    return noteList;
  }

  Future<void> updateNote(int note_id, String lesson_name, int first_note, int second_note) async{
    var db= await DatabaseAcess.databaseAcess();
    Map<String, dynamic> updateData= {
      "ders_adi": lesson_name,
      "not1": first_note,
      "not2": second_note,
    };
    db.update("notlar", updateData, where: "not_id=?", whereArgs: [note_id]);
  }

  Future<void> deleteNote(int note_id) async{
    var db= await DatabaseAcess.databaseAcess();
    await db.rawQuery("delete from notlar where not_id=$note_id");
  }


  Future<void> insertNote(String lesson_name, first_note, second_note) async{
    var db= await DatabaseAcess.databaseAcess();
    await db.rawQuery("insert into notlar (ders_adi, not1, not2) values('$lesson_name', $first_note, $second_note)");
  }
}
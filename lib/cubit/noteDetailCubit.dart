import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_sqlite_block_pattern/repository/notesDao.dart';

class NoteDetailCubit extends Cubit<void>{
  NoteDetailCubit(): super(0);
  var notesDao= NotesDao();

  Future<void> updateNote(int note_id, String lesson_name, int first_note, int second_note) async{
   notesDao.updateNote(note_id, lesson_name, first_note, second_note);
  }
}
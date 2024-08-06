import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_sqlite_block_pattern/repository/notesDao.dart';

class RecordCubit extends Cubit<void>{
  RecordCubit(): super(0);
  var notesDao= NotesDao();

  Future<void> insertNote(String lesson_name, first_note, second_note) async{
    await notesDao.insertNote(lesson_name, first_note, second_note);
  }
}
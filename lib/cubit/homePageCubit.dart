import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_sqlite_block_pattern/repository/notesDao.dart';
import '../models/note.dart';

class HomePageCubit extends Cubit<List<Note>>{
  HomePageCubit(): super(<Note>[]);
  var noteDao= NotesDao();

  Future<void> getAllNotes() async{
    var noteList= await noteDao.getAllNotes();
    emit(noteList);
  }

  Future<void> deleteNote(int note_id) async{
    await noteDao.deleteNote(note_id);
    await getAllNotes();
  }

  double calculateAvarage(List<Note> noteList){
    int toplam= 0;
    for(var note in noteList)
      {
        toplam+=note.first_note;
        toplam+=note.second_note;
      }
    return toplam/(noteList.length*2);
  }
}
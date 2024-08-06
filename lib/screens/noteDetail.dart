import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_sqlite_block_pattern/cubit/noteDetailCubit.dart';
import '../models/note.dart';

class NoteDetail extends StatefulWidget{

  Note note;
  NoteDetail({required this.note});

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail>{

  var tfLessonNameController= TextEditingController();
  var tfFirstNote= TextEditingController();
  var tfSecondNote= TextEditingController();

  @override
  void initState() {
    super.initState();
    tfLessonNameController.text= widget.note.lesson_name;
    tfFirstNote.text= widget.note.first_note.toString();
    tfSecondNote.text= widget.note.second_note.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextButton(
              child: Text("Güncelle",
              style: TextStyle(
                color: Colors.black,
              ),),
              onPressed: (){
                context.read<NoteDetailCubit>().updateNote(
                    widget.note.note_id, tfLessonNameController.text, int.parse(tfFirstNote.text), int.parse(tfSecondNote.text));
              },
            ),
          ),
        ],
        title: Text("Not Detay",
        style: TextStyle(
          color: Colors.black,
        ),),
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellowAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                controller: tfLessonNameController,
                decoration: InputDecoration(
                  hintText: "Ders Adı",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                controller: tfFirstNote,
                decoration: InputDecoration(
                  hintText: "1. Not",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                controller: tfSecondNote,
                decoration: InputDecoration(
                  hintText: "2. Not",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_sqlite_block_pattern/cubit/recordCubit.dart';

class RecordPage extends StatelessWidget{

  var tfLessonNameController= TextEditingController();
  var tfFirstNoteController= TextEditingController();
  var tfSecondNoteController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellowAccent,
        title: Text("Not Kayıt",
        style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 50, left: 50),
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
              controller: tfFirstNoteController,
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
              controller: tfSecondNoteController,
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellowAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: 3,
            color: Colors.black,
          ),
        ),
        label: Text("Kaydet",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
        icon: Icon(
          Icons.save,
          color: Colors.black,
        ),
        onPressed: (){
          context.read<RecordCubit>().insertNote(tfLessonNameController.text, int.parse(tfFirstNoteController.text), int.parse(tfSecondNoteController.text));
        },
      ),
    );
  }

}
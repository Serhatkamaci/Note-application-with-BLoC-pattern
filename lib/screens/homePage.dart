import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_sqlite_block_pattern/cubit/homePageCubit.dart';
import 'package:notes_app_sqlite_block_pattern/screens/noteDetail.dart';
import 'package:notes_app_sqlite_block_pattern/screens/recordPage.dart';
import '../models/note.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().getAllNotes();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Notlar Uygulaması",
            style: TextStyle(
              color: Colors.black,
            ),),
            BlocBuilder<HomePageCubit, List<Note>>(
                builder: (context, noteList)
                {
                  double avarage= context.read<HomePageCubit>().calculateAvarage(noteList);
                  if(avarage<0)
                  {
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    );
                  }
                  else{
                    return Text("Ortalama: ${avarage.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),);
                  }
                }
            ),
          ],
        ),
      ),

      body: BlocBuilder<HomePageCubit, List<Note>>(
        builder: (context, noteList){
          if(noteList.isNotEmpty)
            {
              return ListView.builder(
                itemCount: noteList.length,
                itemBuilder: (context, index){
                  var note= noteList[index];
                  return SizedBox(
                    height: 75,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteDetail(note: note))).
                        then((value){
                          context.read<HomePageCubit>().getAllNotes();
                        });
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.black,
                            width: 3,
                          )
                        ),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(note.lesson_name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                            Text(note.first_note.toString()),
                            Text(note.second_note.toString()),
                            IconButton(
                              icon: Icon(Icons.delete,
                                  color: Colors.black),
                              onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: Duration(seconds: 10),
                                  backgroundColor: Colors.black,
                                  content: Text("${note.lesson_name} adlı ders silinsin mi?",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    textColor: Colors.white,
                                    onPressed: (){
                                      context.read<HomePageCubit>().deleteNote(note.note_id);
                                    },
                                  ),
                                ));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          else
            {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              );
            }
        },
      ),

      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: Icon(Icons.add,
        color: Colors.black,),
        backgroundColor: Colors.yellowAccent,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> RecordPage())).
          then((value){
            context.read<HomePageCubit>().getAllNotes();
          });
        },
      ),
    );
  }
}
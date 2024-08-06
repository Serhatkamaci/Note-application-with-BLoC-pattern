import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_sqlite_block_pattern/cubit/homePageCubit.dart';
import 'package:notes_app_sqlite_block_pattern/cubit/noteDetailCubit.dart';
import 'package:notes_app_sqlite_block_pattern/cubit/recordCubit.dart';
import 'package:notes_app_sqlite_block_pattern/screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> HomePageCubit()),
        BlocProvider(create: (context)=> NoteDetailCubit()),
        BlocProvider(create: (context)=> RecordCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

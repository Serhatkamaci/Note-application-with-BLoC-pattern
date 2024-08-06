import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseAcess{

  static final String databaseName="notuygulamasi.sqlite";

  static Future<Database> databaseAcess() async{

    var databaseWay= await join(await getDatabasesPath(), databaseName);

    if(await databaseExists(databaseWay))
      {
        print("There is a database in this way!");
      }
    else
      {
        ByteData data= await rootBundle.load("database/$databaseName");
        List<int> bytes= data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(databaseWay).writeAsBytes(bytes, flush: true);
      }
    return openDatabase(databaseWay);
  }
}
import 'package:clock_app/models/alarm_info.dart';
import 'package:sqflite/sqflite.dart';

const String _tableAlarm = 'alarm';
const String _columnId = 'id';
const String _columnTitle = 'title';
const String _columnDateTime = 'alarmDateTime';
const String _columnPending = 'isPending';
const String _columnColorIndex = 'gradientColorIndex';

class AlarmHelper{
  static Database? _database = null;
  static AlarmHelper? _alarmHelper = null;

  AlarmHelper._createInstance();
  factory AlarmHelper(){
    if(_alarmHelper == null){
      _alarmHelper = AlarmHelper._createInstance();
    }
    return _alarmHelper!;
  }

  Future<Database> get database async{
    if(_database == null){
      _database =await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase()async{
    String dir =await getDatabasesPath();
    var path = "${dir}alarm.db";

    var database= openDatabase(path,
        version: 1,
        onCreate: (db,version){
        db.execute
          ('''
          create table $_tableAlarm 
          (
          $_columnId integer primary key autoincrement,
          $_columnTitle text not null,
          $_columnDateTime text not null,
          $_columnPending integer,
          $_columnColorIndex integer
          )
        ''');

    });

    return database;
  }

  Future<void> insertAlarm(AlarmInfo alarmInfo) async {
    var db =await database;
    var result = await db.insert(_tableAlarm, alarmInfo.toJson());
    print("this is result $result");
    print("Added");
  }

    Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];
      var db =await database;
      var result = await db.query(_tableAlarm);
      result.forEach((element) {
        var alarmInfo = AlarmInfo.fromJson(element);
        _alarms.add(alarmInfo);
      });

      return _alarms;


    }

    Future<int> delete (int id)async{
    var db =await database;
    return await db.delete(_tableAlarm,where: '$_columnId = ?',whereArgs: [id]);
    }


}
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

List toDoList=[];
  //reference the box
  final _myBox = Hive.box('mybox');


  // run this if this is the first time ever running this app
  void createInitialData(){
    toDoList=[
      ["make tutorial", false],
      ["Do Exercise", false],
    ];
  }

  //load data from the database
  void loadData(){
toDoList = _myBox.get("TODOLIST");


  }
  // update data from the data Base
  void updateDataBase(){
     _myBox.put("TODOLIST",toDoList);


  }
}
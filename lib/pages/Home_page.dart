import 'package:flutter/material.dart';
import 'package:flutter_1/Util/dialog_box.dart';
import 'package:flutter_1/Util/todo_tile.dart';
import 'package:flutter_1/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //if this is the first time ever a openning the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there is aleady existing Data
      db.loadData();
    }

    super.initState();
  }

  //text controller
  final _controller = TextEditingController();
  // Always clean up the controller
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  // CheckBox Changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // Save new Task
  void saveNewTask() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // Create a new Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //  Delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: const Text('To Do'),
        backgroundColor: Colors.purple.shade300,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child:const Icon(Icons.add),
      ),
// check if the list is empty
    // Check if the list is empty
    body: db.toDoList.isEmpty 
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.auto_awesome, // A cinematic/sparkle icon
                size: 80, 
                color: Colors.purple.shade300
              ),
              const SizedBox(height: 10),
              Text(
                "Your slate is clean!",
                style: TextStyle(
                  color: Colors.purple.shade400,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Tap '+' to start something new.",
                style: TextStyle(color: Colors.purple.shade300),
              ),
            ],
          ),
        )
      : ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.toDoList[index][0],
              taskComplete: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
  );
  
  }
}
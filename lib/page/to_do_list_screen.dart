import 'package:flutter/material.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<String> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void completeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Center(
          child: Text(
            'To-Do List',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors
                        .yellow, // Customize the box background color here.
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tasks[index],
                        style: const TextStyle(
                            color:
                                Colors.black), // Customize the text color here.
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.check,
                          color: Colors.black,
                        ),
                        color: Colors.white, // Customize the icon color here.
                        onPressed: () => completeTask(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 255, 230, 0),
        onPressed: () async {
          final task = await showDialog(
            context: context,
            builder: (BuildContext context) {
              String newTask = '';
              return AlertDialog(
                backgroundColor: Colors.yellow[200],
                title: const Text('Add New Task'),
                content: TextField(
                  onChanged: (value) {
                    newTask = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        newTask,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              );
            },
          );

          if (task != null && task.isNotEmpty) {
            addTask(task);
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

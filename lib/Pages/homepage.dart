import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> todoLists = [];

  var taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTodo();
  }

  void loadTodo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      todoLists = pref.getStringList("todolist") ?? [];
    });
  }

  void addTodo() async {
    if (taskController.text.isEmpty) return;

    SharedPreferences pref = await SharedPreferences.getInstance();

    todoLists.add(taskController.text.trim());

    pref.setStringList("todolist", todoLists);

    taskController.clear();

    Navigator.pop(context);

    setState(() {});
  }

  void deleteTodo(int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    todoLists.removeAt(index);

    pref.setStringList("todolist", todoLists);

    Navigator.pop(context);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "Todo Lists",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        leading: Icon(Icons.tag_faces_rounded, size: 27, color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, size: 27),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todoLists.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Card(
              elevation: 6,
              shadowColor: Colors.blue,
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      todoLists[index],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                "Are you sure?",
                                style: TextStyle(fontSize: 20),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrange.shade300,
                                  ),
                                  onPressed: () async {
                                    deleteTodo(index);
                                  },
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade400,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                elevation: 4,
                title: Text(
                  "Add a new task",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.teal),
                ),
                content: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: taskController,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 3, color: Colors.teal),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel", style: TextStyle(fontSize: 16)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade200,
                        ),
                        onPressed: () async {
                          addTodo();
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 16,
                            color: taskController.text.isEmpty
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, size: 28, color: Colors.white),
      ),
    );
  }
}

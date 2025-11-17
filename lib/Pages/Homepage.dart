import 'package:flutter/material.dart';
import 'package:todo_list/Pages/all.dart';
import 'package:todo_list/Pages/completed.dart';
import 'package:todo_list/Pages/favourites.dart';
import 'package:todo_list/Pages/pending.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> text = ["Hello1", "Hello2"];

  var titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
          bottom: TabBar(
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white54,
            ),
            indicatorColor: Colors.white,
            labelPadding: EdgeInsets.symmetric(
              horizontal: 2,
            ), // provides padding to the tab headings

            tabs: [
              Tab(text: "All"),
              Tab(text: "Completed"),
              Tab(text: "Pending"),
              Tab(text: "Favourites"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            allLists(),
            completedLists(),
            pendingLists(),
            favouriteLists(),
          ],
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  content: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(width: 3, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(width: 3, color: Colors.teal),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade300
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal.shade200
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Save"),
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
      ),
    );
  }
}

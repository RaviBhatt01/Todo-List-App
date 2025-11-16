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
            showModalBottomSheet(
              context: context,
              elevation: 5,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Add a Task.",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                labelText: 'Title',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    width: 4,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Save"),
                          ),
                        ],
                      ),
                    ],
                  ),
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

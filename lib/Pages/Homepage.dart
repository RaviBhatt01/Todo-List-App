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

  List<String> text =[
    "Hello1"
    "Hello2"
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
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
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 27),
            color: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, size: 27),
              color: Colors.white,
            ),
          ],
          bottom: TabBar(
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white54,
            ),
            indicatorColor: Colors.white,
            labelPadding: EdgeInsets.symmetric(horizontal: 7), // provides padding to the tab headings

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
            Container(
              child: allLists(),
            ),
            Container(
              child: completedLists(),
            ),
            Container(
              child: pendingLists(),
            ),
            Container(
              child: favouriteLists(),
            ),
          ],
        ),

      ),
    );
  }
}

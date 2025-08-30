import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white54,
            ),
            indicatorColor: Colors.white,
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
              color: Colors.red[100],
              child: Center(child: Text('Hey')),
            ),
            Container(
              color: Colors.grey[100],
              child: Center(child: Text('Hey2')),
            ),
            Container(
              color: Colors.blue[100],
              child: Center(child: Text('Hey3')),
            ),
            Container(
              color: Colors.green[100],
              child: Center(child: Text('Hey4')),
            ),
          ],
        ),
      ),
    );
  }
}

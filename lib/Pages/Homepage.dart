import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: buildContainer());
  }

  Column buildContainer() {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(color: Colors.grey),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("All", style: TextStyle(color: Colors.white, fontSize: 20)),
              Text(
                "Favourite",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Completed",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Pending",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            children: [
              Container(color: Colors.red[100]),
              Container(color: Colors.green[100]),
              Container(color: Colors.blue[100]),
            ],
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
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
    );
  }
}

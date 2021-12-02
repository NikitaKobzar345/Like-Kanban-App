import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/API/API.dart';
import 'package:kanban/main.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.tealAccent,
          onPressed: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[850],
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
              ),
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Text(
                "On hold",
                style: TextStyle(color: Colors.grey[300]),
              )),
              Tab(
                  icon: Text(
                "In progress",
                style: TextStyle(color: Colors.grey[300]),
              )),
              Tab(
                  icon: Text(
                "Needs review",
                style: TextStyle(color: Colors.grey[300]),
              )),
              Tab(
                  icon: Text(
                "Approved",
                style: TextStyle(color: Colors.grey[300]),
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Expanded(
                child: FutureBuilder<dynamic>(
              future: ApiService().getUserCards(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Text(snapshot.data[index]),
                        );
                      });
                }
              },
            )),
            const InProgressBody(), // your listView here
            Text(
              "Needs review",
              style: TextStyle(color: Colors.grey[300]),
            ),
            Text(
              "Approved",
              style: TextStyle(color: Colors.grey[300]),
            )
          ],
        ),
      ),
    );
  }
}

class InProgressBody extends StatelessWidget {
  const InProgressBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        height: 100,
        child: Text(
          "$index",
          style: TextStyle(color: Colors.white, fontSize: 33),
        ),
      ),
    );
  }
}

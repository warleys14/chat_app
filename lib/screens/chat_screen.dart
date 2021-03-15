import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Chat"))),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('chat').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final documents = snapshot.data.docs;
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, i) => Container(
                        padding: EdgeInsets.all(10),
                        child: Text(documents[i]['text']),
                      ));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('chat')
                .add({'text': 'Sim, e você?'});
          },
        ));
  }
}

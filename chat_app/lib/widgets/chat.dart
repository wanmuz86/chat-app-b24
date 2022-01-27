import 'package:chat_app/widgets/chat_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  final String userId;
  ChatPage({required this.userId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  var friends = [
    {
      "name":"Ariff",
      "department":"IT"
    },
    {
      "name":"Michelle",
      "department":"Marketing"
    },
    {
      "name":"Johan",
      "department":"Marketing"
    },
    {
      "name":"June",
      "department":"Sales"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Chat Page"),),
      // I'm using StreamBuilder to get list of data from Firebase
      body: StreamBuilder<QuerySnapshot>(
        // I'm getting data from the users collection/table from Firebase Firestore
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context,snapshot){
          // If the data is not there , it means it is still loading
          if (!snapshot.hasData){
            return CircularProgressIndicator();
          }
          else {
            // The data is there, and being stored insiode List
            final List<DocumentSnapshot> documents = snapshot.requireData.docs;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context,position) {
                  // If it is myself, don't show it
                  if (documents[position].id == widget.userId){
                    return Container();
                  }
                  else {
                    // If not I am going to show it on a ListTile, the email of the person
                    return Card(child: ListTile(title: Text(documents[position]["email"])));
                  }
                });
          }
        },

      )
    );
  }
}

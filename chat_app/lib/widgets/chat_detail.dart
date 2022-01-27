import 'package:flutter/material.dart';

class ChatDetail extends StatefulWidget {
  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {

  var chats = [{
    "sender":"Muz",
    "message":"Jom makan",
    "time":"12.00 pm"
  },
    {
      "sender":"Ariff",
      "message":"I already eaten",
      "time":"12.03 pm"
    },
    {
      "sender":"Muz",
      "message":"OOoo Takpelah",
      "time":"12.04 pm"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Chat Detail"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter message"
                    ),
                  ),
                ),
                TextButton(onPressed: (){}, child: Text("Send"))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index){
                return Card(
                  child: ListTile(title: Text(chats[index]["message"]!),
                    subtitle: Text("${chats[index]['sender']!} - ${chats[index]['time']} "),

                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

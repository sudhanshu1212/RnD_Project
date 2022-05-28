//import 'dart:html';

//import 'package:chat_app/chat/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:html';

class Messages extends StatelessWidget {
  //const Messages({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (ctx, AsyncSnapshot<QuerySnapshot> chatsnapshot) {
        if (chatsnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var chatDocs = chatsnapshot.data!.docs;
        print(chatDocs[0]["text"]);
        return ListView.builder(
            padding: EdgeInsets.all(25),
            itemCount: chatDocs.length,
            itemBuilder: ((context, index) => Text(chatDocs[index]["text"])));
      },
      stream: FirebaseFirestore.instance.collection('chat').snapshots(),
    );
  }
}

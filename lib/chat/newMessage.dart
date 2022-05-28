import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class newMessage extends StatefulWidget {
  //const newMessage({ Key? key }) : super(key: key);

  @override
  State<newMessage> createState() => _newMessageState();
}

class _newMessageState extends State<newMessage> {
  final controller = TextEditingController();
  void sendmeassage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user?.uid,
      'username': userData['username']
    });
    controller.clear();
  }

  var enteredMessage = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Send a message'),
            onChanged: (value) {
              setState(() {
                enteredMessage = value;
              });
            },
          ),
        ),
        IconButton(
            onPressed: enteredMessage.trim().isEmpty ? null : sendmeassage,
            icon: Icon(Icons.send))
      ]),
    );
  }
}

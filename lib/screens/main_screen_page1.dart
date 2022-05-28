import 'package:final_project/widgets/main_screen_page1_widget.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView(
        children: [
          Widget1("Chatting", "assets/image7.png", 1),
          SizedBox(
            height: 15,
          ),
          Widget1("Activities", "assets/image7.png", 2),
          SizedBox(
            height: 15,
          ),
          Widget1("Quiz", "assets/image7.png", 3),
          SizedBox(
            height: 15,
          ),
          Widget1("Documents", "assets/image7.png", 4)
        ],
      ),
    );
  }
}

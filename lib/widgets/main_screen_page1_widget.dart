import 'package:final_project/screens/activities.dart';
import 'package:final_project/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class Widget1 extends StatelessWidget {
  //const Widget1({Key? key}) : super(key: key);
  String image;
  String text;
  int index;
  Widget1(
    this.text,
    this.image,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    print(image);
    print(text);
    return Card(
      //borderRadius: BorderRadius.circular(13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Material(
          child: InkWell(
              highlightColor: Colors.purple,
              splashColor: Colors.purple,
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: ((context) => Activities())));
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) => Chat())));
              },
              child: Ink(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        image,
                        height: 150,
                        width: 200,
                      )
                    ]),
                color: index % 2 == 0 ? Colors.orange[400] : Colors.orange,
              )),
        ),
      ),
    );
  }
}

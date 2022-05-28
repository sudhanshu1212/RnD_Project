import 'package:final_project/screens/morning.dart';
import 'package:final_project/screens/night.dart';
import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.orange[50],
        //   title: Text(
        //     "Daily activities",
        //     style: TextStyle(
        //         fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        //   ),
        // ),
        backgroundColor: Colors.orange[50],
        body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(children: [
            // SizedBox(
            //   height: 15,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_outlined, color: Colors.black)),
              ],
            ),
            Card(
              //borderRadius: BorderRadius.circular(13),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Material(
                  child: InkWell(
                      highlightColor: Colors.purple,
                      splashColor: Colors.purple,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Morning())));
                      },
                      child: Ink(
                        child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                "assets/image3.png",
                                height: 150,
                                width: 200,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Morning Activities",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ]),
                        color: Colors.orange[400],
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              //borderRadius: BorderRadius.circular(13),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Material(
                  child: InkWell(
                      highlightColor: Colors.purple,
                      splashColor: Colors.purple,
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((context) => Night())));
                        //Navigator.of(context).p
                      },
                      child: Ink(
                        child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                "assets/image4.png",
                                height: 150,
                                width: 200,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Night Activities",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ]),
                        color: Colors.grey,
                      )),
                ),
              ),
            )
          ]),
        ));
  }
}

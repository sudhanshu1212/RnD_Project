import 'package:final_project/screens/main_screen_page1.dart';
import 'package:final_project/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Main_screen extends StatefulWidget {
  //const Main_screen({ Key? key }) : super(key: key);

  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  var index = 0;
  var save = "";
  void initState() {
    //helllo();
    he();
  }

  // helllo() async {
  //   // FirebaseFirestore.instance
  //   //     .collection('COLLECTION_NAME')
  //   //     .doc('TESTID1')
  //   //     .snapshots().ha;
  //   var userName = await FirebaseAuth.instance.currentUser?.uid.toString();
  //   print(userName);
  //   var lasta = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('xdp9ayZJMRbNGAXCWsIaM1B7UIn2');
  //   var hmm = lasta.get();
  //   //hmm.data();
  //   var hulla;
  //   var last = FirebaseFirestore.instance
  //       .collection('users')
  //       .snapshots()
  //       .listen((event) {
  //     event.docs.forEach((document) {
  //       if (userName == document.id.toString()) {
  //         print("hua kya");
  //         hulla = document['username'];
  //         print(
  //             "sbdbsbdsdsdsdsd ssssssssssssssssssssssssssssssssssssssssssssssssssss");
  //         setState(() {
  //           print("hora ha kya");
  //           save = hulla;
  //         });

  //         //return userName[];
  //       }
  //       print(document.id.toString());
  //       print(document['username']);
  //     });
  //   });

  //   // var newe = last.get();
  //   // var ne;
  //   // for (ne in newe.doc) {

  //   // }

  //   //last.doc().for
  //   //var las = last.doc('xdp9ayZJMRbNGAXCWsIaM1B7UIn2').snapshots();

  //   //print(las);
  //   //var hello = userName.currentUser?.uid;
  //   //print(hello);

  //   //return save;
  // }

  void he() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var userName = await FirebaseAuth.instance.currentUser?.uid.toString();
    var docSnapshot = await collection.doc(userName).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var value = data?['username']; // <-- The value you want to retrieve.
      print("sbdbsbdsdsdsdsd ");
      print(value);
      setState(() {
        save = value;
      });

      // Call setState if needed.
    }
  }

  @override
  Widget build(BuildContext context) {
    print("koko ${index}");

    //var save = helllo();
    print(save);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  //Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: ((context) => onBoard())));
                },
                icon: Icon(Icons.exit_to_app)),
            Text(
              "Hello ${save}",
              style: TextStyle(color: Colors.black, fontSize: 25),
            )
          ],
        ),
        backgroundColor: Colors.orange[50],
        elevation: 0,
      ),
      drawer: NavigationDrawer(),
      body: save == ""
          ? Center(
              child: CircularProgressIndicator(),
            )
          : index == 0
              ? Page1()
              : Text(
                  "sdsdsd ${index}",
                  style: TextStyle(fontSize: 30),
                ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.orange.shade50,
        backgroundColor: Colors.orange.shade50,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        height: 59,
        items: [
          Icon(
            Icons.home,
            color: Colors.black,
            size: 30,
          ),
          Icon(
            Icons.favorite,
            color: Colors.black,
            size: 30,
          ),
          Icon(
            Icons.person,
            color: Colors.black,
            size: 30,
          )
        ],
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple[100],
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          Text("name of that person"),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Home"),
            onTap: () {},
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Home"),
            onTap: () {},
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Home"),
            onTap: () {},
          )
        ]),
      ),
    );
  }
}

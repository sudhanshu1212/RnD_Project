import 'package:flutter/material.dart';

class Morning extends StatefulWidget {
  const Morning({Key? key}) : super(key: key);

  @override
  State<Morning> createState() => _MorningState();
}

class _MorningState extends State<Morning> {
  var isTrue = false;
  var isTrue1 = false;
  var isTrue2 = false;
  var isTrue3 = false;
  var isTrue4 = false;
  var isTrue5 = false;
  var isTrue6 = false;
  var isTrue7 = false;
  var isTrue8 = false;
  var isTrue9 = false;
  var isTrue10 = false;

  Widget design(isTru, img, txt, index) {
    print("night");
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.yellow[700]),
      //color: Colors.amber,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            //height: 150,
            width: 120,
            child: Image.network(img),
          ),
          Text(
            txt,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            //height: 40,
            //width: 60,
            child: FittedBox(
                fit: BoxFit.fill,
                child: Switch(
                    //inactiveThumbColor: Colors.red,
                    //inactiveTrackColor: Colors.red.shade300,
                    activeColor: Colors.green,
                    value: isTru,
                    onChanged: (val) {
                      setState(() {
                        if (index == 1) {
                          isTrue1 = !isTrue1;
                        } else if (index == 2) {
                          isTrue2 = !isTrue2;
                        } else if (index == 3) {
                          isTrue3 = !isTrue3;
                        } else if (index == 4) {
                          isTrue4 = !isTrue4;
                        } else if (index == 5) {
                          isTrue5 = !isTrue5;
                        } else if (index == 6) {
                          isTrue6 = !isTrue6;
                        } else if (index == 7) {
                          isTrue7 = !isTrue7;
                        } else if (index == 8) {
                          isTrue8 = !isTrue8;
                        } else if (index == 9) {
                          isTrue9 = !isTrue9;
                        } else if (index == 10) {
                          isTrue10 = !isTrue10;
                        }
                      });
                    })),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("jijij");
    return Scaffold(
        // appBar: AppBar(actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: Icon(Icons.abc)),
        // ]),
        body: Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
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
          SizedBox(
            height: 15,
          ),
          design(
              isTrue1,
              "https://t4.ftcdn.net/jpg/03/16/52/09/360_F_316520901_6CdIg4NaP04hIzrVKmnxZ11VzvxmVB8S.jpg",
              "Wake Up",
              1),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue2,
              "https://media.istockphoto.com/vectors/cartoon-a-boy-sitting-on-the-chair-vector-id1324622650?k=20&m=1324622650&s=170667a&w=0&h=ksbTlPwI951ELK5KmNVUrYNen0lyzZe144hacVXDxjQ=",
              "Sit quietly",
              2),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue3,
              "https://st3.depositphotos.com/3440865/15961/v/450/depositphotos_159614682-stock-illustration-happy-girl-brushing-teeth-cartoon.jpg",
              "Brush teeth",
              3),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue4,
              "https://thumbs.dreamstime.com/b/toilet-bowl-cartoon-drawing-simple-vector-clip-art-illustration-174225267.jpg",
              "Use the toilet",
              4),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue5,
              "https://img.freepik.com/free-vector/man-bathing-cartoon-illustration_152710-30.jpg",
              "Have a bath",
              5),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue6,
              "https://t3.ftcdn.net/jpg/03/68/87/54/360_F_368875405_OE7AmwrRIIMvC7flZ8wTOrACpE2HlFp0.jpg",
              "Dress up",
              6),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue7,
              "https://t3.ftcdn.net/jpg/00/65/97/08/360_F_65970840_txjkKo6szf42GYJekTxH3hrnicRYY8jI.jpg",
              "Have Breakfast",
              7),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue8,
              "https://thumbs.dreamstime.com/b/lunch-box-illustration-23966634.jpg",
              "Pick lunchbox",
              8),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue9,
              "https://mpng.subpng.com/20180323/spw/kisspng-bag-backpack-school-clip-art-backpack-5ab56538ecc365.1587368615218373689698.jpg",
              "Pick schoolbag",
              9),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue10,
              "https://thumbs.dreamstime.com/b/school-cartoon-vector-illustration-isolated-white-63350462.jpg",
              "Go to school",
              10),
        ],
      ),
    ));
  }
}

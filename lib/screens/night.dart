import 'package:flutter/material.dart';

class Night extends StatefulWidget {
  //const Night({ Key? key }) : super(key: key);

  @override
  State<Night> createState() => _NightState();
}

class _NightState extends State<Night> {
  // var isTrue = false;
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
  @override
  Widget design(isTru, img, txt, index) {
    print("night");
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.blueGrey[400]),
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

  Widget build(BuildContext context) {
    print("night");
    print(isTrue);
    return Scaffold(
        // appBar: AppBar(actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: Icon(Icons.abc)),
        // ]),
        body: Container(
      padding: EdgeInsets.all(15),
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
              "https://previews.123rf.com/images/katedav/katedav1409/katedav140900263/31993568-%EB%A7%8C%ED%99%94-%EA%B0%80%EC%A1%B1-%ED%95%A8%EA%BB%98-%EC%8B%9D%EC%82%AC%EB%A5%BC.jpg",
              "Have dinner",
              1),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue2,
              "https://previews.123rf.com/images/tigatelu/tigatelu1906/tigatelu190600001/124855563-wektorowa-ilustracja-kresk%C3%B3wka-szcz%C4%99%C5%9Bliwa-rodzina-na-bia%C5%82ym-tle.jpg",
              "Sit with family",
              2),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue3,
              "https://mpng.subpng.com/20180323/spw/kisspng-bag-backpack-school-clip-art-backpack-5ab56538ecc365.1587368615218373689698.jpg",
              "Pack school bag",
              3),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue4,
              "https://media-cldnry.s-nbcnews.com/image/upload/newscms/2019_20/2859736/bedroom.png",
              "Tidy you room",
              4),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue5,
              "https://st3.depositphotos.com/3440865/15961/v/450/depositphotos_159614682-stock-illustration-happy-girl-brushing-teeth-cartoon.jpg",
              "Brush your teeth",
              5),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue6,
              "https://thumbs.dreamstime.com/b/toilet-bowl-cartoon-drawing-simple-vector-clip-art-illustration-174225267.jpg",
              "Use toilet",
              6),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue7,
              "https://img.freepik.com/free-vector/cute-girl-read-book-cartoon-character-illustration_56104-344.jpg?w=2000",
              "Read Book",
              7),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue8,
              "https://www.citypng.com/public/uploads/preview/hd-cartoon-light-bulb-character-png-31627617862x78xzfjfui.png",
              "Turn lights off",
              8),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue9,
              "https://t4.ftcdn.net/jpg/00/89/35/35/360_F_89353593_1gvsjf4dyoxIzhyR31uh0l5ifJ4T3WHv.jpg",
              "Put blanket up",
              9),
          SizedBox(
            height: 15,
          ),
          design(
              isTrue10,
              "https://thumbs.dreamstime.com/b/cartoon-young-man-sleeping-bed-design-icon-flat-vector-illustration-isolated-white-background-colorfull-129432622.jpg",
              "Go to sleep",
              10),
        ],
      ),
    ));
  }
}

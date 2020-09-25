import 'dart:developer';

import 'package:flutter/material.dart';

class Wisdon extends StatefulWidget {
  @override
  _WisdonState createState() => _WisdonState();
}

class _WisdonState extends State<Wisdon> {
  int _count = 0;
  List quote = [
    "kjfdljfdsfdsfa;fjdklfdsafdsafsdakkjjhj",
    "kjfklejfadljfdfklejfadljfdfklejfadljfdfklejfadljfdfklejfadljfdlfj",
    "pppppppppppppppsfdsfdsfdsafdsafdasffaffdfpp",
    "kjfjffffdsafdffffffffdasfdasfdasfadsffff"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                  ),
                  child: Center(
                      child: Container(
                          child: Text(quote[_count % quote.length])))),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                  color: Colors.blueAccent.shade700,
                  onPressed: _showQuote,
                  icon: Icon(Icons.wb_sunny),
                  label: Text(
                    "Inspire Me",
                    style: TextStyle(fontSize: 18.3, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _count += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bussiness Card"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvater(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Mr.Phyo"),
          Text("Living in Yangon"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline),
              Text("I am freelance developer.")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvater() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width: 1.2),
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/seed/picsum/200/300"),
            fit: BoxFit.cover),
      ),
    );
  }
}

class BizCardex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard Application"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _getCard(),
            _getAvatar(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0), // later typing
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Polo Doche",
            style: TextStyle(
              fontSize: 20.1,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Do you know me?"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person_outline), Text("T: program creater.")],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width: 1.2),
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/seed/picsum/200/300"),
            fit: BoxFit.cover),
      ),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () => debugPrint("Hiwlo Email"),
          ),
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () => debugPrint("hellwo aleart"),
          )
        ],
      ),
      backgroundColor: Colors.redAccent.shade200,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomBt()
            // InkWell(
            //     child: Text(
            //       "hewllow tap",
            //       style: TextStyle(fontSize: 24.4, fontWeight: FontWeight.w700),
            //     ),
            //     onTap: () => debugPrint("tapped "))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("hellwo")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("Secone")),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm_on), title: Text("Thired"))
        ],
        onTap: (int index) {
          debugPrint("Value is $index .");
        },
      ),
    );
  }
}

class CustomBt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final sb = SnackBar(
          content: Text("Showing Snapbar"),
          backgroundColor: Colors.blueAccent,
        );
        Scaffold.of(context).showSnackBar(sb);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Tabe show snab Bar"),
      ),
    );
  }
}

// class CustomBt extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         final snapbar = SnackBar(
//           content: Text("Snap bar showing"),
//           backgroundColor: Colors.blueAccent,
//         );
//         Scaffold.of(context).showSnackBar(snapbar);
//       },
//       child: Container(
//         padding: EdgeInsets.all(10.0),
//         child: Text(
//           "Tap Me",
//           style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.3),
//         ),
//       ),
//     );
//   }
// }

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange.shade700,
      child: Center(
        child: Text(
          "hellow World",
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}

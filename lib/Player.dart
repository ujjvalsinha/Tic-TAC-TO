import 'package:flutter/material.dart';
import 'package:tictacto/Tictac.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  String name = "";

  Color col;
  final player1obj = TextEditingController();
  final player2obj = TextEditingController();
  nextpage() {
    setState(() {
      if (player1obj.text.isNotEmpty && player2obj.text.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Tictac(
                  player1obj.text.toString(), player2obj.text.toString())),
        );
      } else {
        name = 'Please Enter A Valid Name';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
              radius: 70, backgroundImage: AssetImage("images/tic.png")),
          SizedBox(
            height: 35,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 7, 25, 25),
            child: TextField(
              controller: player1obj,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Player 1 Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 7, 25, 25),
            child: TextField(
              controller: player2obj,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Player 2 Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 20, 25, 15),
            child: MaterialButton(
                color: Colors.green,
                height: 50,
                minWidth: 200,
                splashColor: Colors.green,
                child: Text(
                  "START",
                  style: TextStyle(fontSize: 20.0),
                ),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  nextpage();
                }),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            child: Text(
              name,
              style: TextStyle(fontSize: 25, color: col),
            ),
          )
        ],
      ),
    );
  }
}

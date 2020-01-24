import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Tictac extends StatefulWidget {
  String player1 = "";
  String player2 = "";
  Tictac(this.player1, this.player2);
  @override
  _TictacState createState() => _TictacState(player1, player2);
}

class _TictacState extends State<Tictac> {
  static AudioCache playersound = AudioCache();

  pressedbtn() {
    playersound.play("cross.mpeg");
  }

  Future popup() async {
    if (message == "cross" || message == "circle") {
      return showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.orangeAccent,
            title: Text(
              '      WINNER',
              style: TextStyle(color: Colors.white, fontSize: 38),
            ),
            content: Container(
              height: 300,
              width: 100,
              child: Center(
                  child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("images/winer.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  message == "cross"
                      ? Text(
                          play1,
                          style: TextStyle(color: Colors.white, fontSize: 34),
                        )
                      : Text(
                          play2,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      restart();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    color: Colors.redAccent,
                  )
                ],
              )),
            ),
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.orangeAccent,
            content: Container(
              height: 300,
              width: 100,
              child: Center(
                  child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("images/sad.png"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "MATCH DRAW",
                    style: TextStyle(color: Colors.red, fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      restart();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    color: Colors.redAccent,
                  )
                ],
              )),
            ),
          );
        },
      );
    }
  }

  String play1 = "";
  String play2 = "";
  _TictacState(this.play1, this.play2);
  AssetImage cross = AssetImage("images/cros.png");
  AssetImage circle = AssetImage("images/zero.png");
  AssetImage empty = AssetImage("images/empty.png");
  bool isCross = true;
  String message = "";
  List gameplay;
  @override
  void initState() {
    this.gameplay = [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];
    message = "";
    super.initState();
  }

  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return empty;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  game(int index) {
    if (this.gameplay[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameplay[index] = "cross";
        } else {
          this.gameplay[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.winner();
      });
    }
  }

  restart() {
    setState(() {
      this.gameplay = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
      this.isCross = true;
    });
  }

  winner() {
    if (gameplay[0] != "empty" &&
        gameplay[0] == gameplay[1] &&
        gameplay[1] == gameplay[2]) {
      setState(() {
        this.message = gameplay[0];
        popup();
      });
    } else if (gameplay[0] != "empty" &&
        gameplay[0] == gameplay[3] &&
        gameplay[3] == gameplay[6]) {
      setState(() {
        this.message = gameplay[0];
        popup();
      });
    } else if (gameplay[0] != "empty" &&
        gameplay[0] == gameplay[4] &&
        gameplay[4] == gameplay[8]) {
      setState(() {
        this.message = gameplay[0];
        popup();
      });
    } else if (gameplay[1] != "empty" &&
        gameplay[1] == gameplay[4] &&
        gameplay[4] == gameplay[7]) {
      setState(() {
        this.message = gameplay[1];
        popup();
      });
    } else if (gameplay[2] != "empty" &&
        gameplay[2] == gameplay[5] &&
        gameplay[5] == gameplay[8]) {
      setState(() {
        this.message = gameplay[2];
        popup();
      });
    } else if (gameplay[2] != "empty" &&
        gameplay[2] == gameplay[4] &&
        gameplay[4] == gameplay[6]) {
      setState(() {
        this.message = gameplay[2];
        popup();
      });
    } else if (gameplay[3] != "empty" &&
        gameplay[3] == gameplay[4] &&
        gameplay[4] == gameplay[5]) {
      setState(() {
        this.message = gameplay[3];
        popup();
      });
    } else if (gameplay[6] != "empty" &&
        gameplay[6] == gameplay[7] &&
        gameplay[7] == gameplay[8]) {
      setState(() {
        this.message = gameplay[6];
        popup();
      });
    } else if (!gameplay.contains('empty')) {
      setState(() {
        this.message = 'Draw';
        popup();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac To"),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                play1,
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                itemCount: this.gameplay.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      this.game(i);
                      pressedbtn();
                    },
                    child: Image(
                      image: this.getImage(this.gameplay[i]),
                    ),
                    shape: OutlineInputBorder(borderSide: BorderSide(width: 3)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                play2,
                style: TextStyle(fontSize: 40),
              ),
            ),
            MaterialButton(
              color: Colors.orangeAccent,
              minWidth: 300.0,
              height: 50.0,
              child: Text(
                "Reset Game",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                restart();
                pressedbtn();
              },
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        )));
  }
}

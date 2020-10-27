import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Sayfa2Screen extends StatefulWidget {
  @override
  _Sayfa2ScreenState createState() => _Sayfa2ScreenState();
}

class _Sayfa2ScreenState extends State<Sayfa2Screen> {
  bool rowlar = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            FlatButton(
              onPressed: () {
                setState(() {
                  rowlar = true;
                });
              },
              color: rowlar == true ? secondColor : null,
              shape:
                  RoundedRectangleBorder(side: BorderSide(color: secondColor)),
              child: Padding(
                padding: EdgeInsets.only(left: 35, right: 35),
                child: Text("KAHVE FALI",style: TextStyle(color: rowlar == true ? mainColor:secondColor,)),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  rowlar = false;
                });
              },
              color: rowlar == false ? secondColor : null,
              shape:
                  RoundedRectangleBorder(side: BorderSide(color: secondColor)),
              child: Text("NUMEROLOJİ ANALİZİ",style: TextStyle(color: rowlar == false ? mainColor:secondColor,)),
            ),
          ],
        ),
        Container(
          child: rowlar == true ? rowed1() : rowed2(),
        )
      ],
    );
  }

  Widget rowed1() {
    print('sadsa');
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => mesajgeldi()));
        },
        child: mesajCard(),
      ),
    );
  }

  Widget rowed2() {
    print('ass');
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => mesajgeldi()));
        },
        child: mesajCard(),
      ),
    );
  }

  Widget mesajCard() {
    return Card(
      color: thirdColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 60, right: 60, bottom: 15, top: 5),
      child: Padding(
        padding: EdgeInsets.all(1),
        child: Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.yellow],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Colors.redAccent),
              child: Image.asset(
                "lib/assets/fincan.png",
                width: 60,
                height: 60,
                color: Colors.white,
              ),
            ),
            title: Text("10 Ekim 2020 / 16:50",
                style: TextStyle(fontFamily: 'Tally')),
            subtitle: Text(
              rowlar == false ? "Analiziniz Hazırlanıyor.…" : "Falınız Hazırlanıyor.…",
            ),
          ),
        ),
      ),
    );
  }
}

class mesajgeldi extends StatefulWidget {
  Sayfa2Screen syf;

  mesajgeldi({this.syf});

  @override
  _mesajgeldiState createState() => _mesajgeldiState();
}

class _mesajgeldiState extends State<mesajgeldi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: mesajTemp(),
    );
  }

  Widget mesajTemp() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(50),
                child: Image.asset("lib/assets/trash.png"),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Image.asset("lib/assets/trash.png"),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/assets/trash.png"),
                    SizedBox(
                      width: 20,
                    ),
                    Text("10 Ekim 2020 / 16:50 Kahve Falınız"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Card(
                  color: Colors.deepPurple,
                  child: Container(
                      padding: EdgeInsets.all(20), child: falSonucu()),
                ),
              ),
              Container(
                child: Text(
                  "Bu yoruma kaç yıldız verirsiniz?",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.red)),
                    child: Text("s"),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    child: Text("s"),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    child: Text("s"),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    child: Text("s"),
                  ),
                ],
              ),
              Container(
                  child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Card(
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: secondColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 40, bottom: 40),
                    child: Text(
                      "Yorumunuzu bizimle paylaşabilirsiniz.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "GERİ...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  falSonucu() {
    return Text(
      "Merhaba!\nÖncelikle mor fincanı tercih ettiğiniz için teşekkür ederim. :)\n\n Ve aynı zamanda kahve fincanınızı tam istediğim sırayla ve çok net fotoğraf çekerek göndermişsiniz. Bunun için ayrıca teşekkür ederim.",
      style: TextStyle(fontSize: 18),
    );
  }
}

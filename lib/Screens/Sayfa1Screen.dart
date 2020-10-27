import 'dart:ui';

import 'package:flutter/material.dart';

import '../main.dart';

class Sayfa1Screen extends StatefulWidget {
  @override
  _Sayfa1ScreenState createState() => _Sayfa1ScreenState();
}

class _Sayfa1ScreenState extends State<Sayfa1Screen> {
  int durum = 0;

  @override
  Widget build(BuildContext context) {
    return _sayfa();
  }

  _iconlar(String resim, String baslik, String aciklama, int i) {
    return GestureDetector(
        onTap: () {
          setState(() {
            durum = i;
          });
        },
        child: Stack(
          children: [
            Card(
              color: thirdColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                  left: 60, right: 60, bottom: 15, top: 5),
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
                        resim,
                        width: 60,
                        height: 60,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(baslik, style: TextStyle(fontFamily: 'Tally')),
                    subtitle: Text(
                      aciklama,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFfeae00),
              ),
              margin: EdgeInsets.only(left: 260, top: 60),
              padding: EdgeInsets.only(top: 7),
              width: 100,
              height: 30,
              child: Text(
                "39.99 TL",
                style: TextStyle(
                    color: Colors.black,

                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }

  Widget _sayfa() {
    if (durum == 0) {
      return ana();
    } else if (durum == 1) {
      return kahvefali();
    } else if (durum == 2) {
      return falKisibilgi();
    } else if (durum == 3) {
      return falGonderildi();
    } else if (durum == 4) {
      return Text("fal gönderilmedi");
    } else if (durum == 5) {
      return numbasit();
    } else if (durum == 6) {
      return numstandart();
    } else if (durum == 7) {
      return numdetayli();
    } else if (durum == 8) {
      return numerogonderildi();
    } else if (durum == 9) {
      //TODO asdasdas
      return Text("Numeroloji gönderilmedi");
    } else {
      return Text("sadsa");
    }
  }

  Widget ana() {
    return Center(
      child: Column(

        //TODO asdasdas

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _iconlar("lib/assets/kahve.png", "KAHVE FALI", "Neyse halin...", 1),
          _iconlar("lib/assets/123.png", "NUMEROLOJI", "Basit", 5),
          _iconlar("lib/assets/123.png", "NUMEROLOJI", "Standart", 6),
          _iconlar("lib/assets/123.png", "NUMEROLOJI", "Ayrıntılı", 7),
        ],
      ),
    );
  }

  Widget kahvefali() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Fincanınızı  \“saat yönü\”nde çevirerek içini dört açıdan çekmelisiniz.",
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Card(
                  color: thirdColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: secondColor,
                      width: 4,
                    ),
                  ),
                  child: Container(

                    margin: EdgeInsets.only(top: 7,bottom: 7,left: 15,right: 15),
                    child:Image.asset("lib/assets/fincan1.png",width: 50,),
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(left: 38,top: 25),
                  child: Text("+",style: TextStyle(color: Colors.black,fontSize: 20),),
                )
              ],),
              Stack(children: [
                Card(
                  color: thirdColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: secondColor,
                      width: 4,
                    ),
                  ),
                  child: Container(

                    margin: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
                    child:Image.asset("lib/assets/fincan2.png",width: 50,),
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(left: 38,top: 25),
                  child: Text("+",style: TextStyle(color: Colors.black,fontSize: 20),),
                )
              ],),
              Stack(children: [
                Card(
                  color: thirdColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: secondColor,
                      width: 4,
                    ),
                  ),
                  child: Container(

                    margin: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
                    child:Image.asset("lib/assets/fincan3.png",width: 50,),
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(left: 38,top: 25),
                  child: Text("+",style: TextStyle(color: Colors.black,fontSize: 20),),
                )
              ],),
              Stack(children: [
                Card(
                  color: thirdColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: secondColor,
                      width: 4,
                    ),
                  ),
                  child: Container(

                    margin: EdgeInsets.only(top: 7,bottom: 7,left: 15,right: 15),
                    child:Image.asset("lib/assets/fincan1.png",width: 50,),
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(left: 38,top: 25),
                  child: Text("+",style: TextStyle(color: Colors.black,fontSize: 20),),
                )
              ],),
            ],
          ),
          Text("Şimdi tabağınızın resmini çekebilirsiniz.",style: TextStyle(fontSize: 18),),
          Stack(children: [
            Card(
              color: thirdColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: secondColor,
                  width: 4,
                ),
              ),
              child: Container(

                margin: EdgeInsets.only(top: 8,bottom: 8,left: 15,right: 15),
                child:Image.asset("lib/assets/tabak.png",width: 50,),
              ),

            ),
            Container(
              margin: EdgeInsets.only(left: 38,top: 25),
              child: Text("+",style: TextStyle(color: Colors.black,fontSize: 20),),
            )
          ],),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    durum = 2;
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "DEVAM...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    durum = 0;
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "GERİ...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }

  Widget falKisibilgi() {
    return Center(
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bordersidecolor, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bordersidecolor, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Adınız?',
                  labelText: 'Adınız? *',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Soyadınız?',
                  labelText: 'Soyadınız? *',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Doğum tarihiniz?',
                  labelText: 'Doğum tarihiniz? *',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Adınız',
                  labelText: 'Adınız *',
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
              SizedBox(
                height: 20,
              ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          durum = 3;
                        });
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "DEVAM...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          durum = 1;
                        });
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "GERİ...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                      SizedBox(height: 20,),
                  ],),

            ],
          )),
    );
  }

  Widget falGonderildi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Falınız en kısa sürede size iletilecektir.",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "Mor Fincan'ı \n\ntercih ettiğiniz için teşekkür ederiz.",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "lib/assets/fincan.png",
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                durum = 0;
              });
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  "GERİ...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget numbasit() {
    return Center(
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "NUMEROLOJI (BASIT)",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              _tff(
                  "Kimlikteki isminiz? (Örn: Abdullah Tolga TAN)\n", "Yazınız"),
              _tff("Kullandığınız isminiz? (Örn: Tolga)\n", "Yazınız"),
              _tff("Doğum tarihiniz?\n", "Yazınız"),
              _tff("Cinsiyetiniz?\n", "Yazınız"),
              _tff("Mesleğiniz?\n", "Yazınız"),
              _tff("İlişki durumunuz?\n", "Yazınız"),
              _tff("Eşinizin soyadını kullanıyor iseniz eski soyadınız?\n",
                  "Yazınız"),

                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        durum = 8;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "DEVAM...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        durum = 0;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "GERİ...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),


            ],
          )),
    );
  }

  Widget numstandart() {
    return Center(
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "NUMEROLOJI (STANDART)",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              _tff(
                  "Kimlikteki isminiz? (Örn: Abdullah Tolga TAN)\n", "Yazınız"),
              _tff("Kullandığınız isminiz? (Örn: Tolga)\n", "Yazınız"),
              _tff("Doğum tarihiniz?\n", "Yazınız"),
              _tff("Cinsiyetiniz?\n", "Yazınız"),
              _tff("Mesleğiniz?\n", "Yazınız"),
              _tff("İlişki durumunuz?\n", "Yazınız"),
              _tff("Eşinizin soyadını kullanıyor iseniz eski soyadınız?\n",
                  "Yazınız"),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    durum = 8;
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "DEVAM...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    durum = 0;
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "GERİ...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          )),
    );
  }

  Widget numdetayli() {
    return Center(
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "NUMEROLOJI (DETAYLI)",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              _tff("Kimlikteki adınız? (Örn: Ayşe Fatma)\n", "Yazınız"),
              _tff("Kimlikteki soyadınız? (Örn: Yılmaz)\n", "Yazınız"),
              _tff("Kullandığınız adınız? (Örn: Fatma)\n", "Yazınız"),
              _tff(
                  "3 yaşına kadar size başka bir isimle hitap edildi mi? (Örn: Esin)\n",
                  "Yazınız"),
              _tff(
                  "Doğum tarihiniz? (Kimlikte yanlış ise doğru tarihi seçiniz.)\n",
                  "Yazınız"),
              _tff("Cinsiyetiniz?\n", "Yazınız"),
              _tff("Mesleğiniz?\n", "Yazınız"),
              _tff("Mesleki unvanınız?\n", "Yazınız"),
              _tff("İlişki durumunuz?\n", "Yazınız"),
              _tff(
                  "Kimlikte yazan eşinizin soyadı ise evlenmeden önceki soyadınız?\n",
                  "Yazınız"),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    durum = 8;
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "DEVAM...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    durum = 0;
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "GERİ...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          )),
    );
  }

  Widget numerogonderildi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Numerolojiniz en kısa sürede size iletilecektir.",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "Mor Fincan'ı \n\ntercih ettiğiniz için teşekkür ederiz.",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "lib/assets/fincan.png",
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),

          RaisedButton(
            onPressed: () {
              setState(() {
                durum = 0;
              });
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFFecb756), Color(0xFF944d0d)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  "GERİ...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainColor,letterSpacing: 1,fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget _tff(String baslik, hintTekst) {
    return Column(
      children: [
        Text(baslik),
        TextFormField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber, width: 5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber, width: 2.0),
            ),
            border: OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.white),
            hintText: hintTekst,
            labelText: hintTekst,
          ),
          onSaved: (String value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
          },
          validator: (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

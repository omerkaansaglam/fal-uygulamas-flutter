import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/Models/Cinsiyet.dart';
import 'package:untitled/Widget/DatePickerBottomSheet.dart';
import 'package:untitled/Widget/DatePickerInPage.dart';

import '../main.dart';

class Sayfa1Screen extends StatefulWidget {
  @override
  _Sayfa1ScreenState createState() => _Sayfa1ScreenState();
}

const String MIN_DATETIME = '1900-01-01';
const String MAX_DATETIME = '2021-11-25';
const String INIT_DATETIME = '2019-05-17';

class _Sayfa1ScreenState extends State<Sayfa1Screen> {
  bool _isLoading = false;
  int durum = 0;
  File kahvefali1;
  File kahvefali2;
  File kahvefali3;
  File kahvefali4;
  File kahvefali5;
  TextEditingController kahvefaliAdinizController = TextEditingController();
  TextEditingController kahvefaliSoyadinizController = TextEditingController();
  TextEditingController kahvefaliDogumtarihinizController =
      TextEditingController();
  TextEditingController kahvefaliCinsiyetinizController =
      TextEditingController();
  final kahvefaliBilgiFormKey = GlobalKey<FormState>();
  final numBasitFormKey = GlobalKey<FormState>();
  DateTime _dateTime;
  List<Cinsiyet> cinsiyets = new List<Cinsiyet>();
  int selectCinsiyet = 0;
  int selectedCinsiyet;
  TextEditingController numBasitKimlikIsimController = TextEditingController();
  TextEditingController numBasitKullanIsimController = TextEditingController();
  TextEditingController numBasitDogumTarihiController = TextEditingController();
  TextEditingController numBasitMeslekController = TextEditingController();
  TextEditingController numBasitIliskiController = TextEditingController();
  TextEditingController numBasitEskiSoyisimController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return _sayfa();
  }

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.parse(INIT_DATETIME);
    Cinsiyet c1 = new Cinsiyet();
    c1.ad = "Bay";
    c1.id = 1;
    cinsiyets.add(c1);
    Cinsiyet c2 = new Cinsiyet();

    c2.ad = "Bayan";
    c2.id = 2;
    cinsiyets.add(c2);
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
                              colors: [Colors.deepOrange, Colors.yellow]),
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
    if(_isLoading){
      return Center(child: CircularProgressIndicator(),);
    }
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
              GestureDetector(
                onTap: () {
                  _showPicker1(context, 1);
                },
                child: Stack(
                  children: [
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
                        margin: EdgeInsets.only(
                            top: 7, bottom: 7, left: 15, right: 15),
                        child: Image.asset(
                          "lib/assets/fincan1.png",
                          width: 50,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 38, top: 25),
                      child: kahvefali1 == null
                          ? Text(
                              "+",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          : Icon(Icons.check),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showPicker1(context, 2);
                },
                child: Stack(
                  children: [
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
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        child: Image.asset(
                          "lib/assets/fincan2.png",
                          width: 50,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 38, top: 25),
                      child: kahvefali2 == null
                          ? Text(
                              "+",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          : Icon(Icons.check),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showPicker1(context, 3);
                },
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        _showPicker1(context, 3);
                      },
                      child: Card(
                        color: thirdColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                            color: secondColor,
                            width: 4,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15),
                          child: Image.asset(
                            "lib/assets/fincan3.png",
                            width: 50,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 38, top: 25),
                      child: kahvefali3 == null
                          ? Text(
                              "+",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          : Icon(Icons.check),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showPicker1(context, 4);
                },
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        _showPicker1(context, 4);
                      },
                      child: Card(
                        color: thirdColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                            color: secondColor,
                            width: 4,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 7, bottom: 7, left: 15, right: 15),
                          child: Image.asset(
                            "lib/assets/fincan1.png",
                            width: 50,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 38, top: 25),
                      child: kahvefali4 == null
                          ? Text(
                              "+",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          : Icon(Icons.check),
                    )
                  ],
                ),
              ),
            ],
          ),
          Text(
            "Şimdi tabağınızın resmini çekebilirsiniz.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: () {
              _showPicker1(context, 5);
            },
            child: Stack(
              children: [
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
                    margin:
                        EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                    child: Image.asset(
                      "lib/assets/tabak.png",
                      width: 50,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 38, top: 25),
                  child: kahvefali5 == null
                      ? Text(
                          "+",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                      : Icon(Icons.check),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () {
                  _kahveFaliFotoSonrasi();
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
                        BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "DEVAM...",
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
              RaisedButton(
                onPressed: () {
                  setState(() {
                    durum = 0;
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
                        BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
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
          child: Form(
            key: kahvefaliBilgiFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: kahvefaliAdinizController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: bordersidecolor, width: 5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: bordersidecolor, width: 2.0),
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
                    return value.length < 3 ? "İsmi doldurunuz" : null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: kahvefaliSoyadinizController,
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
                    return value.length < 3 ? "Soyisminizi doldurunuz" : null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onTap: () {
                    _showDatePicker(1);
                  },
                  controller: kahvefaliDogumtarihinizController,
                  readOnly: true,
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
                    return value.length < 2
                        ? "Doğum tarihinizi kontrol ediniz."
                        : null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                _listGender(),
                // TextFormField(
                //   controller: kahvefaliCinsiyetinizController,
                //   decoration: const InputDecoration(
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.amber, width: 5.0),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.amber, width: 2.0),
                //     ),
                //     border: OutlineInputBorder(),
                //     labelStyle: TextStyle(color: Colors.white),
                //     hintText: 'Cinsiyetiniz',
                //     labelText: 'Cinsiyetiniz *',
                //   ),
                //   onSaved: (String value) {
                //     // This optional block of code can be used to run
                //     // code when the user saves the form.
                //   },
                //   validator: (String value) {
                //     return value.contains('@')
                //         ? 'Do not use the @ char.'
                //         : null;
                //   },
                // ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        kahvefaliBilgiFormKey.currentState.save();
                        _kahveFaliBilgiSonrasi();
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
                            "DEVAM...",
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
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          durum = 1;
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
                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
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
    );
  }

  Widget numbasit() {
    return Center(
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child:
          Form(
            key: numBasitFormKey,
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
                    "Kimlikteki isminiz? (Örn: Abdullah Tolga TAN)\n", "Yazınız","numBasitKimlikIsimController"),
                _tff("Kullandığınız isminiz? (Örn: Tolga)\n", "Yazınız","numBasitKullanIsimController"),
                _tff("Doğum tarihiniz?\n", "Yazınız","numBasitDogumTarihiController"),
                _listGender(),
                _tff("Mesleğiniz?\n", "Yazınız","numBasitMeslekController"),
                _tff("İlişki durumunuz?\n", "Yazınız","numBasitIliskiController"),
                _tff("Eşinizin soyadını kullanıyor iseniz eski soyadınız?\n",
                    "Yazınız","numBasitEskiSoyisimController"),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      numBasitFormKey.currentState.save();
                      _numBasitKaydet();
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
                        "DEVAM...",
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
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      durum = 0;
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
          ),
          ),
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
                      "DEVAM...",
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
              RaisedButton(
                onPressed: () {
                  setState(() {

                    durum = 0;
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
                      "DEVAM...",
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
              RaisedButton(
                onPressed: () {
                  setState(() {
                    durum = 0;
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
                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
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
    );
  }

  Widget _tff(String baslik, hintTekst, [String s]) {
    return Column(
      children: [
        Text(baslik),
        TextFormField(
          onTap: (){
            if(s == "numBasitDogumTarihiController"){
              _showDatePicker(2);
            }
          },
          readOnly: s == "numBasitDogumTarihiController" ? true :false,
          controller: _tffControler(s),
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

  void _showPicker1(context, int i) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            bottom: false,
            child: Container(
              color: secondColor,
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: mainColor,
                    ),
                    title: new Text(
                      'Kamerayı kullan',
                      style: TextStyle(color: mainColor),
                    ),
                    onTap: () {
                      _imgFromCamera(i);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera(int i) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      // _imgUploadToServer(image);
      // print(image);
      switch (i) {
        case 1:
          kahvefali1 = image;
          print(kahvefali1);
          break;
        case 2:
          kahvefali2 = image;
          break;
        case 3:
          kahvefali3 = image;
          print(kahvefali3);

          break;
        case 4:
          kahvefali4 = image;
          break;
        case 5:
          kahvefali5 = image;
          break;
      }
      print(kahvefali5);
    });
  }

  Future<String> _imgUploadToServer(File img) async {
    print('resim upload başladı');
    // setState(() {
    //   _isLoading = true;
    // });
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(
        now.year, now.month, now.day, now.hour, now.second, now.microsecond);
    final ref = FirebaseStorage.instance
        .ref()
        .child('fallar')
        .child(date.toString() + ".jpg");
    StorageUploadTask uploadTask = ref.putFile(img);
    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  void _kahveFaliFotoSonrasi() {
    if(kahvefali1 == null ||kahvefali2 == null ||kahvefali3== null ||kahvefali4 == null ||kahvefali5 == null ){
    // if (false) {
      Fluttertoast.showToast(
          msg: "Fincanın tüm fotoğraflarını yükleyiniz",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: secondColor,
          textColor: mainColor,
          fontSize: 16.0);
    } else {
      setState(() {
        durum = 2;
      });
    }
  }

  void _kahveFaliBilgiSonrasi() async {

    if (kahvefaliBilgiFormKey.currentState.validate()) {
      if(selectedCinsiyet != null){
        setState(() {
          _isLoading = true;
        });
        await Firebase.initializeApp();
        var img1 = await _imgUploadToServer(kahvefali1);
        var img2 = await _imgUploadToServer(kahvefali2);
        var img3 = await _imgUploadToServer(kahvefali3);
        var img4 = await _imgUploadToServer(kahvefali4);
        var img5 = await _imgUploadToServer(kahvefali5);

        await FirebaseFirestore.instance.collection('kahveFali').add({
          'img1': img1,
          'img2': img2,
          'img3': img3,
          'img4': img4,
          'img5': img5,
          'ad': kahvefaliAdinizController.text,
          'soyad': kahvefaliSoyadinizController.text,
          'dogumTarihi': kahvefaliDogumtarihinizController.text,
          'cinsiyet': selectedCinsiyet,
          "durum": 0,
          "yuklemeZamani" : Timestamp.now()

        });
        setState(() {
          durum = 3;
          _isLoading = false;
        });
      } else {
        Fluttertoast.showToast(
            msg: "Cinsiyetinizi belirtiniz",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: secondColor,
            textColor: mainColor,
            fontSize: 16.0);
      }

    }
  }

  void _showDatePicker(int i) {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: false,
      pickerTheme: DateTimePickerTheme(
        backgroundColor: secondColor,
        itemTextStyle: TextStyle(color: mainColor),
        showTitle: true,
        confirm: Text('Tamam', style: TextStyle(color: mainColor)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _dateTime,
      dateFormat: 'dd.MMMM.yyyy',
      locale: DateTimePickerLocale.tr,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {

          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          if(i == 1){
            kahvefaliDogumtarihinizController.text =
                convertDateFromString(dateTime.toString());
          } else if( i == 2){
            numBasitDogumTarihiController.text = convertDateFromString(dateTime.toString());
          }

        });
      },
    );
  }

  convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return (formatDate(todayDate, [dd, '.', mm, '.', 'yyyy']));
  }

  _listGender() {
    //kapo
    return DropdownButton(
      dropdownColor: mainColor,

      items: cinsiyets
          .map((item) => DropdownMenuItem(
                child: Text(
                  item.ad,
                ),
                value: item.id,
              ))
          .toList(),
      onChanged: (selectedAccountType) {
        selectCinsiyet = 1;
        setState(() {
          selectedCinsiyet = selectedAccountType;
        });
      },
      value: selectedCinsiyet,
      isDense: true,
      isExpanded: true,
      hint: Text(
        'Cinsiyet seçiniz',
      ),
    );
  }

  _tffControler(String s) {
    switch (s){
      case "numBasitKimlikIsimController":
        return numBasitKimlikIsimController;
        break;
      case "numBasitKullanIsimController":
        return numBasitKullanIsimController;
        break;
      case "numBasitDogumTarihiController":
        return numBasitDogumTarihiController;
        break;
      case "numBasitMeslekController":
        return numBasitMeslekController;
        break;
      case "numBasitIliskiController":
        return numBasitIliskiController;
        break;
      case "numBasitEskiSoyisimController":
        return numBasitEskiSoyisimController;
        break;
      default :
        return null;
        break;
    }
  }

  Future<void> _numBasitKaydet() async{
    print('**********');
    if(numBasitFormKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      await Firebase.initializeApp();

      await FirebaseFirestore.instance.collection('numBasit').add({
        'kimlikIsim': numBasitKimlikIsimController.text,
        'kullanIsim': numBasitKullanIsimController.text,
        'dogumTarihi': numBasitDogumTarihiController.text,
        'cinsiyet': selectedCinsiyet,
        'meslek': numBasitMeslekController.text,
        'iliski': numBasitIliskiController.text,
        'eskiSoyisim': numBasitEskiSoyisimController.text,
        "durum": 0,
        "yuklemeZamani" : Timestamp.now()

      });
      setState(() {
        durum = 8;
        _isLoading = false;
      });
    }
  }
}

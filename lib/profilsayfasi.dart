import 'package:flutter/material.dart';
import 'gonderikarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final String isimSoyad;
  final String kullaniciAdi;
  final String kapakResmilinki;
  final String profilResimlinki;
  final String takipci;
  final String takip;
  final String paylasim;

  const ProfilSayfasi(
      {Key? key,
      required this.isimSoyad,
      required this.kullaniciAdi,
      required this.kapakResmilinki,
      required this.profilResimlinki,
      required this.takipci,
      required this.takip,
      required this.paylasim})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 230.0,
                //color: Colors.yellow,
              ),
              Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      image: NetworkImage(kapakResmilinki),
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                left: 20.0,
                bottom: 0.0,
                child: Hero(
                  tag: kullaniciAdi,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(profilResimlinki),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                top: 190.0,
                left: 145.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isimSoyad,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      kullaniciAdi,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.green[200],
                      border: Border.all(width: 2.0, color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Takip Et",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
              )
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                sayac("Takipci", takipci),
                sayac("Takip", takip),
                sayac("Paylasim", paylasim),
              ],
            ),
          ),
          GonderiKarti(
            isimSoyad: "Berk Kaya",
            gecenSure: "1 sene önce",
            aciklama: "Gecen yaz çektim",
            profilResimLinki:
                "https://media-exp1.licdn.com/dms/image/C4E03AQHyuP2CPG5OWQ/profile-displayphoto-shrink_800_800/0/1623757707891?e=1643846400&v=beta&t=COsVKW5ezWMrcN0fESjag3eoLBl29bSDGn5IR0hJFjo",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2020/08/11/15/23/tree-5480239_1280.jpg",
          ),
        ],
      ),
    );
  }

  Column sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sayi,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 1.0),
        Text(
          baslik,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

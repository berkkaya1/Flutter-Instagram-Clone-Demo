import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociaworld/gonderikarti.dart';
import 'package:sociaworld/profilsayfasi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
              size: 32.0,
            ),
            onPressed: () {},
          ),
          title: Text(
            "Instagram Clone Demo",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.purple[300],
                  size: 32.0,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            duyuru("Berk seni takip etti", "3 dk önce"),
                            duyuru("Oguz seni takip etti", "7 dk önce"),
                            duyuru("Hande seni takip etti", "20 dk önce"),
                          ],
                        );
                      });
                }),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0,
                  )
                ],
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  profileKartiOlustur(
                      "Berk",
                      "https://media-exp1.licdn.com/dms/image/C4E03AQHyuP2CPG5OWQ/profile-displayphoto-shrink_800_800/0/1623757707891?e=1643846400&v=beta&t=COsVKW5ezWMrcN0fESjag3eoLBl29bSDGn5IR0hJFjo",
                      "Berk Kaya",
                      "https://cdn.pixabay.com/photo/2021/11/15/05/52/red-fox-6796430_1280.jpg",
                      "200",
                      "100",
                      "4"),
                  profileKartiOlustur(
                      "Tommy",
                      "https://static01.nyt.com/images/2021/09/14/science/07CAT-STRIPES/07CAT-STRIPES-mediumSquareAt3X-v2.jpg",
                      "Tommy Hedgedog",
                      "https://cdn.pixabay.com/photo/2021/11/15/05/52/red-fox-6796430_1280.jpg",
                      "100k",
                      "250",
                      "88"),
                  profileKartiOlustur(
                      "Albert",
                      "https://cdn.pixabay.com/photo/2016/07/27/12/26/cat-1545174_1280.jpg",
                      "Albert Einstein",
                      "https://cdn.pixabay.com/photo/2021/11/15/05/52/red-fox-6796430_1280.jpg",
                      "7.4m",
                      "2",
                      "867"),
                  profileKartiOlustur(
                      "Chester",
                      "https://cdn.pixabay.com/photo/2017/08/04/08/01/cat-2579323_1280.jpg",
                      "Chester Field",
                      "https://cdn.pixabay.com/photo/2021/11/15/05/52/red-fox-6796430_1280.jpg",
                      "12",
                      "0",
                      "55"),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
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
            GonderiKarti(
              isimSoyad: "Oguz Gundogdu",
              gecenSure: "10 sene önce",
              aciklama: "Guzel bir gun",
              profilResimLinki:
                  "https://i.pinimg.com/originals/f1/cd/58/f1cd5827b85951092017b6ac7b420434.jpg",
              gonderiResimLinki:
                  "https://cdn.pixabay.com/photo/2021/11/01/21/31/forest-6761846_1280.jpg",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.purple[300],
          child: Icon(Icons.add_a_photo, color: Colors.white),
        ));
  }

  Padding duyuru(String mesaj, String gecenSure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mesaj,
            style: TextStyle(fontSize: 15.0),
          ),
          Text(gecenSure),
        ],
      ),
    );
  }

  Widget profileKartiOlustur(
      String kullaniciAdi,
      String resimLinki,
      String isimSoyad,
      String kapakResimLinki,
      String takipci,
      String takip,
      String paylasim) {
    return Material(
      child: InkWell(
        onTap: () async {
          bool donenVeri = await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ProfilSayfasi(
                    profilResimlinki: resimLinki,
                    kullaniciAdi: kullaniciAdi,
                    isimSoyad: isimSoyad,
                    kapakResmilinki: kapakResimLinki,
                    takipci: takipci,
                    takip: takip,
                    paylasim: paylasim,
                  )));
          if (donenVeri) {
            print("Kullanıcı Profil sayfasindan döndü");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(35.0),
                        image: DecorationImage(
                            image: NetworkImage(resimLinki), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                kullaniciAdi,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

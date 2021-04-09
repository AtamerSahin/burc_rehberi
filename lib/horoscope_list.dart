import 'package:flutter/material.dart';
import 'package:horoscope_guide/models/horoscope.dart';
import 'package:horoscope_guide/utils/strings.dart';
import 'horoscope_detail.dart';

class HoroscopeList extends StatelessWidget {
  static List<Horoscope> allHoroscopes;
  @override
  Widget build(BuildContext context) {
    allHoroscopes = dataSource();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Burç Rehberi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: preparedList(),
    );
  }

  List<Horoscope> dataSource() {
    List<Horoscope> horoscopes = [];

    for (int i = 0; i < 11; i++) {
      String smallSizeImage = Strings.BURC_ADLARI[i].toLowerCase() +
          "${i + 1}.png"; //. Koc -> koc1.png

      String bigSizeImage = Strings.BURC_ADLARI[i].toLowerCase() +
          "_buyuk" +
          "${i + 1}.png"; // Koc -> koc_buyuk1.png

      Horoscope horoscope = new Horoscope(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          smallSizeImage,
          bigSizeImage);
      horoscopes.add(horoscope);
    }

    return horoscopes;
  }

  Widget preparedList() {
    return ListView.builder(
      itemCount: allHoroscopes.length,
      itemBuilder: (context, index) {
        return singleLineHoroscope(context, index);
      },
    );
  }

  Widget singleLineHoroscope(BuildContext context, int index) {
    Horoscope instantAddedHoroscope = allHoroscopes[index];
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/HoroscopeDetail/$index");
          // Navigator.push(context,MaterialPageRoute(builder: (context) => HoroscopeDetail()));
        },
        title: Text(instantAddedHoroscope.horoscopeName,
            style: TextStyle(fontSize: 20)),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.orange,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(instantAddedHoroscope.horoscopeDate),
        ),
        leading: Image.asset(
          "images/" + instantAddedHoroscope.horoscopeSmallSizeImg,
          width: 64,
          height: 64,
        ),
      ),
    );
  }
}

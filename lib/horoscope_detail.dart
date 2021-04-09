import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'horoscope_list.dart';
import 'models/horoscope.dart';

class HoroscopeDetail extends StatefulWidget {
  int incomingIndex;

  HoroscopeDetail(this.incomingIndex);

  @override
  _HoroscopeDetailState createState() => _HoroscopeDetailState();
}

class _HoroscopeDetailState extends State<HoroscopeDetail> {
  Horoscope selectedHoroscope;
  Color dominant;
  PaletteGenerator paletteGenerator;
  @override
  void initState() { 
    super.initState();
     selectedHoroscope = HoroscopeList.allHoroscopes[widget.incomingIndex];
    findDominantColor();
  }

  void findDominantColor() {
    Future<PaletteGenerator> fPaletteGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + selectedHoroscope.horoscopeBigSizeImg));
    fPaletteGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(paletteGenerator.dominantColor.color.toString());

      setState(() {
        dominant = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: dominant != null ? dominant : Colors.orange,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(selectedHoroscope.horoscopeName,
                  style: TextStyle(color: Colors.white)),
              background: Image.asset(
                  "images/" + selectedHoroscope.horoscopeBigSizeImg,
                  fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            // decoration: BoxDecoration(
            //     color: Colors.orange,
            //     borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Text(
                selectedHoroscope.horoscopeDetail,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

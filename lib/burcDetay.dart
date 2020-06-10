import 'package:flutter/material.dart';
import 'package:flutterburcrehberi/burcListe.dart';
import 'package:flutterburcrehberi/models/burc.dart';
import 'package:palette_generator/palette_generator.dart';
class BurcDetay  extends StatefulWidget {

  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color dominantRenk;
  PaletteGenerator paletteGenerator;
  @override
  void initState() {

    super.initState();
    secilenBurc=BurcListesi.tumBurclar[widget.gelenIndex];
    doninatBul();
  }

  void doninatBul(){
    Future<PaletteGenerator> palet= PaletteGenerator.fromImageProvider(AssetImage("images/"+secilenBurc.buyukResim));
    palet.then((value){
      paletteGenerator=value;
      setState(() {
        dominantRenk=paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: dominantRenk != null ? dominantRenk: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/"+secilenBurc.buyukResim,fit: BoxFit.cover,),
              title: Text(secilenBurc.burcAdi+" Burcu ve Özellikleri",),
              centerTitle: true,
            ),

          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              child: SingleChildScrollView(
                child: Text(secilenBurc.burcDetay,style: TextStyle(fontSize: 18,color: Colors.black),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

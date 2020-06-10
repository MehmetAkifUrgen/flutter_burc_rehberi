import 'package:flutter/material.dart';
import 'package:flutterburcrehberi/models/burc.dart';
import 'package:flutterburcrehberi/utils/strings.dart';

class BurcListesi extends StatelessWidget {

  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {

    tumBurclar=veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),

      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar=[];

    for (int i=0;i<12;i++){
      String kucukresim=Strings.BURC_ADLARI[i].toLowerCase()+"${i+1}.png"; //resim stringi alma
      String buyukresim=Strings.BURC_ADLARI[i].toLowerCase()+"_buyuk${i+1}.png";
      Burc eklenecekler=Burc(Strings.BURC_ADLARI[i],Strings.BURC_TARIHLERI[i],Strings.BURC_GENEL_OZELLIKLERI[i],kucukresim,buyukresim);//tüm veriyi çekme
      burclar.add(eklenecekler);
    }
    return burclar;

  }

  Widget listeyiHazirla() {
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      return tekSatir(context,index);
    },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatir(BuildContext context, int index) {
    Burc burcSirala=tumBurclar[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          onTap: ()=> Navigator.pushNamed(context, "/burcDetay/$index"),
          leading: Image.asset("images/"+burcSirala.kucukResim,width: 64,height: 64,),
          title: Text(burcSirala.burcAdi,style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.pink.shade500,
          ),),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              burcSirala.burcTarihi,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black38,
              ),
            ),
          ) ,
          trailing:Icon(Icons.arrow_forward_ios, color: Colors.pink,) ,
        ),
      ),
    );
    
  }


}

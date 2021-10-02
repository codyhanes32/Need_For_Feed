import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class beerVault extends StatefulWidget {
  const beerVault({Key? key}) : super(key: key);

  @override
  _beerVaultState createState() => _beerVaultState();
}
class _beerVaultState extends State<beerVault> {

  var beerList = [];
  _beerVaultState(){
    FirebaseDatabase.instance.reference().child("beer").once()
        .then((data){
          print("Data loaded Successfully");
          var tempList = [];
          data.value.forEach((k,v){
            tempList.add(v);
          });
          beerList = tempList;
          setState(() {

          });
    }).catchError((error){
          print("Data failed to load");
          print(error);
    });
  }

  getMyColor(var beerType, int index) {
    if (beerType[index]['type'] == 'Blonde Ale')
      return Colors.amber[100];
    else if(beerType[index]['type'] == 'Lager')
      return Colors.amber[200];
    else if(beerType[index]['type'] == 'Indian Pale Ale (IPA)')
      return Colors.amber[300];
  }
  //final List<String> beer = ["Coors", "Bud", "Miller"];
  //final List<int> colorCodes = [100, 200, 300];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: Text('Vault'),
      ),

      body: ListView.builder(
        itemCount: beerList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height:80,
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
            color: getMyColor(beerList, index),
            child: Column(
              children: [
                  Container(
                    child: Text('${beerList[index]['name']}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 7),
                      child: Text('${beerList[index]['type']}',
                        textAlign: TextAlign.center,),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: Text('${beerList[index]['rating']}',
                        textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

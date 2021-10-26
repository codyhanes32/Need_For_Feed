import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:need_for_feed/beerNotes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
            print(v);
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
      return Colors.yellowAccent[100];
    else if(beerType[index]['type'] == 'Lager')
      return Colors.amber[300];
    else if(beerType[index]['type'] == 'Indian Pale Ale (IPA)')
      return Colors.amberAccent[200];
    else if(beerType[index]['type'] == 'Brown Ale')
      return Colors.brown[400];
    else if(beerType[index]['type'] == 'Porter')
      return Colors.brown;
    else if(beerType[index]['type'] == 'Stout')
      return Colors.black;
    else if(beerType[index]['type'] == 'Sour')
      return Colors.redAccent;
    else if(beerType[index]['type'] == 'Pilsner')
      return Colors.amberAccent[200];
    else if(beerType[index]['type'] == 'Pale Ale')
      return Colors.amberAccent[100];
    else if(beerType[index]['type'] == 'Wheat')
      return Colors.yellow;
    else if(beerType[index]['type'] == 'Ale')
      return Colors.amber[500];

  }
  
  getTextColor(var beerType, int index){
    if(beerType[index]['type'] == 'Stout')
      return Colors.white;
  }
  //final List<String> beer = ["Coors", "Bud", "Miller"];
  //final List<int> colorCodes = [100, 200, 300];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Beer Vault'),
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        itemCount: beerList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => beerNotes(beerList[index])));
            },
            title: Container(
              height: 90,
              color: getMyColor(beerList, index),
              child: Column(
                children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: Text('${beerList[index]['name']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: getTextColor(beerList, index)
                        ),
                      ),
                    ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        child: Text('${beerList[index]['type']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: getTextColor(beerList, index)
                          ),),

                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: Text('${beerList[index]['rating']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: getTextColor(beerList, index)
                          ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

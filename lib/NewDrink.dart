import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:need_for_feed/insertSuccess.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewDrink extends StatefulWidget {
  const NewDrink({Key? key}) : super(key: key);

  @override
  _NewDrinkState createState() => _NewDrinkState();
}
class _NewDrinkState extends State<NewDrink> {
  double beerRating = 3;
  List<String> options = <String>['Ale', 'Lager', 'Porter', 'Stout', 'Blonde Ale', 'Brown Ale',
    'Pale Ale', 'Indian Pale Ale (IPA)', 'Wheat', 'Pilsner', 'Sour'];
  String dropdownValue = 'Ale';
  var beerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      resizeToAvoidBottomInset : false,
      appBar: AppBar(

        title: Text('Beer Vault'),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              margin: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
              child: TextField(
                controller: beerName,
                decoration: const InputDecoration(
                    fillColor: Colors.white, filled: true,
                    border: OutlineInputBorder(),
                    hintText: 'Beer Name'
                ),
              ),
            ),

            Container(
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text('Select Beer Type',
                  style: TextStyle(
                    fontFamily: 'Hind',
                    color: Colors.black,
                    height: 1,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  )),

                  Container(
                      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                      height: 30,
                      width: 70,
                      child: DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                        },
                      style: const TextStyle(color: Colors.blue),
                      selectedItemBuilder: (BuildContext context) {
                        return options.map((String value) {
                          return Text(
                            dropdownValue,
                            style: const TextStyle(color: Colors.black),
                          );
                        }).toList();
                        },
                      items: options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Text('Rating',
                      style: TextStyle(
                        fontFamily: 'Hind',
                        color: Colors.black,
                        height: 1,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.blueAccent,
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      beerRating = rating;
                    },
                  ),
                ),
                ],
              ),
            ),

            Container(
                margin: new EdgeInsets.symmetric(vertical: 60.0),
                width:150,
                height: 40,
                child:ElevatedButton(
                    onPressed: (){
                      var timestamp = new DateTime.now().millisecondsSinceEpoch;
                      FirebaseDatabase.instance.reference().child("beer/beer" + timestamp.toString()).set(
                        {
                          "name" : beerName.text,
                          "rating" : beerRating,
                          "type" : dropdownValue
                        }
                      ).then((value) {
                        print("Beer successfully added");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => insertSuccess()),
                        );
                      }).catchError((error){
                        print("Failed to add." + error.toString());
                      });

                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent
                    ),
                    child: Text(
                      'Insert Beer',
                      style:
                      TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                )
            ),

          ],
        ),
      ),
    );
  }
}

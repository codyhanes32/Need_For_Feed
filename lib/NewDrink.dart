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
  var notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[100],
      resizeToAvoidBottomInset : false,
      appBar: AppBar(

        title: Text(''),
        backgroundColor: Colors.blue,

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 30),
              child: TextField(
                controller: beerName,
                decoration: InputDecoration(

                    fillColor: Colors.cyanAccent, filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Beer Name'
                ),
              ),
            ),

            Container(
              height: 100,
              margin: new EdgeInsets.only(left:10),
              child: Column(
                children: [
                  Container(
                      margin: new EdgeInsets.only(left: 10, top: 20),
                      height: 40,
                      width: 100,
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
                            style: const TextStyle(color: Colors.black,
                            fontSize: 30),
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
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [

                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 50,
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
                  Text('Rating')
                ],
              ),
            ),


            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: notes,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                    fillColor: Colors.white, filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Additional Notes ie. where beer is from, taste notes'
                ),
              ),
            ),

            Container(
                margin: new EdgeInsets.symmetric(vertical: 10.0),
                width:150,
                height: 40,
                child:ElevatedButton(
                    onPressed: (){
                      var timestamp = new DateTime.now().millisecondsSinceEpoch;
                      FirebaseDatabase.instance.reference().child("beer/beer" + timestamp.toString()).set(
                        {
                          "name" : beerName.text,
                          "rating" : beerRating,
                          "type" : dropdownValue,
                          "notes": notes.text
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

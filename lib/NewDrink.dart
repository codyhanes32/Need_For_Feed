import 'package:flutter/material.dart';

class NewDrink extends StatefulWidget {
  const NewDrink({Key? key}) : super(key: key);

  @override
  _NewDrinkState createState() => _NewDrinkState();
}

class _NewDrinkState extends State<NewDrink> {
  double rating = 3;
  String beerType = 'Ale';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(

        title: Text('Beer Vault'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                decoration: const InputDecoration(
                    fillColor: Colors.white, filled: true,
                    border: OutlineInputBorder(),
                    hintText: 'Beer Name'
                ),
              ),
            ),



              Container(
                margin: new EdgeInsets.symmetric(vertical: 40.0),
                child:Row(
                  children:[
                    Text('Terrible'),
                    Container(
                      width: 275,
                      child:Slider(value: rating,
                        onChanged: (newRating){
                          setState(() => rating = newRating);
                        },
                        min: 1,
                        max: 5,
                        divisions: 8,
                        label: "$rating",
                      ),
                    ),
                    Text('Delicious'),
                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }
}

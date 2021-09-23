import 'package:flutter/material.dart';

class NewDrink extends StatefulWidget {
  const NewDrink({Key? key}) : super(key: key);

  @override
  _NewDrinkState createState() => _NewDrinkState();
}
class _NewDrinkState extends State<NewDrink> {
  double rating = 3;
  List<String> options = <String>['Ale', 'Lager', 'Porter', 'Stout', 'Blonde Ale', 'Brown Ale',
    'Pale Ale', 'Indian Pale Ale (IPA)', 'Wheat', 'Pilsner', 'Sour'];
  String dropdownValue = 'Ale';

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
              child: Text('New Beer',
              style: TextStyle(
                fontFamily: 'Hind',
                color: Colors.blueAccent,
                fontSize: 70,
              )),
            ),

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
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
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
                      margin: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
                      height: 30,
                      width: 180,
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
                margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 10.0),
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

            Container(
                margin: new EdgeInsets.symmetric(vertical: 60.0),
                width:150,
                height: 40,
                child:ElevatedButton(
                    onPressed: (){
                      //todo
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

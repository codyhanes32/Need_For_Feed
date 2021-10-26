import 'package:flutter/material.dart';
import 'package:need_for_feed/main.dart';
import 'package:need_for_feed/beerVault.dart';

class insertSuccess extends StatefulWidget {
  const insertSuccess({Key? key}) : super(key: key);

  @override
  _insertSuccessState createState() => _insertSuccessState();
}

class _insertSuccessState extends State<insertSuccess> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyanAccent[100],

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(''),

        ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 150),
              child: Text('Beer Successfully Inserted',
              style: TextStyle(color: Colors.blue,
              fontSize: 30),),
            ),

            Container(
                margin: EdgeInsets.all(10),
                width:150,
                height: 40,
                child:ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent
                    ),
                    child: Text(
                      'Home',
                      style:
                      TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                )
            ),
            Container(
                margin: EdgeInsets.all(10),
                width:150,
                height: 40,
                child:ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => beerVault()),
                      );
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent
                    ),
                    child: Text(
                      'View Vault',
                      style:
                      TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                )
            ),
          ],
        )
      )
    );
  }
}

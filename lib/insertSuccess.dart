import 'package:flutter/material.dart';

class insertSuccess extends StatefulWidget {
  const insertSuccess({Key? key}) : super(key: key);

  @override
  _insertSuccessState createState() => _insertSuccessState();
}

class _insertSuccessState extends State<insertSuccess> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[100],
        appBar: AppBar(

          title: Text(''),

        ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 150),
              child: Text('Beer Successfully Inserted',
              style: TextStyle(color: Colors.green,
              fontSize: 30),),
            ),
          ],
        )
      )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:need_for_feed/beerVault.dart';
import 'package:firebase_database/firebase_database.dart';

class beerNotes extends StatefulWidget {

  var beerDetails;
  beerNotes(this.beerDetails);

  @override
  _beerNotesState createState() => _beerNotesState();
}

class _beerNotesState extends State<beerNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Center(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 180, bottom: 50),
            child: Text("${widget.beerDetails['name']}",
            style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Colors.cyan),)
          ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Type: " + "${widget.beerDetails['type']}",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left)
                ), Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Rating: " + "${widget.beerDetails['rating']}" + " Stars",
                      style: TextStyle(fontSize: 20),),
                ),  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Notes: " + "${widget.beerDetails['notes']}",
                      style: TextStyle(fontSize: 20),)
                ),
                Container(
                  margin: EdgeInsets.only(top: 100, left: 30),
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
                        backgroundColor: Colors.cyanAccent,

                      ),
                      child: Text(
                        '<-- Go Back',
                        style:
                        TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                  ),
                ),

        ],
      ) ,
      ),
    );
  }
}

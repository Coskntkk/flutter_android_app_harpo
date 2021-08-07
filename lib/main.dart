import 'package:flutter/material.dart';
import 'harpo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputMes = TextEditingController();
    final inputKey = TextEditingController();
    final outputMes = TextEditingController();
    final outputKey = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          title: Center(
            child: Text(
              "Harpo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: "Oxanium",
              ),
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey.shade700,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
                SizedBox(height: 15),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  color: Color.fromRGBO(207, 216, 220, 100),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Encryption",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "FiraCode"),
                      ),
                      TextField(
                        controller: inputMes,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter a message"),
                        maxLines: 5,
                        style: TextStyle(fontFamily: "FiraCode"),
                      ),
                      TextField(
                        controller: inputKey,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter a key"),
                        maxLines: 1,
                        style: TextStyle(fontFamily: "FiraCode"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          outputMes.text =
                              harpo(inputMes.text, int.parse(inputKey.text), 0);
                          inputMes.text = "";
                          inputKey.text = "";
                        },
                        child: Text("Encrypt"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                  width: 300,
                  child: Divider(
                    color: Color.fromRGBO(189, 189, 189, 100),
                    thickness: 2,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  color: Color.fromRGBO(207, 216, 220, 100),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Decryption",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "FiraCode"),
                      ),
                      TextField(
                        controller: outputMes,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter a code"),
                        maxLines: 5,
                        style: TextStyle(fontFamily: "FiraCode"),
                      ),
                      TextField(
                        controller: outputKey,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter a key"),
                        maxLines: 1,
                        style: TextStyle(fontFamily: "FiraCode"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          inputMes.text = harpo(
                              outputMes.text, int.parse(outputKey.text), 1);
                          outputMes.text = "";
                          outputKey.text = "";
                        },
                        child: Text("Decrypt"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

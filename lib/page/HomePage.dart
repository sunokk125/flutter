import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<HomePage> {
  void dispose() {
    print("dispose() of LoginPage");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.camera),
          backgroundColor: Color.fromRGBO(52, 73, 94, 1),
          onPressed: () {
            print("2");
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 200, 0, 100),
                    child: Text(
                      "Camera Page",
                      style: TextStyle(color: Colors.white, fontSize: 48),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

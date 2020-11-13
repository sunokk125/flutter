import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyPage extends StatefulWidget {
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<MyPage> {
  void dispose() {
    print("dispose() of LoginPage");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "MyPage",
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

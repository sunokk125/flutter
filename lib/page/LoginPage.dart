import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          "10716280076-qv021j14557r42kb2v43n0jl7bk94bru.apps.googleusercontent.com");

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
                      "Welcome",
                      style: TextStyle(color: Colors.white, fontSize: 48),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  GoogleSignInButton(onPressed: () {
                    googleLogIn();
                  }),
                  FacebookSignInButton(onPressed: () {
                    Navigator.pushNamed(context, '/main');
                  }),
                ],
              )
            ],
          )),
    );
  }

  void googleLogIn() async {
    GoogleSignInAccount user = await googleSignIn.signIn();
    if (user == null) {
      print("user is null");
    } else {
      Navigator.pushNamed(context, '/main');
    }
  }
}

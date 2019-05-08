import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:saladtri/src/utils/form_icon.dart';
import 'package:saladtri/src/ui/dashboard_screen.dart';
import 'package:saladtri/src/ui/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String username, password;

  final forgotPassword = SnackBar(content: Text('Forgot Password'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Form(
          child: FormUI(),
          key: _key,
          autovalidate: _validate,
        ),
      ),
    );
  }

  Widget FormUI() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              child: Image.asset(
                "images/background_bezier_four.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Image.asset(
                "images/background_bezier_three.png",
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.11 * MediaQuery.of(context).size.height),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: 0.19 * MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "images/logo_white.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Saladtri",
                      style: TextStyle(
                          fontFamily: 'Quantify',
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      "A healthy body eats healthy food",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 11,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 18, top: 18, right: 18, bottom: 18),
          alignment: Alignment.centerLeft,
          child: Text(
            "Sign In!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 36, right: 36, bottom: 18),
          child: TextFormField(
            cursorColor: Color(0xffc00d23),
            decoration: InputDecoration(
              hintText: "Username",
              prefixIcon: Icon(FormIcon.username),
              counterText: "",
            ),
            maxLength: 16,
            validator: validateUsername,
            onSaved: (String val) {
              username = val;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 36, right: 36),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            cursorColor: Color(0xffc00d23),
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(FormIcon.password),
              counterText: "",
            ),
            maxLength: 16,
            validator: validatePassword,
            onSaved: (String val) {
              password = val;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, right: 36),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Scaffold.of(context).showSnackBar(forgotPassword);
            },
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 24, bottom: 24),
          child: GradientButton(
            increaseWidthBy: 60,
            gradient: LinearGradient(
                colors: const [Color(0xfffe8c00), Color(0xfff83600)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
            child: Text(
              "Login Now",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ),
            callback: () {
              _login();
            },
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text(
                    "Register!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  String validateUsername(String value) {
    if (value.length == 0) {
      return "Username is Required";
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return "Password is Required";
    }
    return null;
  }

  _login() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Username $username");
      print("Password $password");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DashboardScreen()));
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:saladtri/src/utils/form_icon.dart';
import 'package:saladtri/src/ui/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String username, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            child: FormUI(),
            key: _key,
            autovalidate: _validate,
          ),
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
                "images/background_bezier_one.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Image.asset(
                "images/background_bezier_two.png",
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
          margin: EdgeInsets.only(left: 18, top: 18, right: 18, bottom: 12),
          alignment: Alignment.centerLeft,
          child: Text(
            "Register!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 36, right: 36, bottom: 8),
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
          margin: EdgeInsets.only(left: 36, right: 36, bottom: 8),
          child: TextFormField(
            cursorColor: Color(0xffc00d23),
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(FormIcon.email),
              counterText: "",
            ),
            maxLength: 16,
            validator: validateEmail,
            onSaved: (String val) {
              email = val;
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
          margin: EdgeInsets.only(top: 28, bottom: 28),
          child: GradientButton(
            increaseWidthBy: 60,
            gradient: LinearGradient(
                colors: const [Color(0xfffe8c00), Color(0xfff83600)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
            child: Text(
              "Register Now",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ),
            callback: () {
              _register();
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Already have an account?",
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
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Sign In!",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
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

  _register() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Username $username");
      print("Password $password");
      print("Email $email");
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}

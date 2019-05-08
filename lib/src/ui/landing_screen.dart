import 'package:flutter/material.dart';
import 'package:saladtri/src/ui/login_screen.dart';
import 'package:saladtri/src/ui/register_screen.dart';
import 'package:saladtri/src/widget/raised_gradient_button.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class LandingScreen extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xfffe8c00), Color(0xfff83600)],
  ).createShader(Rect.fromLTWH(0.0, 90.0, 0.0, 90.0));

  @override
  Widget build(BuildContext context) {
    print("ratio pixel ${MediaQuery.of(context).devicePixelRatio}");

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: <Widget>[
          Container(
            child: SizedBox.expand(
              child: Image.asset(
                "images/landing_background.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: (0.15 * MediaQuery.of(context).size.height)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text('Welcome to',
                          style: TextStyle(
                              fontFamily: 'Quantify',
                              fontSize: 28,
                              letterSpacing: 1.5)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: GradientText("Saladtri",
                          shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 25.0),
                          gradient: LinearGradient(
                              colors: const [
                                Color(0xfffe8c00),
                                Color(0xfff83600)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          style: TextStyle(
                              fontFamily: 'Quantify',
                              fontSize: 28,
                              letterSpacing: 1.5)),
                    )
                  ],
                ),
                Text(
                  "A healthy body eats healthy food",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 0.70 * MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "images/cloud.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 0.79 * MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "images/logo_group.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 81),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: GradientButton(
                        increaseWidthBy: 110,
                        gradient: LinearGradient(
                            colors: const [
                              Color(0xfffe8c00),
                              Color(0xfff83600)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        child: Text(
                          "Sign In Now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      )),
                      Container(
                        width: 200,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      final ajigKasal = SnackBar(content: Text('Ajig kasal!'));
                      Scaffold.of(context).showSnackBar(ajigKasal);
                    },
                    child: Text(
                      "Terms of service",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          letterSpacing: 0.1),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

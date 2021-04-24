import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  bool checker = false;

  @override
  Widget build(BuildContext context) {

    var widget1 = Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 4,color: Colors.redAccent.shade200)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/scorpio.png',fit: BoxFit.fill),
        ],
      ),
    );

    var widget2 = Container(
      margin: EdgeInsets.all(25),
      width: 300,
      color: Colors.green.shade900,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("click button to see my zodiac sign",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),
      ),
    );

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red.shade50,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.0,),
                Text("Guess My zodiac sign",style: TextStyle(fontSize: 30,),),
                AnimatedSizeAndFade(
                  vsync: this,
                  sizeCurve: Curves.fastOutSlowIn,
                  sizeDuration: Duration(milliseconds: 900),
                  fadeDuration: Duration(milliseconds: 600),
                  fadeInCurve: Curves.bounceIn,
                  fadeOutCurve: Curves.fastOutSlowIn,
                  child: checker ? widget1 : widget2,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: MaterialButton(
                    color: Colors.green,
                    child: checker == false? Text('open!') : Text('close'),
                    onPressed: ()
                    {
                      setState(() {
                        checker = !checker;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:scoped_model/scoped_model.dart';

import 'scopedModels/itemScopedModel.dart';

void main() {
  runApp(MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.amber, accentColor: Colors.amberAccent),
    home: CustomSplash(
      imagePath: 'assets/combine.png',
      backGroundColor: Color(0xFFF1F1F2),
      logoSize: 200,
      home: MyHomePage(),
      //customFunction: duringSplash,
      duration: 2500,
      type: CustomSplashType.StaticDuration,
    ),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              color: Color(0xFFF1F1F2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('square.png'),
                      radius: 35.0,
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'text.png',
                          height: 50.0,
                        ),
                        Text(
                          'Price List App',
                          style: TextStyle(
                              color: Color(0xFF800000),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ScopedModel(
                model: ItemsScopedModel(),
                child: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  color: Color(0xFFF1F1F2),
                  child: ScopedModelDescendant(builder: (BuildContext context,
                      Widget child, ItemsScopedModel model) {
                    return model.allItemsFutureBuilder(context);
                  }),
                  //height: MediaQuery.of(context).size.height - 50.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

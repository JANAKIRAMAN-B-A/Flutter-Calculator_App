import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {

  int firnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operationoperform;

  void btnclicked(String btntext){
    if(btntext == "C"){
      texttodisplay = "";
      firnum = 0;
      secondnum = 0;
      res = "";
    }else if(btntext == "+" || btntext == "-" || btntext == "*" || btntext == "/" ) {
      firnum = int.parse(texttodisplay);
      res = "";
      operationoperform = btntext;
    }
    else if(btntext == "="){
      secondnum = int.parse(texttodisplay);
      if(operationoperform == "+"){
        res = (firnum + secondnum).toString();
      }
      if(operationoperform == "-"){
        res = (firnum - secondnum).toString();
      }
      if(operationoperform == "*"){
        res = (firnum + secondnum).toString();
      }
      if(operationoperform == "/"){
        res = (firnum ~/ secondnum).toString();
      }
    }else{
      res = int.parse(texttodisplay + btntext).toString();
    }

    setState((){

      texttodisplay = res;
    });
  }


  Widget custombutton(String btnval){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),

              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),

              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("*"),

              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
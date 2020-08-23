import 'package:flutter/material.dart';

class Ebc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new EbcState();
  }
}

class EbcState extends State<Ebc> {
  final TextEditingController _previousReading = new TextEditingController();
  final TextEditingController _currentReading = new TextEditingController();
  double difference = 0;
  double sum = 0;
  String _finalResult1 = '';
  String _finalResult2 = '';
  String _finalBill = '';
  double discount = 0;
  double bill = 0;
  void _calculateEbc() {
    setState(() {
      double _preRead = double.parse(_previousReading.text);
      double _curRead = double.parse(_currentReading.text);
      
      if((_previousReading.text.isNotEmpty || _preRead > 0)
      && (_currentReading.text.isNotEmpty || _curRead > 0)) {
        difference = _curRead - _preRead;
      }

      if(difference > 0 && difference <= 20){
        sum = difference*3.0 +30 ;
      }

      else if(difference > 20 && difference <= 30){
        sum = (difference-20)*7 + 20*3.0 +50.0 ;
      }

      else if(difference > 30 && difference <= 50){
        sum = (difference-30)*8.5 + 10*7 + 20*3 +75;
      }

      else if(difference > 50 && difference <= 150){
        sum = (difference-50)*10.0 + 20*8.5 + 10*7.0 + 20*3.0 +100.0;
      }

      else if(difference > 150 && difference <= 250){
        sum = (difference-150)*11.0 + 100*10.0 + 20*8.5 + 10*7.0 + 20*3.0 +125.0;
      }

      else if(difference > 250 && difference <= 400){
        sum = (difference-250)*12.0 + 100*11.0 + 100*10 + 20*8.5 + 10*7.0 + 20*3.0 +150.0;
      }

      else if(difference > 400){
        sum = (difference-400)*13.0 +150*12.0 + 100*11.0 + 100*10 + 20*8.5 + 10*7.0 + 20*3.0 +150.0;
      }
      else {
      sum = 0;
      }
      
      discount = sum * 0.02;
      bill = sum - discount;
    });
      _finalResult1 = 'Your Bill is ${sum.toStringAsFixed(1)}' ;
      _finalResult2 = 'Discound Amount is ${discount.toStringAsFixed(1)}';
      _finalBill = 'Final Bill is ${bill.toStringAsFixed(1)}';
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text('EBC'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
    ),
      body: new Container(
      alignment: Alignment.topCenter,
      child: new ListView(
      padding: const EdgeInsets.all(2.0),
      children: <Widget>[

       new Container(
          margin: const EdgeInsets.all(3.0),
          height: 220.0,
          width: 290.0,
          color: Colors.grey.shade300,
          child: new Column(
          children: <Widget>[
                new TextField(
                  controller: _previousReading,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                  labelText: 'Previous Reading',
                  hintText: 'e.g: 11235',
                  icon: new Icon(Icons.linear_scale)),
                  ),
                new TextField(
                  controller: _currentReading,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                  labelText: 'Current Reading',
                  hintText: 'e.g: 11439',
                  icon: new Icon(Icons.linear_scale)),
                  ),
                new Padding(padding: new EdgeInsets.all(10.6)),
                new Container(
                child: new Container(
                  alignment: Alignment.center,
                  child: new RaisedButton(
                  onPressed: _calculateEbc,
                  color: Colors.pinkAccent,
                  child: new Text('Calculate'),
                  textColor: Colors.white,
                ),
              )
                )],
    ),
  ),
    new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    new Text("$_finalResult1",
    style: new TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontSize: 19.9
    ),),
      new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("$_finalResult2",
            style: new TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                fontSize: 19.9
            ),),

      new Padding(padding: const EdgeInsets.all(5.0)),

    new Text("$_finalBill",
    style: new TextStyle(
    color: Colors.pinkAccent,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontSize: 19.9
    ),)

    ],


    ),
      ],
      ),
  ]
      ),
    )
    );
  }
}


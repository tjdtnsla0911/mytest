import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  String sum = '';


  List _buttonList = ['더하기','빼기','곱하기','나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = new List();
  String _buttonText ;


  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('bulid 안의 _buttinList : $_buttonList');
    return Scaffold(
        appBar: AppBar(
          title: Text('Widget Example'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Flutter'),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      keyboardType: TextInputType.number, controller: value1),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      keyboardType: TextInputType.number, controller: value2),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: RaisedButton(
                    onPressed: () {
                      print(_buttonText);
                      setState(() {
                        print('value1.value ${value1.value}');
                        print('value2.value ${value2.value}');
                        var value1Int = double.parse(value1.value.text);
                        var value2Int = double.parse(value2.value.text);
                        var result;
                        /*
                        * '더하기','빼기','곱하기','나누기'*/
                        if(_buttonText == '더하기'){
                          result = value1Int + value2Int;
                        }else if(_buttonText == '빼기'){
                          result = value1Int - value2Int;
                        }else if(_buttonText == '곱하기'){
                          result = value1Int * value2Int;
                        }else if(_buttonText == '나누기'){
                          result = value1Int / value2Int;
                        }else{
                          print('Error 발생!');
                        }
                          sum = '$result';
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add),
                        Text(_buttonText),
                      ],
                    ),
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    '결과 : $sum',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: DropdownButton(items:_dropDownMenuItems, onChanged: (value){
                    print('onChanged에옴 value : $value');
                    setState(() {
                      _buttonText = value;
                      print('버튼눌럿을때 _buttonText : $_buttonText');
                    });
                  },value : _buttonText),//얘가없어도 value 가져는 오는데 모바일에 반영이안댐
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    print('initState에옴');
    super.initState();
    for(var item in _buttonList){
      print('for안의 item = $item');
      _dropDownMenuItems.add(DropdownMenuItem(value : item, child: Text(item),));
    }

    print('_dropDownMenuItems[0] : ${_dropDownMenuItems[0].value}');
    _buttonText = _dropDownMenuItems[0].value;
  }
}

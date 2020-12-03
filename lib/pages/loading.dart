import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    //mae request
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Shanghai');
    Map data = jsonDecode(response.body);

    //get properties from data
    String datatime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);


    //create date time object
    DateTime now = DateTime.parse(datatime);
    now = now.add(Duration(hours: int.parse(offset) ));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }
}

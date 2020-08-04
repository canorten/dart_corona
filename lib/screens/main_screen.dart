import 'package:corona_app/jsonapi/Services.dart';
import 'package:corona_app/jsonapi/Results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  MainScreen():super();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreenState();
  }

}

class _MainScreenState extends State<MainScreen>{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading...'),
      ),
      body: Container(
        child: FutureBuilder(
          future: Services.getWorld(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text(snapshot.data[index].country),
                    subtitle: Text(snapshot.data[index].cases.toString()),
                  );
                }
            );
          },
        ),
      ),

    );
  }
}
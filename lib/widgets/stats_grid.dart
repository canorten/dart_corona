import 'package:corona_app/jsonapi/Services.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  String index;
  StatsGrid([this.index]);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: new FutureBuilder(
        future: Services.getWorldString(index),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return new Column(
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    _buildStatCard('Toplam Vaka', snapshot.data[0].cases.toString(), Colors.orange),
                    _buildStatCard('Ölüm', snapshot.data[0].deaths.toString(), Colors.red),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    _buildStatCard('İyileşen', snapshot.data[0].recovered.toString(), Colors.green),
                    _buildStatCard('Aktif Vaka', snapshot.data[0].active.toString(), Colors.lightBlue),
                    _buildStatCard('Kritik', snapshot.data[0].critical.toString(), Colors.purple),
                  ],
                ),
              )
            ],
          );
        }

    ),
    );
  }



  Expanded _buildStatCard(String title, String count, MaterialColor color){
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),),
            ],
          ),
        )
    );
  }
}

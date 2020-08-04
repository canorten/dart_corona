import 'dart:developer';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:corona_app/config/palette.dart';
import 'package:corona_app/config/styles.dart';
import 'package:corona_app/data/data.dart';
import 'package:corona_app/jsonapi/Services.dart';
import 'package:corona_app/widgets/covid_bar_chart.dart';
import 'package:corona_app/widgets/custom_app_bar.dart';
import 'package:corona_app/widgets/stats_grid.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  int currentc;
  String cn='t';
  StatsScreen([this.cn]);
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(),
          _buildRegionTabBar(widget.currentc),
          _buildStatsTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: StatsGrid('World'),
            ),
          ),
          /*SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(covidCases: covidUSADailyNewCases),
            ),
          )*/
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'İstatistikler',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar(int currentc) {

    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelColor: Colors.black,
            labelStyle: Styles.tabTextStyle,
            tabs: <Widget>[
              Text('Türkiye'),
              Text('Global'),
            ],
            onTap: (index) { currentc=index;
            },
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Toplam'),
              Text('Bugün'),
              Text('Dün'),
            ],
          ),
        ),
      ),
    );
  }



}

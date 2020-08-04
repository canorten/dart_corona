import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart'as http;
import 'Results.dart';

class Services {
  static const String url='https://coronavirus-19-api.herokuapp.com/countries';
  static Future getProductsByCountryName(String countryName){
    return http.get("https://coronavirus-19-api.herokuapp.com/countries/$countryName");
  }


  static Future<List<Results>> getResults() async{
    var data= await http.get(url);
    var jsonData= json.decode(data.body);
    List<Results> results= [];
    for(var r in jsonData){
        Results result= Results.fromJson(r);
        results.add(result);
    }
    print(results?.length);
    return results;
  }

  static Future<List<Results>> getWorld() async{
    var data= await http.get(url);
    var jsonData= json.decode(data.body);
    List<Results> results= [];
    for(var r in jsonData){
      Results result= Results.fromJson(r);
      if(r['country']=='Turkey') {
        results.add(result);
        print(results[0].country+' eklendi');
      }
    }
    return results;
  }

  static Future<List<Results>> getWorldString([String index]) async{
    var data= await http.get(url);
    var jsonData= json.decode(data.body);
    Future<int> result;
    List<Results> results= [];
    for(var r in jsonData){
      Results result= Results.fromJson(r);
      if(index==null){print(index);index='World';}
      if(r['country']==index) {
        results.add(result);
        print(results[0].cases.toString());
        print(results[0].country);
      }
    }
    return results;
  }


}
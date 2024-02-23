import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Attraction {
  final int id;
  final String name;
  final String detail;
  final String coverImage;
  final double latitude;
  final double longitude;
  Attraction({
    required this.id,
    required this.name,
    required this.detail,
    required this.coverImage,
    required this.latitude,
    required this.longitude,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json['id'],
      name: json['name'],
      detail: json['detail'],
      coverImage: json['coverimage'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  List<Attraction> attractions = [];

  Future<void> readJson() async {
    final String response = 
      await rootBundle.loadString('assets/attractions.json');
    final data = await json.decode(response);
    setState(() {
      attractions =
        List<Attraction>.from(data.map((i) => Attraction.fromJson(i)));
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (context, i) {
          return Card(
              child: Column(children: [
            Image.network(attractions[i].coverImage),
            Text(attractions[i].name),
            Text(attractions[i].detail)
          ]));
        },
      ),
    );
  }
}




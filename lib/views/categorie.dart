import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/model/wallpaper_model.dart';
import 'package:testapp/widgets/widget.dart';

class Categorie extends StatefulWidget {
  final String categorieName;
  Categorie({this.categorieName});

  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  // ignore: deprecated_member_use
  List<WallpaperModel> wallpapers = new List();

  fetchSearchWallpaperData(String query) async {
    http.Response response = await http.get(Uri.parse(
        "https://wallhaven.cc/api/v1/search?apikey=HIW2ydyxUbGTKxRFjAe3lVXbmjS2p1YQ&q=$query"));

    Map<String, dynamic> wallpaperData = json.decode(response.body);
    wallpaperData["data"].forEach((element) {
      WallpaperModel wallpaperMOdel = new WallpaperModel();
      wallpaperMOdel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperMOdel);
    });

    setState(() {});
  }

  @override
  void initState() {
    fetchSearchWallpaperData(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 16.0,
              ),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

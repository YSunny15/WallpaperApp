import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testapp/model/wallpaper_model.dart';
import 'package:testapp/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;
  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // ignore: deprecated_member_use
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();

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
    fetchSearchWallpaperData(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.grey[200],
                ),
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          fetchSearchWallpaperData(searchController.text);
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
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

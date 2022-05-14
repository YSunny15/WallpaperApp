import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:testapp/data/data.dart';
import 'package:testapp/model/wallpaper_model.dart';
import 'package:testapp/views/categorie.dart';
import 'package:testapp/views/image_view.dart';
import 'package:testapp/views/search.dart';
import 'package:testapp/widgets/widget.dart';

import '../model/categories_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map wallpaperData;
  // ignore: deprecated_member_use
  List<CategoriesModel> categories = new List();
  // ignore: deprecated_member_use
  List<WallpaperModel> wallpapers = new List();

  TextEditingController searchController = new TextEditingController();

  fetchWallpaperData() async {
    http.Response response = await http.get(Uri.parse("https://wallhaven.cc/api/v1/search?apikey=HIW2ydyxUbGTKxRFjAe3lVXbmjS2p1YQ&+car"
        ));
        // "https://wallhaven.cc/api/v1/search?apikey=HIW2ydyxUbGTKxRFjAe3lVXbmjS2p1YQ&q=anime"

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
    fetchWallpaperData();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search(
                                        searchQuery: searchController.text,
                                      )));
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              new SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Made By ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Overpass'),
                  ),
                  Container(
                      child: Text(
                    "Sunny Yadav",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                        fontSize: 12,
                        fontFamily: 'Overpass'),
                  )),
                ],
              ),
              SizedBox(
                height: 8
                ,
              ),

              // continue........
              Container(
                height: 80.0,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategorieTile(
                        title: categories[index].categoriesName,
                        imgUrl: categories[index].imgUrl,
                      );
                    }),
              ),
              new SizedBox(
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

class CategorieTile extends StatelessWidget {
  final String imgUrl, title;
  CategorieTile({@required this.title, @required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categorie(
                      categorieName: title.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imgUrl,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black26,
              ),
              height: 50.0,
              width: 100.0,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/views/image_view.dart';

import '../model/wallpaper_model.dart';

Widget brandName() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Text(
      'AniWall',
      style: GoogleFonts.roboto(
          color: Colors.black87, fontWeight: FontWeight.w700),
    ),
    Container(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: Colors.orange[700],
        ),
        child: Text(
          'Hub',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.w700),
        ))
  ]);
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      childAspectRatio: 0.6,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(imgUrl: wallpaper.path)));
              // ImageView(imgUrl: wallpaper.thumbs.original)));
            },
            child: Hero(
              tag: wallpaper.path,
              // tag: wallpaper.thumbs.original,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    wallpaper.thumbs.original,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

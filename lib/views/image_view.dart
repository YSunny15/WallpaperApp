import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final GlobalKey<ScaffoldState> scaffkey = GlobalKey<ScaffoldState>();

  _save() async {
    var response = await Dio()
        .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    // print(result);
    final snackb = new SnackBar(
        backgroundColor: Colors.black87,
        duration: new Duration(seconds: 4),
        content: Row(
          children: [
            new Icon(
              Icons.file_download,
              color: Colors.redAccent,
            ),
            new Text(
              'Wallpaper saved in gallery...',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ));
    // ignore: deprecated_member_use
    scaffkey.currentState.showSnackBar(snackb);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffkey,
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _save,
                  child: Stack(children: [
                    Container(
                      height: 50.0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueAccent.withOpacity(0.4),
                              Colors.cyan[800].withOpacity(0.4),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          border:
                              Border.all(color: Colors.white38, width: 1.0)),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                          Text(
                            'Set Wallpaper',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700),
                          ),
                          // Text('Image will be saved in Gallery')
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*
 Creating Wallpaper Model to access wallpaper from api...
*/

class WallpaperModel {
  String path;
  SrcModel thumbs;

  WallpaperModel({this.path, this.thumbs});

  factory WallpaperModel.fromMap(Map<String, dynamic> parsedJson) {
    return WallpaperModel(
        path: parsedJson["path"],
        thumbs: SrcModel.fromMap(parsedJson["thumbs"]));
  }
}

class SrcModel {
  String original;
  SrcModel({this.original});

  factory SrcModel.fromMap(Map<String, dynamic> srcJson) {
    return SrcModel(
      original: srcJson["original"],
    );
  }
}

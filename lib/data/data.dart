import 'package:testapp/model/categories_model.dart';

List<CategoriesModel> getCategories() {
  // ignore: deprecated_member_use
  List<CategoriesModel> categories = new List();
  CategoriesModel categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://i.ytimg.com/vi/9SP7p7w7Bj0/maxresdefault.jpg";
  categorieModel.categoriesName = "Naruto";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://i.pinimg.com/474x/9b/ee/56/9bee562e849e5d2821f336e30b9a33d4.jpg";
  categorieModel.categoriesName = "Sasuke";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://i.pinimg.com/originals/23/0b/4d/230b4dd1bd103811601f924d61b90ae2.jpg";
  categorieModel.categoriesName = "Ichigo";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl = "https://wallpaperaccess.com/full/5429864.jpg";
  categorieModel.categoriesName = "Kaneki";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://besthqwallpapers.com/Uploads/20-9-2019/105185/thumb-monkey-d-luffy-darkness-one-piece-artwork-manga.jpg";
  categorieModel.categoriesName = "OnePiece";

  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://i.pinimg.com/originals/6a/11/0e/6a110ee1a25283fcc71d65a7ec16420f.jpg";
  categorieModel.categoriesName = "BlackClover";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
      "https://images.hdqwalls.com/wallpapers/thumb/night-city-anime-boy-4k-6d.jpg";
  categorieModel.categoriesName = "Hentai";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  return categories;
}

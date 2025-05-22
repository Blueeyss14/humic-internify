class AboutItemModel {
  String image;

  AboutItemModel(this.image);

  static List<AboutItemModel> aboutData() {
    List<Map<String, dynamic>> datas = [
      {"image": "assets/images/rshs.png"},
      {"image": "assets/images/rsud_soetomo.png"},
      {"image": "assets/images/rssa.png"},
      {"image": "assets/images/ub.png"},
      {"image": "assets/images/hiroshima.png"},
    ];

    return datas.map((e) => AboutItemModel(e["image"])).toList();
  }
}

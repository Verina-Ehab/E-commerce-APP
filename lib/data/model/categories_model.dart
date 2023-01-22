class CategoriesModel {
  String? categoriesId;
  String? categoriesNameEn;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesNameEn,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json){
  categoriesId= json['categories_id'];
  categoriesNameEn= json['categories_name'];
  categoriesNameAr= json['categories_name_ar'];
  categoriesImage= json['categories_image'];
  categoriesDatetime= json['categories_datetime'];
  }
}

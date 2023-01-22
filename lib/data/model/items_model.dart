class ItemsModel {
  ItemsModel(
      {this.itemsId,
      this.itemsNameEn,
      this.itemsNameAr,
      this.itemsImage,
      this.itemsDate,
      this.itemsDescEn,
      this.itemsDescAr,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCat,
      this.categoriesId,
      this.categoriesNameEn,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favorite,
      });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsNameEn = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImage = json['items_image'];
    itemsDate = json['items_date'];
    itemsDescEn = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesNameEn = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
  }

  String? categoriesDatetime;
  String? categoriesId;
  String? categoriesImage;
  String? categoriesNameAr;
  String? categoriesNameEn;
  String? itemsActive;
  String? itemsCat;
  String? itemsCount;
  String? itemsDate;
  String? itemsDescAr;
  String? itemsDescEn;
  String? itemsDiscount;
  String? itemsId;
  String? itemsImage;
  String? itemsNameAr;
  String? itemsNameEn;
  String? itemsPrice;
  String? favorite;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsNameEn;
    data['items_name_ar'] = itemsNameAr;
    data['items_image'] = itemsImage;
    data['items_date'] = itemsDate;
    data['items_desc'] = itemsDescEn;
    data['items_desc_ar'] = itemsDescAr;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_cat'] = itemsCat;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesNameEn;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    data['favorite'] = favorite;
    return data;
  }
}



class CategoryListModal {
  bool? status;
  String? message;
  List<CategoryResponseData>? responsedata;

  CategoryListModal({this.status, this.message, this.responsedata});

  CategoryListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['responsedata'] != null) {
      responsedata = <CategoryResponseData>[];
      json['responsedata'].forEach((v) {
        responsedata!.add(CategoryResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (responsedata != null) {
      data['responsedata'] = responsedata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryResponseData {
  int? id;
  String? title;
  String? slug;
  String? content;
  String? image;
  String? hidImage;
  String? icon;
  String? hidIcon;
  int? status;
  String? entDt;

  CategoryResponseData(
      {this.id,
        this.title,
        this.slug,
        this.content,
        this.image,
        this.hidImage,
        this.icon,
        this.hidIcon,
        this.status,
        this.entDt});

  CategoryResponseData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    slug = json['Slug'];
    content = json['Content'];
    image = json['Image'];
    hidImage = json['Hid_Image'];
    icon = json['Icon'];
    hidIcon = json['Hid_Icon'];
    status = json['Status'];
    entDt = json['EntDt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['Slug'] = slug;
    data['Content'] = content;
    data['Image'] = image;
    data['Hid_Image'] = hidImage;
    data['Icon'] = icon;
    data['Hid_Icon'] = hidIcon;
    data['Status'] = status;
    data['EntDt'] = entDt;
    return data;
  }
}

class CityListModal {
  bool? status;
  String? message;
  List<CityResponseData>? responsedata;

  CityListModal({this.status, this.message, this.responsedata});

  CityListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['responsedata'] != null) {
      responsedata = <CityResponseData>[];
      json['responsedata'].forEach((v) {
        responsedata!.add(CityResponseData.fromJson(v));
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

class CityResponseData {
  int? id;
  int? countryId;
  String? countryTitle;
  String? title;
  String? slug;
  String? image;

  CityResponseData(
      {this.id,
        this.countryId,
        this.countryTitle,
        this.title,
        this.slug,
        this.image});

  CityResponseData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    countryId = json['CountryId'];
    countryTitle = json['CountryTitle'];
    title = json['Title'];
    slug = json['Slug'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CountryId'] = countryId;
    data['CountryTitle'] = countryTitle;
    data['Title'] = title;
    data['Slug'] = slug;
    data['Image'] = image;
    return data;
  }
}

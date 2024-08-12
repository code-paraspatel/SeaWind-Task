
class CountryListModal {
  bool? status;
  String? message;
  List<Responsedata>? responsedata;

  CountryListModal({this.status, this.message, this.responsedata});

  CountryListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['responsedata'] != null) {
      responsedata = <Responsedata>[];
      json['responsedata'].forEach((v) {
        responsedata!.add(Responsedata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (responsedata != null) {
      data['responsedata'] = responsedata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Responsedata {
  int? id;
  String? title;
  String? slug;
  String? image;

  Responsedata({this.id, this.title, this.slug, this.image});

  Responsedata.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    slug = json['Slug'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = id;
    data['Title'] = title;
    data['Slug'] = slug;
    data['Image'] = image;
    return data;
  }
}

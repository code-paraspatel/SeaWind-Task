class SliderListModal {
  bool? status;
  String? message;
  List<SliderResponseData>? responsedata;

  SliderListModal({this.status, this.message, this.responsedata});

  SliderListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['responsedata'] != null) {
      responsedata = <SliderResponseData>[];
      json['responsedata'].forEach((v) {
        responsedata!.add(SliderResponseData.fromJson(v));
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

class SliderResponseData {
  int? id;
  String? title;
  String? image;

  SliderResponseData({this.id, this.title, this.image});

  SliderResponseData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['Image'] = image;
    return data;
  }
}

class Data {
  num? userId;
  num? id;
  String? title;
  String? body;

  Data({this.userId, this.id, this.title, this.body});

  Data copyWith({num? userId, num? id, String? title, String? body}) => Data(
    userId: userId ?? this.userId,
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["userId"] = userId;
    map["id"] = id;
    map["title"] = title;
    map["body"] = body;
    return map;
  }

  Data.fromJson(dynamic json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}

class PostModel {
  List<Data>? dataList;

  PostModel({this.dataList});

  PostModel copyWith({List<Data>? dataList}) =>
      PostModel(dataList: dataList ?? this.dataList);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataList != null) {
      map["data"] = dataList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  PostModel.fromJson(dynamic json) {
    if (json != null) {
      dataList = [];
      json.forEach((v) {
        dataList?.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  num? postId;
  num? id;
  String? name;
  String? email;
  String? body;

  Data({this.postId, this.id, this.name, this.email, this.body});

  Data copyWith({
    num? postId,
    num? id,
    String? name,
    String? email,
    String? body,
  }) => Data(
    postId: postId ?? this.postId,
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    body: body ?? this.body,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["postId"] = postId;
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["body"] = body;
    return map;
  }

  Data.fromJson(dynamic json) {
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }
}

class SecondApi {
  List<Data>? dataList;

  SecondApi({this.dataList});

  SecondApi copyWith({List<Data>? dataList}) =>
      SecondApi(dataList: dataList ?? this.dataList);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataList != null) {
      map["data"] = dataList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  SecondApi.fromJson(dynamic json) {
    if (json != null) {
      dataList = [];
      json.forEach((v) {
        dataList?.add(Data.fromJson(v));
      });
    }
  }
}

import 'dart:convert';

/// fullname : "Gil Baxter"
/// rate : "5"
/// date : "an hour ago"
/// description : "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all topics in angular official documentation"

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));
String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    this.fullname,
    this.rate,
    this.date,
    this.description,
  });

  Review.fromJson(dynamic json) {
    fullname = json['fullname'];
    rate = json['rate'];
    date = json['date'];
    description = json['description'];
  }
  String? fullname;
  String? rate;
  String? date;
  String? description;
  Review copyWith({
    String? fullname,
    String? rate,
    String? date,
    String? description,
  }) =>
      Review(
        fullname: fullname ?? this.fullname,
        rate: rate ?? this.rate,
        date: date ?? this.date,
        description: description ?? this.description,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullname'] = fullname;
    map['rate'] = rate;
    map['date'] = date;
    map['description'] = description;
    return map;
  }
}

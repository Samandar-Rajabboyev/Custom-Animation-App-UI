import 'dart:convert';

import 'package:custom_animation_ui/models/Review.dart';

////// name : "Angular - The Complete Guide"
// /// category : "Development"
// /// rate : "5"
// /// students : "30 245"
// /// time : "86 hr"
// /// lectures : "126 lectures"
// /// price : "$19.99"
// /// reviews : []
// /// description : "This course starts from scratch,you neither need to know Angular 1 nor Angular 2! Angular 12 simply is the latest version of"

Course courseFromJson(String str) => Course.fromJson(json.decode(str));
String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    this.name,
    this.category,
    this.rate,
    this.students,
    this.time,
    this.lectures,
    this.price,
    this.description,
    this.reviews,
  });

  Course.fromJson(dynamic json) {
    name = json['name'];
    category = json['category'];
    rate = json['rate'];
    students = json['students'];
    time = json['time'];
    lectures = json['lectures'];
    price = json['price'];
    description = json['description'];
    reviews = json['reviews'];
  }
  String? name;
  String? category;
  String? rate;
  String? students;
  String? time;
  String? lectures;
  String? price;
  String? description;
  List<Review>? reviews;
  Course copyWith(
          {String? name,
          String? category,
          String? rate,
          String? students,
          String? time,
          String? lectures,
          String? price,
          String? description,
          List<Review>? reviews}) =>
      Course(
        name: name ?? this.name,
        category: category ?? this.category,
        rate: rate ?? this.rate,
        students: students ?? this.students,
        time: time ?? this.time,
        lectures: lectures ?? this.lectures,
        price: price ?? this.price,
        description: description ?? this.description,
        reviews: reviews ?? this.reviews,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['category'] = category;
    map['rate'] = rate;
    map['students'] = students;
    map['time'] = time;
    map['lectures'] = lectures;
    map['price'] = price;
    map['description'] = description;
    map['reviews'] = reviews;
    return map;
  }
}

List<Course> courses = [
  Course(
    name: 'Angular - The Complete Guide',
    lectures: "42 lectures",
    time: "86 hr",
    rate: "4.8",
    students: "30 245",
    price: "\$19.99",
    category: "Development",
    description:
        "This course starts from scratch,you neither need to know Angular 1 nor Angular 2! Angular 12 simply is"
        " the latest version of",
    reviews: [
      Review(
        fullname: "Alan P.",
        rate: "4",
        date: "a week ago",
        description:
            "It's a detailed and in-depth course that teaches you all the things you could possibly need and use while working with Angular. The style and quality is as expected from Max. It has great value and I would recommend the course, because is has great value.",
      ),
      Review(
        fullname: "Source F.",
        rate: "5",
        date: "2 weeks ago",
        description: "Super Course",
      ),
      Review(
        fullname: "Neeraj",
        rate: "5",
        date: "2 months ago",
        description:
            "I am working as an System Engineer full time. This course really helped me to switch my profile to angular developer. This is recommended to all those who are wants to move from beginner to advanced.",
      ),
    ],
  ),
  Course(
    name: 'The Complete JavaScript Course 2022',
    lectures: "86 lectures",
    time: "122 hr",
    rate: "4.7",
    students: "195 845",
    price: "\$23.99",
    category: "Development",
    description:
        "This course starts from scratch,you neither need to know Angular 1 nor Angular 2! Angular 12 simply is"
        " the latest version of",
    reviews: [
      Review(
        fullname: "Saira G.",
        rate: "5",
        date: "a month ago",
        description:
            "What an amazing course. So well explained. I have learnt so much. Watching the videos a second time helped the concepts to sink in. This course prepares you to think like a developer. Thank you Jonas. You are amazing! ",
      ),
      Review(
        fullname: "Kiran V.",
        rate: "5",
        date: "2 weeks ago",
        description: "Jonas explanation is easy to understand for a layman also. Thanks a ton Jonas",
      ),
      Review(
        fullname: "Bruno",
        rate: "5",
        date: "6 days ago",
        description: "This is course is perfect to adquire a good foundation of the language Javascript. Jonas just "
            "covers all the main topics and the modern way to use the language. All I have to say is that, after this course I just feel so much encourage to build my own projects and definitely not need any other course on this subject.",
      ),
    ],
  ),
  Course(
    name: 'Android Material Design',
    lectures: "43 lectures",
    time: "6 hr",
    rate: "4.7",
    students: "2 272",
    price: "\13.99",
    category: "Development",
    description:
        "This course starts from scratch,you neither need to know Angular 1 nor Angular 2! Angular 12 simply is"
        " the latest version of",
    reviews: [
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
    ],
  ),
  Course(
    name: 'Social Media Management',
    lectures: "37 lectures",
    time: "9 hr",
    rate: "4.2",
    students: "88 457",
    price: "\$13.99",
    category: "Marketing",
    description:
        "Digital marketing training to Learn How to Use Social Media, Social Media Strategy and Social Media Marketing.",
    reviews: [
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
    ],
  ),
  Course(
    name: 'Google Ads for Beginners',
    lectures: "49 lectures",
    time: "3 hr",
    rate: "4.4",
    students: "26 283",
    price: "\$16.99",
    category: "Marketing",
    description: "Learn how to effectively use Google Ads to reach more customers online and grow your business.",
    reviews: [
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
    ],
  ),
  Course(
    name: 'Social Media Management',
    lectures: "37 lectures",
    time: "9 hr",
    rate: "4.2",
    students: "88 287",
    price: "\$13.99",
    category: "Marketing",
    description:
        "Digital marketing training to Learn How to Use Social Media, Social Media Strategy and Social Media Marketing.",
    reviews: [
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
    ],
  ),
  Course(
    name: 'Google Ads for Beginners',
    lectures: "49 lectures",
    time: "3 hr",
    rate: "4.4",
    students: "26 463",
    price: "\$16.99",
    category: "Marketing",
    description: "Learn how to effectively use Google Ads to reach more customers online and grow your business.",
    reviews: [
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
      Review(
        fullname: "Gil Baxter",
        rate: "5",
        date: "an hour ago",
        description: "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
            "topics in angular official documentation",
      ),
    ],
  ),
];

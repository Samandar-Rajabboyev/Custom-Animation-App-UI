import 'dart:convert';

import 'package:custom_animation_ui/models/Review.dart';

import 'Course.dart';

/// name : "Development"
/// courses_count : "12 courses"
/// courses : []

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.name,
    this.coursesCount,
    this.courses,
  });

  Category.fromJson(dynamic json) {
    name = json['name'];
    coursesCount = json['courses_count'];
    if (json['courses'] != null) {
      courses = [];
      json['courses'].forEach((v) {
        courses?.add(Course.fromJson(v));
      });
    }
  }
  String? name;
  String? coursesCount;
  List<Course>? courses;
  Category copyWith({
    String? name,
    String? coursesCount,
    List<Course>? courses,
  }) =>
      Category(
        name: name ?? this.name,
        coursesCount: coursesCount ?? this.coursesCount,
        courses: courses ?? this.courses,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['courses_count'] = coursesCount;
    if (courses != null) {
      map['courses'] = courses?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

List<Category> categories = [
  Category(
    name: "Development",
    coursesCount: '126 courses',
    courses: [
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
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
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
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
        ],
      ),
    ],
  ),
  Category(
    name: "Marketing",
    coursesCount: '245 courses',
    courses: [
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
        ],
      ),
    ],
  ),
  Category(
    name: "Development",
    coursesCount: '126 courses',
    courses: [
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
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
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
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
        ],
      ),
    ],
  ),
  Category(
    name: "Marketing",
    coursesCount: '245 courses',
    courses: [
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
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
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
          Review(
            fullname: "Gil Baxter",
            rate: "5",
            date: "an hour ago",
            description:
                "Very good explanations. Giving in depth knowledge of the each topic. He is almost covering all "
                "topics in angular official documentation",
          ),
        ],
      ),
    ],
  ),
];

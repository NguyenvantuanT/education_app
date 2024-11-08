import 'package:education_app/models/user_model.dart';

class CourseModel {
  String? idCourse;
  String? nameCouse;
  String? description;
  String? image;
  String? idCategory;
  UserModel? teacher;
  double? rating;
  List<String>? lessons;

  CourseModel();

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel()
  ..idCourse = json['idCourse'] as String?
  ..nameCouse = json['nameCouse'] as String?
  ..description = json['description'] as String?
  ..image = json['image'] as String?
  ..teacher = UserModel.fromJson(json['teacher'])
  ..idCategory = json['idCategory'] as String?
  ..rating = (json['rating'] as num?)?.toDouble()
  ..lessons = json['lessons'] != null
      ? List<String>.from(json['lessons'] as List)
      : null;

}

class FakeCourse {
  FakeCourse._();

  static final courses = <CourseModel>[
    CourseModel.fromJson(course1),
    CourseModel.fromJson(course2),
    CourseModel.fromJson(course3),
    CourseModel.fromJson(course4),
    CourseModel.fromJson(course5),
  ];

  static const course1 = {
    'idCourse': 'course1',
    'nameCouse': 'Flutter Basic to Pro',
    'image': 'assets/images/flutter.jpg',
    'teacher': {
      'name': "Nguyễn Văn Tuấn",
      'specialized': "Flutter",
      'avatar': "assets/images/default_avatar.jpg",
    },
    'idCategory': "dev",
    'description':
        'Khóa học flutter trình bày từ basic đến nâng cao , code trực tiếp không slider',
    'rating': 5,
    'lessons': [
      'lesson1',
      'lesson2',
      'lesson3',
      'lesson4',
      'lesson5',
    ]
  };

  static const course2 = {
    'idCourse': 'course2',
    'nameCouse': 'NodeJS Normal to Pro',
    'image': 'assets/images/node.png',
    'teacher': {
      'name': "Paul Simons",
      'specialized': "NodeJS",
      'avatar': "assets/images/user_2.png",
    },
    'idCategory': "dev",
    'description':
        'The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers. The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers. Read More',
    'rating': 3.5,
    'lessons': [
      'lesson2',
      'lesson3',
      'lesson4',
      'lesson5',
    ]
  };

  static const course3 = {
    'idCourse': 'course3',
    'nameCouse': 'ReactJS Normal to Pro',
    'image': 'assets/images/react.jpg',
    'teacher': {
      'name': "Graham Osbor",
      'specialized': "ReactJS",
      'avatar': "assets/images/user_3.png",
    },
    'idCategory': "dev",
    'description':
        'The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers. The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers. Read More',
    'rating': 4.5,
    'lessons': [
      'lesson1',
      'lesson2',
      'lesson3',
    ]
  };

  static const course4 = {
    'idCourse': 'course3',
    'nameCouse': 'ReactJS Normal to Pro',
    'image': 'assets/images/react.jpg',
    'teacher': {
      'name': "Graham Osbor",
      'specialized': "ReactJS",
      'avatar': "assets/images/user_3.png",
    },
    'idCategory': "AI",
    'description':
        'The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers. The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers. Read More',
    'rating': 4.5,
    'lessons': [
      'lesson1',
      'lesson2',
      'lesson3',
    ]
  };
  static const course5 = {
    'idCourse': 'course3',
    'nameCouse': 'ReactJS Normal to Pro',
    'image': 'assets/images/react.jpg',
    'teacher': {
      'name': "Graham Osbor",
      'specialized': "ReactJS",
      'avatar': "assets/images/user_3.png",
    },
    'idCategory': "Data",
    'description':
        'The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers. The Macine learning basics program is designed to offer a soli foundation & work-ready skills for ML engineers. Read More',
    'rating': 4.5,
    'lessons': [
      'lesson1',
      'lesson2',
      'lesson3',
    ]
  };
}

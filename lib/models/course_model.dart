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
  int? progress;
  bool isEditing = false;
  bool get isCompleted => (progress ?? 0) >= 100;

  CourseModel() ;
  

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
        : null
    ..progress = json['progress'] as int?;

   Map<String, dynamic> toJson() => {
        'idCourse': idCourse,
        'nameCouse': nameCouse,
        'description': description,
        'image': image,
        'idCategory': idCategory,
        'teacher': teacher?.toJson(),
        'rating': rating,
        'lessons': lessons,
        'progress': progress,
      };
}

class FakeCourse {
  FakeCourse._();

  static final courses = <CourseModel>[
    CourseModel.fromJson(course1),
    CourseModel.fromJson(course2),
    CourseModel.fromJson(course3),
    CourseModel.fromJson(course4),
    CourseModel.fromJson(course5),
    CourseModel.fromJson(course6),
  ];

  static const course1 = {
    'idCourse': 'course1',
    'progress': 0,
    'nameCouse': 'Flutter Basic to Pro',
    'image': 'assets/images/flutter.jpg',
    'teacher': {
      'name': "Nguyễn Văn Tuấn",
      'specialized': "Flutter",
      'avatar': "assets/images/default_avatar.jpg",
    },
    'idCategory': "dev",
    'description':
        'Khóa học flutter trình bày từ basic đếnIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
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
    'progress': 50,
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
    'progress': 100,
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
    'idCourse': 'course4',
    'progress': 0,
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
    'idCourse': 'course5',
    'progress': 20,
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

  static const course6 = {
    'idCourse': 'course6',
    'progress': 20,
    'nameCouse': 'Game Basic to Pro',
    'image': 'assets/images/react.jpg',
    'teacher': {
      'name': "Graham Osbor",
      'specialized': "ReactJS",
      'avatar': "assets/images/user_3.png",
    },
    'idCategory': "Game",
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

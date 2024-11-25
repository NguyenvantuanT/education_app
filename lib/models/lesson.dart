class Lesson {
  String? id;
  String? nameLesson;
  String? videoPath;
  String? description;
  String? imageLesson;
  String? duration;
  bool? isCompleted;
  double? progress;

  Lesson() {
    isCompleted = false;
  }

  void updateProgress(double newProgress) {
    progress = newProgress;
    if (newProgress >= 100) {
      isCompleted = true;
    }
  }

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson()
    ..nameLesson = json["nameLesson"] as String?
    ..videoPath = json["videoPath"] as String?
    ..description = json["description"] as String?
    ..imageLesson = json["imageLesson"] as String?
    ..duration = json['duration'] as String?
    ..isCompleted = json['isComplete'] as bool?;
}

List<Lesson> listLessons = [
  Lesson()
    ..id = 'lesson1'
    ..nameLesson = "Flutter Computor"
    ..videoPath = 'kBQUQYH-VqA'
    ..description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
    ..imageLesson = 'assets/images/flutter.jpg'
    ..duration = '1 Hours 1 min',
  Lesson()
    ..id = 'lesson2'
    ..nameLesson = "Flutter B"
    ..videoPath = 'nPt8bK2gbaU'
    ..description = 'Nâng cấp app tính điểm trung bình các môn'
    ..imageLesson = 'assets/images/react.jpg'
    ..duration = '2 Hours',
  Lesson()
    ..id = 'lesson3'
    ..nameLesson = "Flutter C"
    ..videoPath = 'iLnmTe5Q2Qw'
    ..description = 'Nâng cấp app tính điểm trung bình các môn'
    ..imageLesson = 'assets/images/node.png'
    ..duration = '5 min',
  Lesson()
    ..id = 'lesson4'
    ..nameLesson = "Flutter C"
    ..videoPath = 'iLnmTe5Q2Qw'
    ..description = 'Nâng cấp app tính điểm trung bình các môn'
    ..imageLesson = 'assets/images/node.png'
    ..duration = '5 min',
  Lesson()
    ..id = 'lesson5'
    ..nameLesson = "Flutter B"
    ..videoPath = 'nPt8bK2gbaU'
    ..description = 'Nâng cấp app tính điểm trung bình các môn'
    ..imageLesson = 'assets/images/react.jpg'
    ..duration = '2 Hours',
];

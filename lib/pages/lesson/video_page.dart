import 'dart:async';

import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/pages/lesson/widget/lesson_video_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage(
    this.lesson, {
    super.key,
    required this.courses,
  });

  final Lesson lesson;
  final CourseModel courses;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController youtubePlayerController;
  late List<Lesson> lessons;
  late int selectIndex;
  late Lesson lesson;

  static const tabNames = ['PlayList', 'Description'];

  List<Lesson> getLessonsById(List<Lesson> lessons, List<String> listIdLesson) {
    return lessons.where((lesson) => listIdLesson.contains(lesson.id)).toList();
  }

  void naviToLesson(Lesson newLesson) {
    Timer(const Duration(milliseconds: 2000), (){

    });
    setState(() {
      lesson = lessons.firstWhere((les) => les.id == newLesson.id);
      youtubePlayerController
          .load(YoutubePlayer.convertUrlToId(lesson.videoPath ?? '')!);
    });
  }

  @override
  void initState() {
    super.initState();
    selectIndex = 0;
    lesson = widget.lesson;
    lessons = getLessonsById(listLessons, widget.courses.lessons ?? []);
    _initYoutubePlayer();
  }

  // void _updateCurrentLesson(int index) {
  //   setState(() {
  //     currentLessonIndex = index;
  //     lessons[index];
  //     lessons[index].isComplete = true;

  //   });
  // }

  void _initYoutubePlayer() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: lesson.videoPath ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0).copyWith(
            top: MediaQuery.of(context).padding.top + 10.0, bottom: 20.0),
        children: [
          _buildTitle(),
          const SizedBox(height: 20),
          YoutubePlayer(
            controller: youtubePlayerController,
            showVideoProgressIndicator: true,
          ),
          const SizedBox(height: 10.0),
          _buildLessonInfo(),
          const SizedBox(height: 20.0),
          _buildTabView(context),
          IndexedStack(
            index: selectIndex,
            children: [
              _buildLessonList(),
              _buildDescription(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.courses.nameCouse ?? " No title",
      maxLines: 1,
      textAlign: TextAlign.center,
      style: AppTextStyle.h19Bold.copyWith(fontSize: 24.0),
    );
  }

  Widget _buildLessonInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.nameLesson ?? '',
              style: AppTextStyle.h16Title,
            ),
            Row(
              children: [
                const Icon(
                  Icons.hourglass_bottom,
                  color: AppColor.grey,
                  size: 20.0,
                ),
                Text(
                  "${lesson.duration}",
                  style: AppTextStyle.h12SubTitle.copyWith(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        const Icon(
          Icons.favorite_border,
          color: AppColor.blue,
          size: 30,
        )
      ],
    );
  }

  Widget _buildTabView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: List.generate(
          tabNames.length,
          (index) => _buildTabItem(index, context),
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => selectIndex = index),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 35,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .08,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: selectIndex == index ? AppColor.blue : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          tabNames[index],
          style: selectIndex == index
              ? AppTextStyle.h16Title.copyWith(color: AppColor.white)
              : AppTextStyle.h16Title,
        ),
      ),
    );
  }

  Widget _buildLessonList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lessons.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return LessonVideoItem(
          lesson: lesson,
          onTap: () {
            lesson.isComplete = true;
            naviToLesson(lesson);
          },
        );
      },
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: ReadMoreText(
        lesson.description ?? "",
        trimLines: 4,
        trimMode: TrimMode.Line,
        trimCollapsedText: " Read more",
        trimExpandedText: " End text",
        lessStyle: AppTextStyle.h16Title,
        moreStyle: AppTextStyle.h16Title,
      ),
    );
  }
}

import 'dart:async';

import 'package:education_app/models/lesson.dart';
import 'package:education_app/pages/lesson/widget/lesson_video_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({
    super.key,
    required this.lessons,
    required this.index,
    this.nameCorser = "No Name",
  });

  final String nameCorser;
  final List<Lesson> lessons;
  final int index;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController ycontroller;
  late Lesson currentLesson;
  int currentIndex = 0;

  void naviToLesson(Lesson newLesson) {
    Timer(const Duration(milliseconds: 2000), () {});
    setState(() {
      currentLesson = newLesson;
      ycontroller
          .load(YoutubePlayer.convertUrlToId(currentLesson.videoPath ?? '')!);
    });
  }

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    currentLesson = widget.lessons[currentIndex];
    _initYoutubePlayer();
  }

  void _initYoutubePlayer() {
    ycontroller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(currentLesson.videoPath!)!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    )..addListener(_listenerProgress);
  }

  void _listenerProgress() {
    if (ycontroller.value.isPlaying) {
      double duration = ycontroller.metadata.duration.inSeconds.toDouble();
      double position = ycontroller.value.position.inSeconds.toDouble();

      double newprogress = (position / duration) * 100;
      setState(() {
        currentLesson.updateProgress(newprogress);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(widget.nameCorser,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(color: AppColor.white),
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0)
            .copyWith(top: 25.0, bottom: 20.0),
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.greyText, width: 1.2),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: YoutubePlayer(
                controller: ycontroller,
                showVideoProgressIndicator: true,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          _buildLessonInfo(),
          const SizedBox(height: 10.0),
          LinearProgressIndicator(
            value: (currentLesson.progress ?? 0) / 100.0,
            color: AppColor.blue,
            backgroundColor: Colors.grey[300],
            minHeight: 6.0,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          const SizedBox(height: 10.0),
          _buildDescription(),
          const SizedBox(height: 15.0),
          _buildLessonList(),
        ],
      ),
    );
  }

  Widget _buildLessonInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentLesson.nameLesson ?? '',
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
              "${currentLesson.duration}",
              style: AppTextStyle.h12SubTitle.copyWith(fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLessonList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.lessons.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
      itemBuilder: (context, index) {
        final lesson = widget.lessons[index];
        return LessonVideoItem(
          lesson: lesson,
          onTap: () {
            naviToLesson(lesson);
          },
        );
      },
    );
  }

  Widget _buildDescription() {
    final style = AppTextStyle.h16Title;
    return ReadMoreText(
      currentLesson.description ?? "",
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimCollapsedText: " Read more",
      trimExpandedText: " End text",
      style: AppTextStyle.h17Medium.copyWith(fontSize: 15.0),
      lessStyle: style,
      moreStyle: style,
    );
  }
}

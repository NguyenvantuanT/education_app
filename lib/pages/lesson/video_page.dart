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
    this.title,
    this.lessons,
    this.index = 0,
  });

  final Lesson lesson;
  final String? title;
  final List<Lesson>? lessons;
  final int index;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  static const tabNames = ['PlayList', 'Description'];

  late YoutubePlayerController youtubePlayerController;
  int selectedTabIndex = 0;
  late int currentLessonIndex;
  late Lesson currentLesson;

  @override
  void initState() {
    super.initState();
    currentLessonIndex = widget.index;
    currentLesson = widget.lesson;
    _initYoutubePlayer();
  }

  void _updateCurrentLesson(int index) {
    setState(() {
      currentLessonIndex = index;
      currentLesson = widget.lessons![currentLessonIndex];
      youtubePlayerController
          .load(YoutubePlayer.convertUrlToId(currentLesson.videoPath ?? '')!);
    });
  }

  void _initYoutubePlayer() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: currentLesson.videoPath ?? '',
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
          if (selectedTabIndex == 0)
            _buildLessonList()
          else
            _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title ?? " No title",
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
      onTap: () => setState(() => selectedTabIndex = index),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 35,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .08,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: selectedTabIndex == index ? AppColor.blue : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Expanded(
          child: Text(
            tabNames[index],
            style: selectedTabIndex == index
                ? AppTextStyle.h16Title.copyWith(color: AppColor.white)
                : AppTextStyle.h16Title,
          ),
        ),
      ),
    );
  }

  Widget _buildLessonList() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.lessons!.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
        itemBuilder: (context, index) {
          final lesson = widget.lessons![index];
          return LessonVideoItem(
            lesson: lesson,
            index: index,
            currentLessonIndex: currentLessonIndex,
            onTap: () => _updateCurrentLesson(index),
          );
        });
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: ReadMoreText(
        currentLesson.description ?? "",
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

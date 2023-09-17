import 'package:at_tareeq/app/data/models/lecture.dart';
import 'package:at_tareeq/app/data/models/section_or_interest.dart';
import 'package:at_tareeq/app/data/providers/api/api_client.dart';
import 'package:at_tareeq/app/data/repositories/lecture_repository.dart';
import 'package:at_tareeq/app/data/repositories/repository.dart';
import 'package:at_tareeq/app/dependancies.dart';
import 'package:at_tareeq/app/pages/dashboard/listener/explore/has_lectures_layout.dart';
import 'package:at_tareeq/core/utils/dialogues.dart';
import 'package:at_tareeq/core/utils/helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestLecturesController extends GetxController
    with StateMixin<List<Lecture>>
    implements HasLecturesController {
  SectionOrInterest interest = Get.arguments['interest'];

  @override
  late Paginator<Lecture> paginator;
  @override
  RxBool isLoadingMore = false.obs;
  @override
  List<Lecture> models = [];
  @override
  ScrollController? scroller;
  // ScrollController scroller = addOnScollFetchMore(() {
  // fetchLectures(false);
  // print('as');
  // });

  // final ScrollController scroller = ScrollController();

  @override
  void onInit() {
    paginator = LectureRepository().paginator(perPage: 10, query: {
      'filter': {'interest_id': interest.id}
    });
    // scroller?.addListener(() {
    //   print('ssd');
    // });
    scroller = addOnScollFetchMore(() {
      fetchLectures(false);
      print('as');
    });
    fetchLectures(true);
    super.onInit();
  }

  Future<void> refreshLectures() async {
    return fetchLectures(true);
  }

  @override
  Future<void> fetchLectures(bool isAfresh) async {
    try {
      if (isAfresh) {
        change(null, status: RxStatus.loading());
        // List<Lectumodels = [];
        models = await paginator.start();
      } else {
        isLoadingMore.value = true;
        models.addAll(await paginator.fetchNext());
        isLoadingMore.value = false;
      }
      change(models, status: RxStatus.success());
    } on Exception catch (e) {
      Dependancies.errorService
          .addStateMixinError(stateChanger: change as dynamic, exception: e);
    }
  }

  // void attachScrollListener() {
  //   // print(scrollController);
  //   // if (scrollController.hasClients) {
  //   scrollController.addListener(() {
  //     if (scrollController.position.maxScrollExtent ==
  //         scrollController.position.pixels) {
  //       fetchOrganizations();
  //     }
  //   });
  //   // } else {
  // }

  // Future addToFavorite(Lecture lecture) async {
  //   await Dependancies.http().post('favorites', data: {
  //     'lecture_id': lecture.id,
  //   });
  // }

  // Future addToPlaylater(Lecture lecture) async {
  //   await Dependancies.http().post('playlaters', data: {
  //     'lecture_id': lecture.id,
  //   });
  // }
}

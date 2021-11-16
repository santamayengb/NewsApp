import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newapp/model/model.dart';
import 'package:newapp/service/service.dart';

part 'news_feed_state.dart';

class NewsFeedCubit extends Cubit<NewsFeedState> {
  NewsFeedCubit({required this.service})
      : super(const NewsFeedState(status: NewsFeedStatus.initial));

  final Service service;

  Future<void> getNewsFeed(String categoryName) async {
    // this prevents multiple requests
    if (isLoading) return;

    // this will allow the user to show data is loading
    emit(const NewsFeedState(status: NewsFeedStatus.loading));
    try {
      final newsFeed = await service.getData(categoryName);
      log(newsFeed.toString());
      emit(NewsFeedState(status: NewsFeedStatus.loaded, newsFeed: newsFeed));
    } catch (e) {
      emit(const NewsFeedState(status: NewsFeedStatus.error));
    }
  }

  bool get isLoading => state.status == NewsFeedStatus.loading;
}

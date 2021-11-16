part of 'news_feed_cubit.dart';

enum NewsFeedStatus {
  initial,
  loading,
  loaded,
  error,
}

class NewsFeedState extends Equatable {
  const NewsFeedState({
    required this.status,
    this.newsFeed,
    this.errorMessage,
  });

  final NewsFeedStatus status;
  final NewFeedModel? newsFeed;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, newsFeed, errorMessage];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/constant/new_category.dart';
import 'package:newapp/logic/cubit/news_feed_cubit.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
        bottom: getBottomTabBar(context),
      ),
      body: const NewsFeedBodyView(),
    );
  }

  getBottomTabBar(BuildContext context) => PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Flexible(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: newsCategories
                .map(
                  (categoriesName) => TextButton(
                    child: Text(
                      categoriesName.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      context.read<NewsFeedCubit>().getNewsFeed(categoriesName);
                    },
                  ),
                )
                .toList(),
          ),
        ),
      );
}

class NewsFeedBodyView extends StatefulWidget {
  const NewsFeedBodyView({Key? key}) : super(key: key);

  @override
  _NewsFeedBodyViewState createState() => _NewsFeedBodyViewState();
}

class _NewsFeedBodyViewState extends State<NewsFeedBodyView> {
  @override
  void initState() {
    super.initState();
    context.read<NewsFeedCubit>().getNewsFeed('all');
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NewsFeedCubit>().state;
    final status = state.status;

    switch (status) {
      case NewsFeedStatus.initial:
        return Container();
      case NewsFeedStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case NewsFeedStatus.loaded:
        final newsFeed = state.newsFeed!;

        return ListView.builder(
          itemCount: newsFeed.data.length,
          itemBuilder: (context, index) {
            final item = newsFeed.data[index];

            return Card(
              child: ListTile(
                title: Text(
                  item.author,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                subtitle: Text(
                  item.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(2.0),
                  child: Image.network(
                    item.imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      case NewsFeedStatus.error:
        final error = state.errorMessage;
        return Center(child: Text('$error'));
    }
  }
}

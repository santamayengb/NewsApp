import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/logic/cubit/news_feed_cubit.dart';
import 'package:newapp/pages/home/myhome_page.dart';
import 'package:newapp/pages/news_feed/news_feed.page.dart';
import 'package:newapp/service/service.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final service = Service();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NewsFeedCubit>(
            create: (context) => NewsFeedCubit(service: service),
          ),
        ],
        child: const NewsFeedPage(),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:newapp/model/model.dart';

import 'package:newapp/service/service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List category = [
    "All",
    "National",
    "Business",
    "Sports",
    "World",
    "Politics",
    "Technology",
    "Startup",
    "Entertainment"
        "Miscellaneous",
    "Hatke",
    "Science",
    "Automobile"
  ];
  String? cateType;
  @override
  Widget build(BuildContext context) {
    Service().getData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6200EE),
          title: const Text("NewsApp"),
          bottom: Tab(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var item in category)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        switch (item) {
                          case "All":
                            setState(() {
                              cateType = "All";
                            });
                            break;
                          case "National":
                            setState(() {
                              cateType = "National";
                            });
                            break;
                          case "Business":
                            setState(() {});
                            break;
                        }
                      },
                      child: Text(
                        item,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        body: cateType == "All"
            ? all()
            : cateType == "National"
                ? national()
                : all()
        ///////////////////
        );
  }

  Widget all() {
    return FutureBuilder<NewFeedModel>(
      future: Service().getData(),
      builder: (context, snapshot) {
        var news = snapshot.data;
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: news!.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(news.data[index].author,
                      style: Theme.of(context).textTheme.bodyText2),
                  subtitle: Text(
                    news.data[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(2.0),
                      child: Image.network(news.data[index].imageUrl,
                          width: 150, height: 150, fit: BoxFit.cover)),
                ),
              );
            },
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }

  Widget national() {
    return FutureBuilder<NewFeedModel>(
      future: Service().getData(),
      builder: (context, snapshot) {
        var news = snapshot.data;
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: news!.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(news.data[index].time,
                      style: Theme.of(context).textTheme.bodyText2),
                  subtitle: Text(
                    news.data[index].author,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(2.0),
                      child: Image.network(news.data[index].imageUrl,
                          width: 150, height: 150, fit: BoxFit.cover)),
                ),
              );
            },
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}

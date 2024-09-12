import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/screens/news_item.dart';

import 'tab_item.dart';

class TabbarWidget extends StatefulWidget {
  String id;

  TabbarWidget({required this.id, super.key});

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getScources(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        var sources = snapshot.data?.sources ?? [];
        return Column(
          children: [
            DefaultTabController(
                length: sources.length,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    onTap: (value) {
                      selectedTabIndex = value;
                      setState(() {});
                    },
                    tabs: sources
                        .map((es) => TabItem(
                              isSelected:
                                  sources.elementAt(selectedTabIndex) == es,
                              source: es,
                            ))
                        .toList(),
                  ),
                )),
            FutureBuilder(
                future: ApiManager.getNewsData(
                    sourceId: sources[selectedTabIndex].id ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }
                  var articles = snapshot.data?.articles ?? [];
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (context, index) {
                        return NewsIetm(
                          article: articles[index],
                        );
                      },
                      itemCount: articles.length,
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}

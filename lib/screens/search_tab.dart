import 'package:flutter/material.dart';
import 'package:news_app/screens/news_item.dart';

import '../apis/api_manager.dart';

class SearchTab extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsData(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          var articles = snapshot.data?.articles ?? [];
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
            itemBuilder: (context, index) {
              return NewsIetm(
                article: articles[index],
              );
            },
            itemCount: articles.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsData(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          var articles = snapshot.data?.articles ?? [];
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
            itemBuilder: (context, index) {
              return NewsIetm(
                article: articles[index],
              );
            },
            itemCount: articles.length,
          );
        });
  }
}

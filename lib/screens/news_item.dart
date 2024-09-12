import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsData.dart';
import 'package:news_app/screens/news_Details.dart';

class NewsIetm extends StatelessWidget {
  Articles article;

  NewsIetm({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName ,arguments:article );
      },
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(25)),
                child: Image.network(article.urlToImage ?? '' , height: 240,)),
            Text(article.author ?? '',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                )),
            Text(article.title ?? '',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            Text(article.description ?? '',
                textAlign: TextAlign.start,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                )),
            Text(article.publishedAt!.substring(0,10) ?? '',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                )),
          ],
        ),
      ),
    );
  }
}

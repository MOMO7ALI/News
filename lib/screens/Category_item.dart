import 'package:flutter/material.dart';
import 'package:news_app/models/categoryModel.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel model;
  bool isOdd;

  CategoryItem({required this.isOdd, required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomLeft: !isOdd? Radius.circular(25):Radius.circular(0),
              bottomRight: isOdd? Radius.circular(25):Radius.circular(0),
          ),
          color: model.color),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Text(
            model.name,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/categoryModel.dart';

import 'Category_item.dart';

class CategoriesTab extends StatelessWidget {
  Function onClicked ;
   CategoriesTab({required this.onClicked,super.key});
   bool isOdd = false;
  List<CategoryModel> categories = CategoryModel.getCategory();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text("Pick your category of intrest" , style: TextStyle(fontSize: 33),),
          SizedBox(height: 18,),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            crossAxisSpacing:12,
            mainAxisSpacing: 12),
            itemBuilder: (context, index) {
            if(index %2 == 0){
              isOdd = false;
            }
            else
              isOdd = true;

              return InkWell(
                  onTap:() {
                    onClicked(categories[index]);
                  },
                  child: CategoryItem(isOdd: isOdd,model:categories[index]));
            },
            itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}

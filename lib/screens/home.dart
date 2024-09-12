import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/screens/categories.dart';
import 'package:news_app/screens/drawerTab.dart';
import 'package:news_app/screens/news_Details.dart';
import 'package:news_app/screens/search_tab.dart';
import 'package:news_app/screens/tab_bar.dart';
import 'package:news_app/screens/tab_item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: Drawer(
                child: drawerTab(
              onClick: onDrawerClick,
            )),
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 75,
              iconTheme: IconThemeData(color: Colors.white, size: 35),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchTab());

                  },
                  icon: Icon(Icons.search),
                )
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
              backgroundColor: Colors.green,
              title: Text(
                "News App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            body: selectedCategory == null
                ? CategoriesTab(
                    onClicked: onCategorySelect,
                  )
                : TabbarWidget(
                    id: selectedCategory!.id,
                  )));
  }

  CategoryModel? selectedCategory = null;

  onDrawerClick(id) {
    if (id == drawerTab.CATEGORY_ID) {
      selectedCategory = null;
      Navigator.pop(context);
    } else if (id == drawerTab.SETTINGS_ID) {}
    setState(() {});
  }

  onCategorySelect(cat) {
    selectedCategory = cat;
    setState(() {});
  }
}

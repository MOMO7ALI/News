import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawerTab extends StatelessWidget {
  Function onClick;

  drawerTab({required this.onClick, super.key});

  static const int CATEGORY_ID = 1;
  static const int SETTINGS_ID = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Center(
                child: Text(
              "News App!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                      offset: Offset(5.0, 6.0),
                      blurRadius: 10.0,
                      color: Colors.black45.withOpacity(0.5))
                ],
              ),
            )),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                onClick(CATEGORY_ID);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.format_list_bulleted_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Categories",
                      style: TextStyle(fontSize: 28),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                onClick(SETTINGS_ID);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 28),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

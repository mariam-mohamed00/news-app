import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news/category/category_details.dart';
import 'package:news/category/category_fragment.dart';
import 'package:news/home/home_drawer.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/my_theme.dart';
import 'package:news/settings/settings_tab.dart';
import '../model/category.dart';
import 'package:url_launcher/url_launcher.dart';

import '../search/news_search_delegate.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset('assets/images/background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover)),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
                selectedDrawerItem == HomeDrawer.settings
                    ? 'Settings'
                    : selectedCategory == null
                        ? 'News App'
                        : selectedCategory!.title,
                style: Theme.of(context).textTheme.titleLarge),

            actions: [
              IconButton(onPressed: (){
                showSearch(
                    context: context,
                    delegate: NewsSearchGelegate()
                );
              }, icon: Icon(Icons.search,size: 30,))
            ],

          ),
          drawer: Drawer(
            child: HomeDrawer(
              onDrawerItemClick: onDrawerItemClick,
            ),
          ),
          body: selectedDrawerItem == HomeDrawer.settings
              ? SettingsTab()
              : selectedCategory == null
                  ? CategoryFragment(onCategoryClick: onCategoryClick)
                  : CategortDetails(category: selectedCategory!),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;

    setState(() {});
  }

  int selectedDrawerItem = 1;

  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);

    setState(() {});
  }
}

import 'package:ecommerce_app/views/widgets/categories_tab_view.dart';
import 'package:ecommerce_app/views/widgets/home_tab_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Home',
              ),
              Tab(
                text: 'Categories',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                HomeTabView(),
                CategoriesTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_using_hive/views/widgets/custom_drawer.dart';


import 'package:todo_using_hive/views/widgets/fAB.dart';
import 'package:todo_using_hive/views/widgets/home_app_bar.dart';
import 'package:todo_using_hive/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: const HomeViewBody(),
      floatingActionButton: const FAB(),
      drawer: const CustomDrawer(),
    );
  }
}


import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:giphy/home_page/controller/home_controller.dart';

import '../../core/constants.dart';
import '../../trending_section/views/trending_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool isDark = false;

  final homeController = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? kblack : kwhite,
      appBar: AppBar(
        backgroundColor: kblue,
        title: Text(
          "Home",
          style: TextStyle(color: isDark ? kwhite : kblack),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(isDark ? kwhite : kblack)),
            onPressed: () {
              Get.to(
                () => const TrendingPage(),
                transition: Transition.cupertino,
              );
            },
            child: Text(
              "Trending",
              style: TextStyle(color: isDark ? kblack : kwhite),
            ),
          ).paddingOnly(right: 10)
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.atEdge) {
            if (_scrollController.position.userScrollDirection ==
                ScrollDirection.reverse) {
              if (homeController.homeModel.length < 50) {
                homeController.getHomePage(true);
                log("max scroll reached");
              }
            }
          }
          return true;
        },
        child: GetBuilder<HomeController>(
          id: "home_page",
          builder: (controller) {
            return controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                          itemCount: controller.homeModel.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 150,
                              width: 150,
                              child: ExtendedImage.network(
                                controller
                                    .homeModel[index].images!.original!.url
                                    .toString(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        id: "pagination",
        builder: (controller) {
          return controller.isPaginationActive
              ? Container(
                  color: isDark ? kwhite : null,
                  height: 50,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator.adaptive(),
                    ],
                  ),
                )
              : const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isDark = !isDark;
          });
        },
        child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }
}

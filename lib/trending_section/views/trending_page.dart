import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:giphy/home_page/controller/home_controller.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    // getting all the data
    homeController.getTrending();
  }

  final debounce = Debouncer(delay: const Duration(milliseconds: 300));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("Trending"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // searching the list
                debounce.call(() {
                  homeController.searchTrending(keyword: value.toString());
                });
              },
            ),
          ),
        ),
      ),
      body: GetBuilder<HomeController>(
        id: "trending_page",
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : controller.searchModel.isEmpty
                  ? const Center(
                      child: Text("No data found"),
                    )
                  : GridView.builder(
                      itemCount: controller.searchModel.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 150,
                          width: 150,
                          child: ExtendedImage.network(
                            controller.searchModel[index].images!.original!.url
                                .toString(),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}

import 'package:at_tareeq/app/controllers/lives_controller.dart';
import 'package:at_tareeq/core/utils/helpers.dart';
import 'package:at_tareeq/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LivesPage extends GetView<LivesController> {
  const LivesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livestreams'),
      ),
      body: controller.obx((state) {
        return Obx(() {
          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => controller.fetchModels(true),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: controller.scroller,
                      itemCount: state!.length,
                      itemBuilder: (_, index) {
                        final livestream = state[index];
                        return Card(
                          child: ListTile(
                            enabled: !livestream.status.isEnded(),
                            onTap: () {
                              Get.toNamed(Routes.STREAMPLAYER,
                                  arguments: {'livestream': livestream});
                            },
                            leading: Text(livestream.status.getString()),
                            trailing:
                                Text(formatDateTime(livestream.startTime)),
                            title: Text(livestream.title),
                            subtitle: Text(livestream.description),
                          ),
                        );
                      }),
                ),
              ),
              if (controller.isLoadingMore)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
            ],
          );
        });
      }),
    );
  }
}

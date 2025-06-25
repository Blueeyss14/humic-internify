import 'package:flutter/material.dart';
import 'package:humic_internify/src/core/refresh_apps.dart';
import 'package:humic_internify/src/shared/components/humic_loading.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HumicRefresher extends StatelessWidget {
  final Widget? child;
  final bool? showLoading;
  const HumicRefresher({super.key, this.child, this.showLoading = true});

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController(
      initialRefresh: false,
    );
    return SmartRefresher(
      onRefresh: () async {
        await refreshAllData();
        refreshController.refreshCompleted();
      },
      controller: refreshController,
      header: WaterDropHeader(
        refresh:
            showLoading == true
                ? const HumicLoading()
                : const SizedBox.shrink(),
        waterDropColor: redHumic,
      ),
      enablePullDown: true,
      child: child,
    );
  }
}

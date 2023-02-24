import 'package:admin/component/recent_files.dart';
import 'package:admin/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../component/header.dart';
import '../../../../component/my_fields.dart';
import '../../../../component/storage_details.dart';
import '../../../../constants/constants.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height:Responsive.isMobile(context)? Get.height*1.8:Get.height*1,
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(height: defaultPadding),
                        RecentFiles(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) Expanded(child: StorageDetails()),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))  Expanded(
                  flex: 1,child: StorageDetails())
              ],
            ),
          ],
        ),
      ),
    );
  }
}

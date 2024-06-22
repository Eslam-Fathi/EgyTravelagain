import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/view_all_widget.dart';
import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsManager.primary.withOpacity(1),
      appBar: CustomAppBar(
        title: 'Plans',
        enableBack: false,
        leading: backButton(context),
      ),
      body: const ViewAllW(
        screenTitle: 'Plans',
      ),
    ));
  }
}

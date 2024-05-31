import "package:egy_travel/Data/dummy_data.dart";
import "package:egy_travel/view/Widgets/shared_appbar.dart";
import "package:egy_travel/res/colors_manager.dart";
import "package:egy_travel/view/Widgets/view_all_widget.dart";
import "package:flutter/material.dart";

class ViewAll extends StatelessWidget {
  const ViewAll({super.key, required this.screenTilte});
  final String screenTilte;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorsManager.primary.withOpacity(1),
            appBar: CustomAppBar(
              title: screenTilte,
              enableBack: false,
              leading: backButton(context),
            ),
            body: ViewAllW(screenTitle: screenTilte, items: items)
            ));
  }
}

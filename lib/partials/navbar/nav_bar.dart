import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/partials/navbar/burger_menu.dart';
import 'package:manabees_app_mobile/partials/navbar/rucher_menu.dart';
import 'package:manabees_app_mobile/style/constants.dart';

@immutable
class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: kVerticalSpacer / 2, bottom: kVerticalSpacer),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(child: BurgerMenu()),
          SizedBox(
            width: kHorizontalSpacer,
          ),
          Expanded(child: RucherMenu()),
        ],
      ),
    );
  }
}

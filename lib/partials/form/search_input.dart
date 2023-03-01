import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/style/constants.dart';

import 'text_input.dart';


/**
 * @class permet de créer le widget SearchInput
 */

@immutable
class SearchInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalSpacer / 2,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: kBorderRadiusItem,
            boxShadow: kBoxShadowItem),
        child: TextInput(
            icon: Icons.search,
            labelText: 'Rechercher ',
            hintText: "une ruche par son nom",
            keyboardType: TextInputType.text,
            validator: (value) {},
            onChanged: onChanged,
            autofocus: false),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';

import '../model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? MyTheme.primaryLight : Colors.transparent,
          border: Border.all(width: 3, color: MyTheme.primaryLight)),
      child: Text(
        source.name ?? '',
        style: isSelected
            ? Theme.of(context).textTheme.titleLarge
            : Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: MyTheme.primaryLight),
      ),
    );
  }
}

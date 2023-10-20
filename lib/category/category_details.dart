import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';
import 'package:news/tabs/tab_container.dart';

import '../api_manager.dart';
import '../model/SourceResponse.dart';
import '../model/category.dart';

class CategortDetails extends StatefulWidget {
  Category category;

  CategortDetails({required this.category});

  @override
  State<CategortDetails> createState() => _CategortDetailsState();
}

class _CategortDetailsState extends State<CategortDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryLight,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'Something went wrong',
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {});
                },
                child: Text('Try again'),
              ),
            ],
          );
        }

        /// response => (status) ok-error
        if (snapshot.data?.status != 'ok') {
          // code, message
          return Column(
            children: [
              Text(snapshot.data?.message ?? ""),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {});
                },
                child: Text('Try again'),
              ),
            ],
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return TabContainer(sourcesList: sourcesList);
      },
    );
  }
}

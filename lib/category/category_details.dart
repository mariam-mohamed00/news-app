import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';
import 'package:news/tabs/tab_container.dart';
import 'package:provider/provider.dart';
import '../model/category.dart';
import 'category_datails_view_model.dart';

class CategortDetails extends StatefulWidget {
  Category category;
  CategortDetails({required this.category});

  @override
  State<CategortDetails> createState() => _CategortDetailsState();
}

class _CategortDetailsState extends State<CategortDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategory(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage != null) {
              // error
              return Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getSourceByCategory(widget.category.id);
                    },
                    child: Text('Try again'),
                  ),
                ],
              );
            } else if (viewModel.sourceList == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryLight,
                ),
              );
            } else {
              return TabContainer(sourcesList: viewModel.sourceList!);
            }
          },
        ));

    //   FutureBuilder<SourceResponse>(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: MyTheme.primaryLight,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text(
    //             'Something went wrong',
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               ApiManager.getSources(widget.category.id);
    //               setState(() {});
    //             },
    //             child: Text('Try again'),
    //           ),
    //         ],
    //       );
    //     }
    //
    //     /// response => (status) ok-error
    //     if (snapshot.data?.status != 'ok') {
    //       // code, message
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message ?? ""),
    //           ElevatedButton(
    //             onPressed: () {
    //               ApiManager.getSources(widget.category.id);
    //               setState(() {});
    //             },
    //             child: Text('Try again'),
    //           ),
    //         ],
    //       );
    //     }
    //     var sourcesList = snapshot.data?.sources ?? [];
    //     return TabContainer(sourcesList: sourcesList);
    //   },
    // );
  }
}

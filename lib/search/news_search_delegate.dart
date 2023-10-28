import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api_manager.dart';
import '../model/NewsResponse.dart';
import '../my_theme.dart';
import '../news/news_container_view_model.dart';
import '../news/news_item.dart';

class NewsSearchGelegate extends SearchDelegate {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Suggestions'));
    }
    return
        //   ChangeNotifierProvider(
        //     create: (context) => viewModel,
        //     child: Consumer<NewsContainerViewModel>(
        //       builder: (context, viewModel, child) {
        //         if (viewModel.errorMessage != null) {
        //           return Column(
        //             children: [
        //               Text(viewModel.errorMessage!),
        //               ElevatedButton(
        //                   onPressed: () {
        //                     viewModel.searchNews(query);
        //                   },
        //                   child: Text('Try again'))
        //             ],
        //           );
        //         } else if (viewModel.newsList == null) {
        //           return Center(
        //             child: CircularProgressIndicator(
        //               color: MyTheme.primaryLight,
        //             ),
        //           );
        //         } else {
        //           return ListView.builder(
        //             itemBuilder: (context, index) {
        //               return NewsItem(news: viewModel.newsList![index]);
        //             },
        //             itemCount: viewModel.newsList!.length,
        //           );
        //         }
        //       },
        //     )
        //
        // );

        FutureBuilder<NewsResponse?>(
      future: ApiManager.searchNews(query),
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
              Text('Something went wrong in news'),
              ElevatedButton(onPressed: () {}, child: Text('Try again'))
            ],
          );
        }

        /// response
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(onPressed: () {}, child: Text('Try again'))
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Suggestions'));
    }
    return FutureBuilder<NewsResponse>(
      future: ApiManager.searchNews(query),
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
              Text('Something went wrong in news'),
              ElevatedButton(
                  onPressed: () {
                    // ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    // setState(() {});
                  },
                  child: Text('Try again'))
            ],
          );
        }

        /// response
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(
                  onPressed: () {
                    // ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    // setState(() {});
                  },
                  child: Text('Try again'))
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return MyTheme.lightTheme;
  }
}

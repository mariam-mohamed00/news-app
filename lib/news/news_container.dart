import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/my_theme.dart';
import 'package:news/news/news_container_view_model.dart';
import 'package:news/news/news_item.dart';
import 'package:provider/provider.dart';

import '../model/NewsResponse.dart';

class NewsContainer extends StatefulWidget {
  Source source;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  final scrollController = ScrollController();
  int pageNumber = 1;
  List<News> news = [];
  bool shouldLoadingNextPage = false;
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        bool isTop = scrollController.position.pixels == 0;
        if(!isTop){
          shouldLoadingNextPage = true;
          setState(() {

          });
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    if(shouldLoadingNextPage){
      ApiManager.getNewsBySourceId(sourceId: widget.source.id??'', pageNumber: ++pageNumber)
          .then((newsResponse) => news.addAll(newsResponse?.articles ?? []));
      shouldLoadingNextPage=false;
      setState(() {

      });
    }
    viewModel.getNewsBtSourceId( widget.source.id ?? '');
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsContainerViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage != null) {
              return Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getNewsBtSourceId(widget.source.id ?? '');
                      },
                      child: Text('Try again'))
                ],
              );
            }
            else if (news == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryLight,
                ),
              );
            }
            else {
              if(news.isEmpty && viewModel.newsList!.isNotEmpty){
                news = viewModel.newsList!;
              }else if(viewModel.newsList!.isNotEmpty && news.first.title != viewModel.newsList!.first.title){
                news = viewModel.newsList!;
                scrollController.jumpTo(0);
              }
              return ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return NewsItem(news: news[index]);
                },
                itemCount: news.length,
              );
            }
          },
        ));
    //   FutureBuilder<NewsResponse>(
    //   future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
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
    //           Text('Something went wrong in news'),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //                 setState(() {});
    //               },
    //               child: Text('Try again'))
    //         ],
    //       );
    //     }
    //
    //     /// response
    //     if (snapshot.data?.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message ?? ''),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //                 setState(() {});
    //               },
    //               child: Text('Try again'))
    //         ],
    //       );
    //     }
    //     var newsList = snapshot.data?.articles ?? [];
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsItem(news: newsList[index]);
    //       },
    //       itemCount: newsList.length,
    //     );
    //   },
    // );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

// import 'package:flutter/material.dart';
// import 'package:news/model/NewsResponse.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:news/my_theme.dart';
//
// class NewsArticle extends StatelessWidget {
//   static const String routeName = 'News Article';
//   News news;
//   NewsArticle({required this.news});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//             color: MyTheme.whiteColor,
//             child: Image.asset('assets/images/background.png',
//                 width: double.infinity,
//                 height: double.infinity,
//                 fit: BoxFit.cover)),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(40),
//               ),
//             ),
//             centerTitle: true,
//             title: Text(news?.title ?? 'news',
//                 style: Theme.of(context).textTheme.titleLarge),
//           ),
//           body: Container(
//             padding: EdgeInsets.all(15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // ClipRRect(
//                 //   borderRadius: BorderRadius.circular(24),
//                 //   child: CachedNetworkImage(
//                 //     imageUrl: news.urlToImage ?? '',
//                 //     width: double.infinity,
//                 //     height: MediaQuery.of(context).size.height * 0.3,
//                 //     fit: BoxFit.fill,
//                 //     placeholder: (context, url) => Center(child: CircularProgressIndicator(color: MyTheme.primaryLight,)),
//                 //     errorWidget: (context, url, error) => Icon(Icons.error),
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 15,
//                 ),
//             //     Text(
//             //       news?.author ?? '',
//             //       style: Theme.of(context).textTheme.titleSmall,
//             //     ),
//             //     SizedBox(
//             //       height: 15,
//             //     ),
//             //     Text(
//             //       news?.title ?? '',
//             //       style: Theme.of(context)
//             //           .textTheme
//             //           .titleSmall!
//             //           .copyWith(color: MyTheme.blackColor),
//             //     ),
//             //     SizedBox(
//             //       height: 15,
//             //     ),
//             //     Text(
//             //       news?.publishedAt ?? '',
//             //       textAlign: TextAlign.end,
//             //       style: Theme.of(context).textTheme.titleSmall,
//             //     ),
//             //     SizedBox(
//             //       height: 15,
//             //     ),
//             //     Text(
//             //       news?.description ?? '',
//             //       textAlign: TextAlign.end,
//             //       style: Theme.of(context).textTheme.titleSmall,
//             //     ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/NewsResponse.dart';
import '../my_theme.dart';

class NewsArtical extends StatelessWidget {
  final News news;

  NewsArtical({required this.news});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset('assets/images/background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover)),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              news.title ?? '',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage ?? '',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                      color: MyTheme.primaryLight,
                    )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  news.source?.name ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  news.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.blackColor),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(news.publishedAt ?? '',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleSmall),
                SizedBox(
                  height: 15.0,
                ),
                Text(news.content ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w300,
                        )),
                SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'View full article',
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: MyTheme.blackColor),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

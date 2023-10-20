import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/my_theme.dart';
import 'package:news/news/news_article.dart';

class NewsItem extends StatefulWidget {
  News news;

  NewsItem({required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsArtical(
                            news: widget.news,
                          )));
              setState(() {});
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: CachedNetworkImage(
                imageUrl: widget.news.urlToImage ?? '',
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
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.news.author ?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.news.title ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.blackColor),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.news.publishedAt ?? '',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

import 'package:articles_app/data/dataproviders/local/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Column(
        children: [
          Text(article.author ?? "Unknown author"),
          Text(article.description)
        ],
      ),
      leading: CachedNetworkImage(
        imageUrl: article.urlImage,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

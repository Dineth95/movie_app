import 'package:flutter/material.dart';
import 'package:movie_app/core/config.dart';
import 'package:movie_app/features/data/models/result_model.dart';

class MovieListItem extends StatelessWidget {
  final ResultModel? resultModel;
  final int index;

  const MovieListItem(
      {Key? key, required this.resultModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(Config.imagePath + (resultModel?.posterPath ?? '')),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                '#$index ${resultModel?.originalTitle}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '(${resultModel?.title})',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                '${resultModel?.releaseDate ?? ''} (${resultModel?.originalLanguage})',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}

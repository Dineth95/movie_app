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
      width: MediaQuery.of(context).size.width - 50,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image.network(
            Config.imagePath + (resultModel?.posterPath ?? ''),
            width: 60,
            height: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#$index ${resultModel?.originalTitle}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                Text(
                  '(${resultModel?.title})',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '${resultModel?.releaseDate ?? ''} (${resultModel?.originalLanguage}) - ${(resultModel?.adult ?? false) ? 'R' : 'All'}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '(${resultModel?.overview})',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  maxLines: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

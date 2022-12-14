import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/config.dart';
import 'package:movie_app/features/data/models/result_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MovieListItem extends StatelessWidget {
  final ResultModel? resultModel;
  final int index;

  const MovieListItem(
      {Key? key, required this.resultModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                      imageUrl:
                          Config.imagePath + (resultModel?.posterPath ?? ''),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      width: 120,
                      height: 180,
                      fit: BoxFit.fitHeight),
                ),
                const SizedBox(
                  width: 120,
                  height: 25,
                )
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: CircularPercentIndicator(
                backgroundColor: Colors.white,
                radius: 25.0,
                lineWidth: 5.0,
                percent: resultModel!.voteAverage! / 10,
                center: CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color.fromARGB(255, 2, 41, 109),
                  child: Text(
                    ((resultModel?.voteAverage ?? 0) * 10).floor().toString() +
                        "%",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                progressColor: Colors.green,
              ),
            )
          ]),
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
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '(${resultModel?.overview})',
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 1.0), // shadow direction: bottom right
          )
        ],
      ),
    );
  }
}

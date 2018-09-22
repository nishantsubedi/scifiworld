// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scifiMovieResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScifiMovieResult _$ScifiMovieResultFromJson(Map<String, dynamic> json) {
  return new ScifiMovieResult(
      json['vote_count'] as int,
      json['id'] as int,
      (json['vote_average'] as num)?.toDouble(),
      json['title'] as String,
      (json['popularity'] as num)?.toDouble(),
      json['poster_path'] as String,
      json['original_language'] as String,
      json['original_title'] as String,
      (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
      json['backdrop_path'] as String,
      json['adult'] as bool,
      json['overview'] as String,
      json['release_date'] as String);
}

abstract class _$ScifiMovieResultSerializerMixin {
  int get voteCount;
  int get id;
  double get voteAverage;
  String get title;
  double get popularity;
  String get posterPath;
  String get originalLanguage;
  String get originalTitle;
  List<int> get genreIds;
  String get backdropPath;
  bool get adult;
  String get overview;
  String get releaseDate;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'vote_count': voteCount,
        'id': id,
        'vote_average': voteAverage,
        'title': title,
        'popularity': popularity,
        'poster_path': posterPath,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'genre_ids': genreIds,
        'backdrop_path': backdropPath,
        'adult': adult,
        'overview': overview,
        'release_date': releaseDate
      };
}

import 'package:json_annotation/json_annotation.dart';

part 'scifiMovieResult.g.dart';

@JsonSerializable()
class ScifiMovieResult extends Object with _$ScifiMovieResultSerializerMixin {
  ScifiMovieResult(
      this.voteCount,
      this.id,
      this.voteAverage,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate);

  @JsonKey(name: 'vote_count')
  int voteCount;

  int id;

  @JsonKey(name: 'vote_average')
  double voteAverage;

  String title;

  double popularity;

  @JsonKey(name: 'poster_path')
  String posterPath;

  @JsonKey(name: 'original_language')
  String originalLanguage;

  @JsonKey(name: 'original_title')
  String originalTitle;

  @JsonKey(name: 'genre_ids')
  List<int> genreIds;

  @JsonKey(name: 'backdrop_path')
  String backdropPath;

  bool adult;

  String overview;

  @JsonKey(name: 'release_date')
  String releaseDate;

  factory ScifiMovieResult.fromJson(Map<String, dynamic> json) =>
      _$ScifiMovieResultFromJson(json);
}

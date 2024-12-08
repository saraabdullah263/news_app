import 'package:news_app/screens/category/models/news_model.dart';

abstract class SearchState {}

class SearchIntialStete extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Articles>? articals;

  SearchSuccess({this.articals});
}

class SearchError extends SearchState {
  final String? error;

  SearchError({this.error});
}

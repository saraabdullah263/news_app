

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/screens/category/models/news_model.dart';
import 'package:news_app/screens/home/search_screen/search_veiw_model/search_state.dart';

class SearchScreenModel extends Cubit<SearchState>{
    
SearchScreenModel(SearchState initialState) : super(initialState);

  void searchNews(String query)async{
    if(query.isEmpty){
      emit(SearchIntialStete());
      return;
    }
    emit(SearchLoading()); 
   try{ NewsModel newsModel= await ApiServices.getArticalSearch(query);
    emit(SearchSuccess(articals: newsModel.articles));}
    catch(e){
      emit(SearchError(error: e.toString()));
    }
  }  
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_colors.dart';
import 'package:news_app/comman/widgets/error_widget.dart';
import 'package:news_app/comman/widgets/laoding_widget.dart';
import 'package:news_app/screens/home/search_screen/search_veiw/artical_details_search.dart';
import 'package:news_app/screens/category/artical_detalis.dart';
import 'package:news_app/screens/home/search_screen/search_veiw_model/search_screen_model.dart';
import 'package:news_app/screens/home/search_screen/search_veiw_model/search_state.dart';

class SearchScreen extends SearchDelegate {
    

   @override
  TextStyle get searchFieldStyle => TextStyle(
        color:AppColors.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
        
      );
      @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    enabledBorder:OutlineInputBorder (borderSide:  BorderSide(color:AppColors.primaryColor),
    borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder (borderSide: BorderSide(color: AppColors.primaryColor),
    borderRadius: BorderRadius.circular(5),
    ),
    border: OutlineInputBorder (borderSide: BorderSide(color: AppColors.primaryColor),
    borderRadius: BorderRadius.circular(5),
    ),
    disabledBorder: OutlineInputBorder (borderSide: BorderSide(color:AppColors.primaryColor),
    borderRadius: BorderRadius.circular(5),
    ),
    hintStyle:const TextStyle(color: Colors.grey),
    
  );
static  final SearchScreenModel viewModel =SearchScreenModel(SearchIntialStete());
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon:const Icon(Icons.close),color: AppColors.primaryColor,iconSize: 25,)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back),color:AppColors.primaryColor,iconSize: 25,);
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..searchNews(query),
      child: BlocBuilder<SearchScreenModel,SearchState>(builder: (context, state) {
        if(state is SearchLoading){
          return const LaodingWidget();
        }
        else if(state is SearchSuccess){
          var articles = state.articals;
                  if (articles == null || articles.isEmpty) {
            return const Center(child: Text('No articles found.'));
                  }
          
          return ListView.separated(itemBuilder: (context, index) {
            var article=articles[index];
            return GestureDetector(
               onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                 return  ArticalDetalis(article: article);
               },
               ));
      
               } ,
              child: ArticalDetalisSearch(article: article));
          }, separatorBuilder: (context, index) {
            return const Divider();
          }, itemCount: articles.length);
        }
        else if(state is SearchError){
          return ErroreWidget(errorMasege: state.error.toString());
        }
        return const  Center(child: Text('Some Tging Wrong',));
       
         
      
      },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }


}

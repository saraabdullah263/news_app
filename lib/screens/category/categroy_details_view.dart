import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/comman/widgets/error_widget.dart';
import 'package:news_app/comman/widgets/laoding_widget.dart';
import 'package:news_app/screens/category/models/source_model.dart';
import 'package:news_app/screens/category/widgets/sources_list.dart';

class CategroyDetailsView extends StatefulWidget {
  const CategroyDetailsView({super.key, required this.id});
  final String id;

  @override
  State<CategroyDetailsView> createState() => _CategroyDetailsViewState();
}

class _CategroyDetailsViewState extends State<CategroyDetailsView> {
  int selectedSubCatId = 0;
  @override
  Widget build(BuildContext context) {
    
    return ListView(
      children: [
        FutureBuilder<SourcesModel>(
      future: ApiServices.getSources(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
        return const LaodingWidget();
        } else if (snapshot.hasError) {
        return  ErroreWidget(errorMasege:  snapshot.error.toString());
        }
        SourcesModel ?sourcesModel=snapshot.data;
        List<Sources>sources= sourcesModel?.sources??[];
  
        return CategoryList( changeSelsectedSource: (p0) {
          
        }, sources: sources);
      },
    ),
       
      ],
    );
  }
}

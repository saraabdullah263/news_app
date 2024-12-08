import 'package:flutter/material.dart';
import 'package:news_app/comman/app_assets.dart';
import 'package:news_app/comman/widgets/custom_drawer.dart';
import 'package:news_app/screens/category/categroy_details_view.dart';
import 'package:news_app/screens/category/catogeries_view.dart';
import 'package:news_app/screens/category/models/catogory_model.dart';
import 'package:news_app/screens/home/search_screen/search_veiw/search_screen_view.dart';
import 'package:news_app/screens/settings/settings_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedView = DrawerItem.categories;
  CatogoryModel ?selectedCategroy;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.patternimage,
                  ),
                  fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
            drawer: CustomDrawer(
              onSelect: (p0) {
                selectedView = p0;
                selectedCategroy=null;
                setState(() {});
              },
            ),
            appBar: AppBar(
              title: selectedCategroy!=null?Text(selectedCategroy!.title)
              :selectedView==DrawerItem.categories?const Text('News App'):const Text('Settings') ,
              actions: selectedCategroy!=null?
              [
                IconButton(icon:const Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Icon(Icons.search),
                ),onPressed: () {
                showSearch(context: context, delegate: SearchScreen());
                },)
              ]:null
            ),
            body: selectedCategroy!=null?CategroyDetailsView(id: selectedCategroy!.id) :selectedView == DrawerItem.categories
                ?  CatogeriesView(onSelectCategory: (p0) {
                  selectedCategroy=p0;
                  setState(() {
                    
                  });
                },)
                : const SettingsView()),
      ),
    );
  }
 
}

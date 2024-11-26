import 'package:flutter/material.dart';
import 'package:news_app/comman/app_assets.dart';
import 'package:news_app/comman/app_colors.dart';

class CustomTextfaild extends StatefulWidget {
  static const String routeName = 'cutomtextfaild';
  const CustomTextfaild({super.key});

  @override
  State<CustomTextfaild> createState() => _CustomTextfaildState();
}

class _CustomTextfaildState extends State<CustomTextfaild> {
  bool showResults = false;
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
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search Article',
                    prefixIcon:
                        Icon(Icons.search, color: AppColors.primaryColor),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close, color: AppColors.primaryColor),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                          showResults = false;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              if (showResults)
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text('Result ${index + 1}'),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void onSearch() {
    setState(() {
      showResults = true;
    });
  }
}

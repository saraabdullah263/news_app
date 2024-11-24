import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
//todo:lodic
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape:const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Container(
              height: 140.h,
              width: 320.w,
              color: AppColors.primaryColor,
              alignment: Alignment.center,
              child: Text(
                'News App', //todo:localisation
                style: Theme.of(context).textTheme.titleLarge,
              )), 
          ListTile(
            leading: const Icon(
              Icons.list,
              size: 30,
            ),
            title: Text(
              'Categories',//todo:localisation
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text('Settings',//todo:localisation
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    )),
          ),
        ],
      ),
    );
  }
}

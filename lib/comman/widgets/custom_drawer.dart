import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onSelect});
  final Function(DrawerItem) onSelect;
//todo:lodic
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
            onTap: () {
              onSelect(DrawerItem.categories);
              Navigator.of(context).pop();
            },
            leading: const Icon(
              Icons.list,
              size: 30,
            ),
            title: Text(
              'Categories', //todo:localisation
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              onSelect(DrawerItem.settings);
              Navigator.of(context).pop();
            },
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text('Settings', //todo:localisation
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    )),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem { settings, categories }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_colors.dart';
import 'package:news_app/screens/category/models/source_model.dart';
import 'package:news_app/screens/category/widgets/news_list.dart';


class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required this.changeSelsectedSource, required this.sources});
 // final String categoryId;
 final  void Function(String) changeSelsectedSource;
final List<Sources>sources;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String ?selectedSourceId ;
  
  @override
  void initState() {
    super.initState();
    selectedSourceId= widget.sources.isNotEmpty ?widget.sources[0].id:null;
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
              height: 60.h,
              child: ListView.builder(
                //shrinkwrap  physis
                scrollDirection: Axis.horizontal,
                itemCount: widget.sources.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: ChoiceChip(
                    padding: const EdgeInsets.all(5),
                    onSelected: (value) {
                      selectedSourceId = widget.sources[index].id;
                      setState(() {});
                    },
                    label: Text(widget.sources[index].name??''),
                    selected: widget.sources[index].id == selectedSourceId,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                        color: widget.sources[index].id == selectedSourceId
                            ? Colors.white
                            : AppColors.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    selectedColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        side: BorderSide(color: AppColors.primaryColor)),
                  ),
                ),
              ),
            ),
        if (selectedSourceId !=null)  NewsList(sourceId: selectedSourceId!),
           
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/categories_screen/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // chieu rong toi da cho moi muc luoi
        childAspectRatio: 3 / 2, // ti lieu cho moi doi tuong
        crossAxisSpacing: 20, // chieu rong giua cac o
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (eachCategory) => CategoryItem(
                eachCategory.id, eachCategory.title, eachCategory.color),
          )
          .toList(),
    );
  }
}

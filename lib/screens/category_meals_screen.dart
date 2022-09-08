import 'package:flutter/material.dart';
import '/widgets/category_meals_screen/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/Category_meals';
  // final String categoryId;
  // final String categoryTitle;

  CategoryMealsScreen();

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    //..
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final String categoryId = routeArgs['id']!;
      categoryTitle = routeArgs['title']!;
      // tim ra meal cung categoryID
      displayMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}

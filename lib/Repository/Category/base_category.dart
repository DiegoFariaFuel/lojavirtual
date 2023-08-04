

import '../../Models/catalogy_model.dart';

abstract class BaseCategoryRepository {
  Stream <List<Category>> getAllCategories();

}
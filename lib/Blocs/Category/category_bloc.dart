


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/catalogy_model.dart';
import '../../Repository/Category/category_repository.dart';
import 'category_event.dart';
import 'category_state.dart';



class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({
    required CategoryRepository categoryRepository,
  })  : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<CategoryEvent>((event, emit) {});
  }

  Stream<CategoryState> mapEventoState(Category event) async* {
    if (event is LoadCategories) {
      yield* _mapLoadCategoriesToState();
    }
    if (event is UpdateCategories) {
      yield* _mapUpdateCategoriesToState(event as UpdateCategories);
    }
  }

  Stream<CategoryState> _mapLoadCategoriesToState() async* {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (categories) => add(
            UpdateCategories(categories),
          ),
        );
  }

  Stream<CategoryState> _mapUpdateCategoriesToState(UpdateCategories event) async* {
   yield CategoryLoaded(categories: event.categories);
  }

}

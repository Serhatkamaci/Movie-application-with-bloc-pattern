import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/category.dart';

class HomePageCubit extends Cubit<List<Category>>{

  HomePageCubit(): super(<Category>[]);
  var refCategory= FirebaseDatabase.instance.ref().child("kategoriler");

  Future<void> getAllCategories() async{

    var categoryList=<Category>[];

    refCategory.onValue.listen((event){
      var responseData= event.snapshot.value as dynamic;
      if(responseData!=null){
        responseData.forEach((key,value){
          var category=Category.fromJson(key, value);
          categoryList.add(category);
        });
        emit(categoryList);
      }
    });
  }

  Future<void> searchCategory(String searchWord) async{

    var categoryList=<Category>[];

    refCategory.onValue.listen((event){
      var responseData= event.snapshot.value as dynamic;
      if(responseData!=null){
        responseData.forEach((key,value){
          var category=Category(category_id: key, category_name: value["kategori_ad"]);
          if(category.category_name.contains(searchWord))
            {
              categoryList.add(category);
            }
        });
        emit(categoryList);
      }
    });
  }
}
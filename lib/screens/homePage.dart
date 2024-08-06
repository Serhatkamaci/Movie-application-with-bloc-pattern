import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc_pattern/cubit/homePageCubit.dart';
import 'package:movie_app_bloc_pattern/screens/categoryDetail.dart';
import '../models/category.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  bool search=false;
  var tfSearchController= TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          search ? IconButton(
            onPressed: (){
              setState(() {
                search=false;
                tfSearchController.text="";
              });
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.black,
            ),
          ): IconButton(
            onPressed: (){
              setState(() {
                search=true;
              });
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        title: search ? TextField(
          onChanged: (value){
            context.read<HomePageCubit>().searchCategory(value);
          },
          controller: tfSearchController,
          decoration: InputDecoration(
            hintText: "Kategori ara",
            hintStyle: TextStyle(
              color: Colors.black,
            )
          ),
        ) :Text("Kategoriler",
          style: TextStyle(
            color: Colors.black,
          ),),

        backgroundColor: Colors.yellowAccent,
      ),
      body: BlocBuilder<HomePageCubit, List<Category>>(
        builder: (context, categoryList){

          if(categoryList.isNotEmpty)
            {
              return ListView.builder(
                itemCount: categoryList.length,
                itemBuilder: (context, index){
                  var category=categoryList[index];
                  return SizedBox(
                    height: 75,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryDetail(category: category)));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(category.category_name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          else
            {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              );
            }
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
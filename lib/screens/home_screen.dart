import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/categories.dart';
import 'package:food_recipe_app/models/food.dart';
import 'package:food_recipe_app/screens/quick_food_screen.dart';
import 'package:food_recipe_app/utils/color_constant.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentCart= 'All';

  var index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///appbar
              Row(
                children: [
                  Text(
                    'What are you\ncooking today?',
                    style: TextStyle(fontSize: 31, fontWeight: FontWeight.w700,height: 1),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(15),),
                        backgroundColor: Colors.white,
                        fixedSize: Size(55, 55)
                      ),
                      icon: Icon(Iconsax.notification))
                ],
              ),
              SizedBox(height: 20,),
              ///texField
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Row(
                  children: [
                    Icon(Iconsax.search_normal),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search any recipes',
                          hintStyle: TextStyle(
                            color: Colors.grey
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ///image container
              Container(
                height: 190,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  image: DecorationImage(
                      image:NetworkImage('https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSMQb-sYL_I7w9SH1pjF9Z8dmGMMIkV8QQjL-plCAUr5GAv8Fb0'),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              SizedBox(height: 20,),
              Text('Categories',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 20,),
              ///categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                    List.generate(category.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: currentCart==category[index]
                              ?kprimaryColor:Colors.white,
                          borderRadius: BorderRadius.circular(21)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 21),
                        margin: EdgeInsets.only(right: 20),
                        child: Text(category[index],style: TextStyle(color: currentCart==category[index]?Colors.white:Colors.grey.shade400)),
                      );
                    })
                ),
              ),
              SizedBox(height: 20,),
              /// quick and FastList
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Quick & Fast',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)
                    ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>QuickFoodScreen(),));
                  }, child: Text('View all',))
                ],
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row (
                  children: List.generate(category.length, (index) {
                   return Container(
                      margin: EdgeInsets.only(right: 10),
                     width: 200,
                     child: Stack(
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                               height: 140,
                               width: double.infinity,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(21),
                                 image: DecorationImage(
                                   image: NetworkImage(foods[index].image)
                                 )
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text(foods[index].name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500
                             ),
                             ),
                             SizedBox(height: 10,),
                             Row(
                               children: [
                                 Icon(Iconsax.flash_1,size: 18,
                                 color: Colors.grey),
                                 Text('${foods[index].cal} cal',
                                   style: TextStyle(fontSize: 12,
                                       color: Colors.grey
                                   ),
                                 ),
                                 Text(' . ',
                                   style: TextStyle(fontSize: 12,
                                       color: Colors.grey
                                   ),
                                 ),
                                 Icon(Iconsax.clock,size: 18,
                                     color: Colors.grey),
                                 Text('${foods[index].time} min',
                                   style: TextStyle(fontSize: 12,
                                       color: Colors.grey
                                   ),
                                 )
                               ],
                             )
                           ],
                         ),
                         Positioned(
                           top: 1,
                             right: 1,
                             child: IconButton(onPressed: (){},
                               style: IconButton.styleFrom(
                                 fixedSize: Size(31, 31),
                                 backgroundColor: Colors.white,
                                 iconSize: 21,
                               ),
                               icon: Icon(Iconsax.heart),))
                       ],
                     ),
                   );
                  }),
                ),
              ),
             //Text(foods[index].name)
            ],
          ),
        ),
      ),
    );
  }
}

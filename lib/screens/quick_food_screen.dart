import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/food.dart';
import 'package:food_recipe_app/screens/recipe_screen.dart';
import 'package:iconsax/iconsax.dart';

class QuickFoodScreen extends StatefulWidget {
  const QuickFoodScreen({super.key});

  @override
  State<QuickFoodScreen> createState() => _QuickFoodScreenState();
}

class _QuickFoodScreenState extends State<QuickFoodScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(55, 55),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      color: Colors.black,
                      icon: Icon(CupertinoIcons.chevron_back),
                    ),
                    Spacer(),
                    Text(
                      'Quick & Fast',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(55, 55),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      color: Colors.black,
                      icon: Icon(Iconsax.notification),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  itemCount: foods.length,
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 21,
                    crossAxisSpacing: 21,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeScreen(food: foods[index],),));
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(foods[index].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  foods[index].name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.flash_1,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "${foods[index].cal} Cal",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Text(
                                      " · ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const Icon(
                                      Iconsax.clock,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "${foods[index].time} Min",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Iconsax.star5,
                                        color: Colors.yellow.shade700, size: 20),
                                    const SizedBox(width: 5),
                                    Text(
                                      "${foods[index].rate}/5",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "(${foods[index].reviews} Reviews)",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade400,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              top: 1,
                              right: 1,
                              child: IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: const Size(30, 30),
                                ),
                                iconSize: 20,
                                icon: foods[index].isLiked!
                                    ? const Icon(
                                  Iconsax.heart5,
                                  color: Colors.red,
                                )
                                    : const Icon(Iconsax.heart),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

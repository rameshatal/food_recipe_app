import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/color_constant.dart';
import 'package:iconsax/iconsax.dart';

import '../models/food.dart';

class RecipeScreen extends StatefulWidget {
  final Food food;
  const RecipeScreen({super.key, required this.food});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  int currentNum = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
          Expanded(
            flex: 6,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kprimaryColor,
                  foregroundColor: Colors.white,
                ),
                child: Text('Start Cooking'),
              )),
            SizedBox(width: 10,),
            Expanded(
                child: IconButton(
                  onPressed: (){},
                  style: IconButton.styleFrom(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.grey.shade300,
                        width: 2,
                      )
                    )
                  ),
                  icon: Icon(widget.food.isLiked ?Iconsax.heart5:Iconsax.heart,
                      color: widget.food.isLiked ?Colors.red:Colors.black,
                      size: 21),
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
                  height: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(widget.food.image),
                    fit: BoxFit.cover,
                  )),
                )),
                Positioned(
                    top: 40,
                    left: 10,
                    right: 10,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: IconButton.styleFrom(
                              fixedSize: Size(55, 55),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          icon: Icon(CupertinoIcons.chevron_back),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                              fixedSize: Size(55, 55),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          icon: Icon(Iconsax.notification),
                        ),
                      ],
                    )),
                Positioned(
                  right: 0,
                  left: 0,
                  top: MediaQuery.of(context).size.width - 50,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.flash_1,
                          size: 20,
                          color: Colors.grey,
                        ),
                        Text(
                          "${widget.food.cal} Cal",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          " · ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Icon(
                          Iconsax.clock,
                          size: 20,
                          color: Colors.grey,
                        ),
                        Text(
                          "${widget.food.time} Min",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Iconsax.star5,
                            color: Colors.yellow.shade700, size: 25),
                        const SizedBox(width: 5),
                        Text(
                          "${widget.food.rate}/5",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "(${widget.food.reviews} Reviews)",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ingredients',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'How many servings?',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.5, color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (currentNum != 1) {
                                    setState(() {
                                      currentNum--;
                                    });
                                  }
                                },
                                icon: Icon(Iconsax.minus),
                              ),
                              Text(
                                '1',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    currentNum++;
                                  });
                                },
                                icon: Icon(Iconsax.add),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(widget.food.image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Ramen Noodels',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              '400g',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(height: 10, color: Colors.grey.shade300),
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(widget.food.image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Ramen Noodels',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              '400g',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(height: 10, color: Colors.grey.shade300),
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(widget.food.image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Ramen Noodels',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              '400g',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(height: 10, color: Colors.grey.shade300),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

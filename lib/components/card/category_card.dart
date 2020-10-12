import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 27,
        vertical: 15,
      ),
      child: Container(
        height: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(category.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Text(''),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  // vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${category.price} kyats',
                          style: TextStyle(
                            color: kNormalFontColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          category.tags.length,
                          (index) => Transform.scale(
                            child: Chip(
                              padding: EdgeInsets.zero,
                              label: Text(category.tags[index]),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xffA2A3A6),
                              ),
                              backgroundColor: kTagColor,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            alignment: Alignment.centerLeft,
                            scale: 0.8,
                          ),
                        ),
                        Expanded(
                          child: Text(''),
                        ),
                        Text(category.availableTime),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:coffee_app/domain/models/coffee_model.dart';
import 'package:coffee_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';


class CoffeeCard extends StatelessWidget {
  final CoffeeModel coffee;

  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12.0),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.04, 0.04),
            end: Alignment(0.88, 0.93),
            colors: [
              Color(0xFF252A32),
              Color(0x00262B33),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    coffee.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 53,
                    height: 22,
                    padding: const EdgeInsets.only(left: 12.0),
                    decoration: ShapeDecoration(
                      color: Colors.black.withValues(alpha: 0.60),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(26),
                          topRight: Radius.circular(16),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        spacing: 4.0,
                        children: [
                          Image.asset('assets/star.png'),
                          Text(
                            coffee.rating.toString(),
                            style: TextStyle(
                              color: context.theme.colorScheme.onSecondary,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              coffee.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.54,
              ),
            ),
            Text(
              coffee.subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w400,
                height: 2.22,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '\$',
                        style: TextStyle(
                          color: const Color(0xFFD17842),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.33,
                        ),
                      ),
                      TextSpan(
                        text: ' ${coffee.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.33,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 28.0,
                  width: 28.0,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




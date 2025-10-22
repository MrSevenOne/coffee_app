import 'package:coffee_app/domain/models/bean_model.dart';
import 'package:coffee_app/ui/detials/beans_detial_screen.dart';
import 'package:coffee_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BeansCard extends StatelessWidget {
  final BeanModel beanModel;
  const BeansCard({super.key, required this.beanModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, __, ___) => BeanDetailsScreen(bean: beanModel),
          ),
        );
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12.0),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.04, 0.04),
            end: Alignment(0.88, 0.93),
            colors: [Color(0xFF252A32), Color(0x00262B33)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: beanModel.title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  beanModel.imagePath,
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              beanModel.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              beanModel.country,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${beanModel.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Color(0xFFD17842),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, size: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

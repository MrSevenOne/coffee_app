import 'package:coffee_app/domain/models/bean_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BeanDetailsScreen extends StatefulWidget {
  final BeanModel bean;
  const BeanDetailsScreen({super.key, required this.bean});

  @override
  State<BeanDetailsScreen> createState() => _BeanDetailsScreenState();
}

class _BeanDetailsScreenState extends State<BeanDetailsScreen> {
  int selectedSize = 0;
  final sizes = ["250gm", "500gm", "1000gm"];

  @override
  Widget build(BuildContext context) {
    final bean = widget.bean;

    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🟤 TOP IMAGE
            Expanded(
              child: Stack(
                children: [
                  // 🔹 Asosiy rasm (hero bilan)
                  Hero(
                    tag: bean.imagePath,
                    child: Image.asset(
                      bean.imagePath,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // 🔹 Orqaga qaytish tugmasi
                  Positioned(
                    top: 20,
                    left: 16,
                    child: _iconButton(
                      Icons.arrow_back_ios_new_rounded,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),

                  // 🔹 Like tugmasi
                  Positioned(
                    top: 20,
                    right: 16,
                    child: _iconButton(Icons.favorite_border_rounded),
                  ),

                  // 🔹 Pastdagi qora container (rasmga yopishgan)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.50),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Text(
                                bean.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Text(
                                bean.subtitle,
                                style: TextStyle(
                                  color: const Color(0xFFAEAEAE),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 1.67,
                                ),
                              )
                            ],
                          ),
                          Column(
                            spacing: 12.0,
                            children: [
                              Row(
                                spacing: 18.0,
                                children: [
                                  _infoChip(Icons.coffee_rounded, "Bean"),
                                  _infoChip(Icons.place_rounded, bean.country),
                                ],
                              ),
                              _tag("Medium Roasted"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🟤 CONTENT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bean.description,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    "Size",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(sizes.length, (index) {
                      final isSelected = selectedSize == index;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSize = index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isSelected
                                ? const Color(0xFFD17842)
                                : const Color(0xFF141921),
                            border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFD17842)
                                    : Colors.transparent),
                          ),
                          child: Text(
                            sizes[index],
                            style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[400],
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),

                  // 🟤 PRICE + BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Price",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(
                            "\$${bean.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Color(0xFFD17842),
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD17842),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 16),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ) // 🪄 Flutter Animate bilan chiqish animatsiyasi
                .animate()
                .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                .slideY(
                    begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
                .scale(
                    begin: const Offset(0.95, 0.95), end: const Offset(1, 1)),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: const Color(0xFF141921),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: const Color(0xFF141921),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFD17842), size: 24),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFFAEAEAE),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 2,
            ),
          )
        ],
      ),
    );
  }

  Widget _tag(String text) {
    return Container(
      height: 45,
      width: 133,
      decoration: BoxDecoration(
        color: const Color(0xFF141921),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
          child: Text(text,
              style: const TextStyle(color: Color(0xFFAEAEAE), fontSize: 12))),
    );
  }
}

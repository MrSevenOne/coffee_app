import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app/utils/extensions/context_extension.dart';

class CoffeeTypeSelector extends StatelessWidget {
  final List<String> coffeeTypes;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const CoffeeTypeSelector({
    super.key,
    required this.coffeeTypes,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: coffeeTypes.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: Padding(
              padding: const EdgeInsets.only(right: 19),
              child: Column(
                spacing: 6.0,
                children: [
                  Text(
                    coffeeTypes[index],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? context.theme.colorScheme.secondary
                          : const Color(0xFF52555A),
                    ),
                  ),
                  if (isSelected)
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: context.theme.colorScheme.secondary,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

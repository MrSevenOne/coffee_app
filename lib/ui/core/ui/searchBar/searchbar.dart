import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const SearchBarWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText = "Find your coffee...",
  });

  @override
  Widget build(BuildContext context) {
    final searchTheme = Theme.of(context).searchViewTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: searchTheme.backgroundColor ?? colorScheme.surface,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: GoogleFonts.poppins(
                color: colorScheme.onPrimary,
                fontSize: 14,
              ),
              cursorColor: colorScheme.primary,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                  color: colorScheme.onSurface.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

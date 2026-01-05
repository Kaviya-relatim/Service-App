import 'package:flutter/material.dart';

class DashboardFilterBar extends StatelessWidget {
  final String activeFilter;
  final ValueChanged<String> onFilterSelected;
  final bool isDark;

  const DashboardFilterBar({
    super.key,
    required this.activeFilter,
    required this.onFilterSelected,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final filters = [
      {"label": "All", "icon": Icons.grid_view_rounded},
      {"label": "Scheduled", "icon": Icons.calendar_month_rounded},
      {"label": "Reported", "icon": Icons.report_gmailerrorred_rounded},
      {"label": "In Progress", "icon": Icons.timelapse_rounded},
      {"label": "Done", "icon": Icons.check_circle_outline_rounded},
      {"label": "Billed", "icon": Icons.receipt_long_rounded},
    ];

    return Container(
      color: isDark ? const Color(0xFF101922) : null,
      padding: isDark ? const EdgeInsets.symmetric(vertical: 12) : null,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: filters.map((filter) {
            final label = filter['label'] as String;
            final isSelected = activeFilter == label;

            return GestureDetector(
              onTap: () => onFilterSelected(label),
              child: isDark
                  ? _buildDarkFilterChip(label, isSelected)
                  : _buildLightFilterChip(filter, isSelected),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildLightFilterChip(Map<String, dynamic> filter, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF007AFF) : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: isSelected ? null : Border.all(color: Colors.grey.shade300),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: const Color(0xFF007AFF).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          Icon(
            filter['icon'] as IconData,
            size: 18,
            color: isSelected ? Colors.white : Colors.grey[600],
          ),
          const SizedBox(width: 8),
          Text(
            filter['label'] as String,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDarkFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF137FEC) : const Color(0xFF283039),
        borderRadius: BorderRadius.circular(18),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: const Color(0xFF137FEC).withOpacity(0.25),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ]
            : [],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFFD1D5DB),
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }
}

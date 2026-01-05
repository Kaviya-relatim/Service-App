import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final bool isDark;

  const DashboardHeader({super.key, this.isDark = false});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDark ? const Color(0xFF101922) : Colors.white;
    final titleColor = isDark ? Colors.white : Colors.blueGrey[900];
    final dateColor = isDark ? const Color(0xFF94A3B8) : Colors.grey[600];
    final borderColor = isDark ? const Color(0xFF1E293B) : Colors.transparent;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: isDark ? Border(bottom: BorderSide(color: borderColor)) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isDark) ...[
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF137FEC),
                      width: 2,
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://i.pravatar.cc/150?img=12',
                      ), // Placeholder
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Workshop Dashboard",
                    style: TextStyle(
                      fontSize: 24, // Kept original size
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Oct 24, 2023",
                    style: TextStyle(color: dateColor, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          if (!isDark)
            const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
              radius: 20,
            )
          else
            // Online indicator for dark mode
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF101922), width: 2),
              ),
            ),
        ],
      ),
    );
  }
}

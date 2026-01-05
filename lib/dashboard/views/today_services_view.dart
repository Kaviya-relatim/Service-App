import 'package:flutter/material.dart';

class TodayServicesView extends StatefulWidget {
  const TodayServicesView({super.key});

  @override
  State<TodayServicesView> createState() => _TodayServicesViewState();
}

class _TodayServicesViewState extends State<TodayServicesView> {
  // Track expanded state
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 16),
          child: Text(
            "Today's Services",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
        ),
        _buildItem(
          0,
          "09:00 AM",
          "CHECKED IN",
          "2021 Ford F-150",
          "John Doe",
          "Routine Maintenance",
          "Waiting for technician assignment",
          Colors.green,
          "https://images.unsplash.com/photo-1550355291-bbee04a92027?auto=format&fit=crop&q=80&w=200",
        ),
        const SizedBox(height: 12),
        _buildItem(
          1,
          "09:30 AM",
          "PENDING",
          "2023 Toyota Camry",
          "Sarah Smith",
          "Brake Inspection",
          "Customer stated brakes feel spongy",
          Colors.orange,
          "https://images.unsplash.com/photo-1619767886558-efdc259cde1a?auto=format&fit=crop&q=80&w=200",
        ),
        const SizedBox(height: 12),
        _buildItem(
          2,
          "10:15 AM",
          "IN PROGRESS",
          "2020 BMW X5",
          "Mike Ross",
          "Tire Rotation",
          "Technician: Alex M.",
          Colors.blue,
          "https://images.unsplash.com/photo-1556155092-490a1ba16284?auto=format&fit=crop&q=80&w=200",
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildItem(
    int index,
    String time,
    String status,
    String carName,
    String customerName,
    String serviceType,
    String note,
    Color statusColor,
    String imageUrl,
  ) {
    if (_expandedIndex == index) {
      return GestureDetector(
        onTap: () => setState(() => _expandedIndex = null),
        child: _buildExpandedCard(
          time,
          status,
          carName,
          customerName,
          serviceType,
          note,
          statusColor,
          imageUrl,
        ),
      );
    }
    return GestureDetector(
      onTap: () => setState(() => _expandedIndex = index),
      child: _buildCollapsedCard(
        time,
        status,
        carName,
        customerName,
        serviceType,
        statusColor,
        imageUrl,
      ),
    );
  }

  Widget _buildCollapsedCard(
    String time,
    String status,
    String carName,
    String customerName,
    String serviceType,
    Color statusColor,
    String imageUrl,
  ) {
    return Container(
      height: 86,
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(43),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
        ],
      ),
      child: Stack(
        children: [
          // Left Image/Icon Placeholder
          Positioned(
            left: 13,
            top: 13,
            bottom: 13,
            width: 56,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(28),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Content
          Positioned(
            left: 85,
            top: 13,
            right: 48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xFF137FEC), // Accent Blue
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Status Badge (Custom for this view to show status color)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        status.toUpperCase(),
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  carName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "$customerName • $serviceType",
                  style: const TextStyle(
                    color: Color(0xFF9DABB9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Right Arrow
          Positioned(
            right: 24,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey[600],
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedCard(
    String time,
    String status,
    String carName,
    String customerName,
    String serviceType,
    String note,
    Color statusColor,
    String imageUrl,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C2630),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      customerName,
                      style: const TextStyle(
                        color: Color(0xFF9DABB9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildDetailRow(Icons.access_time_filled, "TIME", time),
          const SizedBox(height: 12),
          _buildDetailRow(Icons.build_circle, "SERVICE", serviceType),
          const SizedBox(height: 12),
          _buildDetailRow(
            Icons.info_outline,
            "STATUS",
            status,
            color: statusColor,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF111418),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.sticky_note_2_outlined,
                  color: Color(0xFF64748B),
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    note,
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    IconData icon,
    String label,
    String value, {
    Color? color,
  }) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF64748B), size: 16),
        const SizedBox(width: 8),
        Text(
          "$label:",
          style: const TextStyle(
            color: Color(0xFF64748B),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(
            color: color ?? Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TodayServicesView extends StatelessWidget {
  const TodayServicesView({super.key});

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
        _buildServiceCard(
          time: "09:00 AM",
          status: "Checked In",
          carName: "2021 Ford F-150",
          customerName: "John Doe",
          serviceType: "Routine Maintenance",
          statusColor:
              Colors.green, // Kept for logic, but might style differently
        ),
        const SizedBox(height: 12),
        _buildServiceCard(
          time: "09:30 AM",
          status: "Pending",
          carName: "2023 Toyota Camry",
          customerName: "Sarah Smith",
          serviceType: "Brake Inspection",
          statusColor: Colors.orange,
        ),
        const SizedBox(height: 12),
        _buildServiceCard(
          time: "10:15 AM",
          status: "In Progress",
          carName: "2020 BMW X5",
          customerName: "Mike Ross",
          serviceType: "Tire Rotation",
          statusColor: Colors.blue,
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildServiceCard({
    required String time,
    required String status,
    required String carName,
    required String customerName,
    required String serviceType,
    required Color statusColor,
  }) {
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
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1494905998402-395d579af9c5?auto=format&fit=crop&q=80&w=200',
                  ),
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
}

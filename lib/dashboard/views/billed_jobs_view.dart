import 'package:flutter/material.dart';

class BilledJobsView extends StatefulWidget {
  const BilledJobsView({super.key});

  @override
  State<BilledJobsView> createState() => _BilledJobsViewState();
}

class _BilledJobsViewState extends State<BilledJobsView> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        _buildItem(
          0,
          "Tesla Model 3",
          "John Doe",
          "Today, 10:30 AM",
          "Oil Change",
          "\$120.00",
          "https://images.unsplash.com/photo-1560958089-b8a1929cea89?auto=format&fit=crop&q=80&w=200",
        ),
        const SizedBox(height: 20),
        _buildItem(
          1,
          "Ford F-150",
          "Jane Smith",
          "Yesterday, 4:15 PM",
          "Brake Inspection",
          "\$450.50",
          "https://images.unsplash.com/photo-1550355291-bbee04a92027?auto=format&fit=crop&q=80&w=200",
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildItem(
    int index,
    String carName,
    String ownerName,
    String time,
    String serviceType,
    String price,
    String carImage,
  ) {
    if (_expandedIndex == index) {
      return GestureDetector(
        onTap: () => setState(() => _expandedIndex = null),
        child: _buildBilledExpandedCard(
          carName: carName,
          ownerName: ownerName,
          time: time,
          serviceType: serviceType,
          price: price,
          carImage: carImage,
        ),
      );
    }
    return GestureDetector(
      onTap: () => setState(() => _expandedIndex = index),
      child: _buildCollapsedCard(
        carName: carName,
        time: time,
        price: price,
        serviceType: serviceType,
        carImage: carImage,
      ),
    );
  }

  Widget _buildCollapsedCard({
    required String carName,
    required String time,
    required String price,
    required String serviceType,
    required String carImage,
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
                  image: NetworkImage(carImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
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
                        color: Color(0xFF137FEC),
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
                    const Text(
                      "BILLED",
                      style: TextStyle(
                        color: Color(0xFF94A3B8), // gray for billed
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
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
                  "$serviceType • $price",
                  style: const TextStyle(
                    color: Color(0xFF9DABB9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
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

  Widget _buildBilledExpandedCard({
    required String carName,
    required String ownerName,
    required String time,
    required String serviceType,
    required String price,
    required String carImage,
  }) {
    return Container(
      height: 242,
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(48),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Content Left Side
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
              top: 21,
              bottom: 21,
              right: 140,
            ), // Right padding to clear image
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Billed Badge (Replaces icon1.svg)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(19, 127, 236, 0.1),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color.fromRGBO(19, 127, 236, 0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.receipt_long,
                        color: Color(0xFF137FEC),
                        size: 14,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "BILLED",
                        style: TextStyle(
                          color: Color(0xFF137FEC),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 2),

                // Car Name
                Text(
                  carName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                // Owner Row
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      color: Color(0xFF94A3B8),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      ownerName,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Service Row
                Row(
                  children: [
                    const Icon(
                      Icons.build_circle_outlined,
                      color: Color(0xFF94A3B8),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      serviceType,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Price
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(flex: 3),

                // View Invoice Button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF283039),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.remove_red_eye_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "View Invoice",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Timestamp Top Right
          Positioned(
            right:
                213, // Adjusted based on layout roughly - aligned right of left section
            top: 22,
            child:
                Container(), // Placeholder if needed, but text is actually absolute in design
          ),
          Positioned(
            left: 238,
            top: 22,
            child: Text(
              time,
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Car Image Right Side
          Positioned(
            right: 17,
            top: 41,
            bottom: 41,
            width: 128,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                image: DecorationImage(
                  image: NetworkImage(carImage),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: -5,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

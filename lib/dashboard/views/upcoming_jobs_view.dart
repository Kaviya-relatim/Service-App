import 'package:flutter/material.dart';

class UpcomingJobsView extends StatefulWidget {
  const UpcomingJobsView({super.key});

  @override
  State<UpcomingJobsView> createState() => _UpcomingJobsViewState();
}

class _UpcomingJobsViewState extends State<UpcomingJobsView> {
  // Track expanded state of cards. Key is index.
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        if (_expandedIndex ==
            null) // Hide header when a card is expanded to focus
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 16),
            child: Text(
              "Upcoming Jobs",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
          ),

        // List items
        ...[
          _buildItem(
            0,
            "09:00 AM",
            "Regular Service",
            "2023 Ford F-150",
            "James Anderson",
          ),
          const SizedBox(height: 12),
          _buildItem(
            1,
            "10:30 AM",
            "Brake Check",
            "2020 BMW X5",
            "Sarah Miller",
          ), // Expanded example in image
          const SizedBox(height: 12),
          _buildItem(
            2,
            "12:00 PM",
            "Tire Rotation",
            "2022 Tesla Model 3",
            "Michael Chen",
          ),
          const SizedBox(height: 12),
          _buildItem(
            3,
            "01:45 PM",
            "Inspection",
            "2019 Toyota Camry",
            "Robert Fox",
          ),
          const SizedBox(height: 12),
          _buildItem(
            4,
            "03:00 PM",
            "Oil Change",
            "2021 Mercedes C300",
            "Emily Wilson",
          ),
        ],

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
  ) {
    // If expanded, show the full detail card.
    if (_expandedIndex == index) {
      return _buildExpandedCard(index);
    }

    // Otherwise show the collapsed listing
    return GestureDetector(
      onTap: () {
        setState(() {
          // Toggle expansion
          _expandedIndex = _expandedIndex == index ? null : index;
        });
      },
      child: _buildCollapsedCard(time, status, carName, customerName),
    );
  }

  // The existing pill-shaped card
  Widget _buildCollapsedCard(
    String time,
    String status,
    String carName,
    String customerName,
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
                    Text(
                      status,
                      style: const TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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

  // The new detailed card view
  Widget _buildExpandedCard(int index) {
    // Hardcoded data for the detailed view specific to the request image
    // In a real app, you'd pass the full data object.
    const carTitle = "2023 Tesla Model 3";
    const subTitle = "Sarah Jenkins • License: 8XCV992";

    return Column(
      children: [
        // Small top card (Previous item summary-ish, but simplified per design)
        Container(
          height: 74,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF101922),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF283039)),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 17,
                top: 13,
                bottom: 13,
                width: 48,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF283039),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              const Positioned(
                left: 81,
                top: 14,
                child: Text(
                  "2019 Toyota Camry",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Positioned(
                left: 81,
                top: 38,
                child: Text(
                  "11:00 AM • Standard Service",
                  style: TextStyle(
                    color: Color(0xFF9DABB9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                right: 17,
                top: 0,
                bottom: 0,
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey[600],
                  size: 24,
                ),
              ),
            ],
          ),
        ),

        // Main Expanded Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1C2630),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 25,
                offset: const Offset(0, 20),
              ),
            ],
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                carTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                subTitle,
                style: TextStyle(
                  color: Color(0xFF9DABB9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),

              // Appointment Time Section
              _buildDetailRow(
                icon: Icons.access_time_filled,
                iconBg: const Color.fromRGBO(30, 58, 138, 0.2),
                iconColor: const Color(0xFF3B82F6),
                label: "APPOINTMENT TIME",
                value: "Today, 09:30 AM - 11:00 AM",
              ),
              const SizedBox(height: 20),

              // Logistics Section
              _buildDetailRow(
                icon: Icons.local_shipping,
                iconBg: const Color.fromRGBO(120, 53, 15, 0.2),
                iconColor: const Color(0xFFF59E0B),
                label: "LOGISTICS",
                value: "Pickup Required",
                indicatorColor: const Color(0xFFF59E0B),
              ),
              const SizedBox(height: 20),

              // Assignment Section
              _buildDetailRow(
                icon: Icons.person,
                iconBg: const Color(0xFF283039),
                iconColor: Colors.white,
                label: "ASSIGNMENT",
                value: "No technician yet",
              ),
              const SizedBox(height: 32),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF137FEC),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(59, 130, 246, 0.2),
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.check, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Accept",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF283039),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.person_add, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Assign Driver",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _expandedIndex = null; // Close
                    });
                  },
                  child: const Text(
                    "Reschedule Appointment",
                    style: TextStyle(
                      color: Color(0xFF9DABB9),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String label,
    required String value,
    Color? indicatorColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF9DABB9),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (indicatorColor != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: indicatorColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

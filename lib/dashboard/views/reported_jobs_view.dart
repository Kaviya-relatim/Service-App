import 'package:flutter/material.dart';

class ReportedJobsView extends StatefulWidget {
  const ReportedJobsView({super.key});

  @override
  State<ReportedJobsView> createState() => _ReportedJobsViewState();
}

class _ReportedJobsViewState extends State<ReportedJobsView> {
  // Simulating the second item is expanded (Reported Toyota RAV4)
  // In a real app index would be dynamic.
  int? _expandedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        // Top "Collapsed" item example
        _buildCollapsedCard(
          "2020 Ford F-150",
          "Plate: K-9920 • Reported 08:30 AM",
          Icons.directions_car,
          onTap: () =>
              setState(() => _expandedIndex = _expandedIndex == 0 ? null : 0),
        ),

        const SizedBox(height: 16),

        // Expanded "Reported" Item
        // For demonstration, we assume index 1 is the Toyota from the design
        if (_expandedIndex == 1)
          _buildExpandedReportedCard()
        else
          _buildCollapsedCard(
            "Toyota RAV4 Hybrid",
            "Plate: J-8821 • 09:45 AM - Today",
            Icons.electric_car, // hybrid
            onTap: () => setState(() => _expandedIndex = 1),
          ),

        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildCollapsedCard(
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 83,
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        decoration: BoxDecoration(
          color: const Color(0xFF1C2329),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: const Color(0xFF1F2937)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF9DABB9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons
                  .warning_amber_rounded, // Yellow warning icon commonly used for reports
              color: Colors.amber[600],
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedReportedCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1C2329), // #1c2329
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: const Color.fromRGBO(19, 127, 236, 0.2),
        ), // Blue stroke
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Blue side strip
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 4,
            child: Container(color: const Color(0xFF137FEC)),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Toyota RAV4 Hybrid",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Plate: J-8821 • 09:45 AM - Today",
                          style: TextStyle(
                            color: Color(0xFF9DABB9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    // "New" Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(19, 127, 236, 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "NEW",
                        style: TextStyle(
                          color: Color(0xFF137FEC),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Divider(color: Colors.grey[800], height: 1),
                const SizedBox(height: 20),

                // Customer Info
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=9',
                      ), // Placeholder Sarah
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sarah Jenkins",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Regular Customer",
                          style: TextStyle(
                            color: Color(0xFF9DABB9),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Chat Icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFF283039),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Reported Issue Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF111418),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFF1F2937)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning,
                            color: Colors.amber[700],
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "REPORTED ISSUE",
                            style: TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Customer reports unusual noise coming from the front-left wheel well during braking.\nCheck engine light appeared this morning.",
                        style: TextStyle(
                          color: Color(0xFFE5E7EB),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Action Buttons
                Row(
                  children: [
                    // Assign Advisor
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: const Color(0xFF4B5563),
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.person_add_alt_1_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Assign Advisor",
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
                    // Start Service
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFF137FEC),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(19, 127, 236, 0.3),
                              blurRadius: 15,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Start Service",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

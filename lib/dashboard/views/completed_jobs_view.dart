import 'package:flutter/material.dart';

class CompletedJobsView extends StatefulWidget {
  const CompletedJobsView({super.key});

  @override
  State<CompletedJobsView> createState() => _CompletedJobsViewState();
}

class _CompletedJobsViewState extends State<CompletedJobsView> {
  // Start with no item expanded
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        _buildItem(
          0,
          "Tesla Model 3 • EV-8822",
          "Full Service • Job #8822",
          Icons.electric_car,
          "Tesla Model 3",
          "Alice Freeman • 8XF-291",
          "\$164.00",
          [
            {"title": "Synthetic Oil Change", "price": "\$89.00"},
            {"title": "Tire Rotation", "price": "\$45.00"},
            {"title": "Wiper Blade Replace", "price": "\$30.00"},
          ],
          "https://images.unsplash.com/photo-1560958089-b8a1929cea89?auto=format&fit=crop&q=80&w=200",
        ),
        const SizedBox(height: 16),
        _buildItem(
          1,
          "Toyota Camry • LN-4029",
          "Job #8823",
          Icons.directions_car,
          "Toyota Camry",
          "John Doe • LN-4029",
          "\$95.00",
          [
            {"title": "Oil Change", "price": "\$50.00"},
            {"title": "Inspection", "price": "\$45.00"},
          ],
          "https://images.unsplash.com/photo-1619767886558-efdc259cde1a?auto=format&fit=crop&q=80&w=200",
        ),
        const SizedBox(height: 16),
        _buildItem(
          2,
          "Honda Civic • XP-9921",
          "Job #8824",
          Icons.directions_car,
          "Honda Civic",
          "Jane Smith • XP-9921",
          "\$135.00",
          [
            {"title": "General Inspection", "price": "\$85.00"},
            {"title": "Air Filter Replace", "price": "\$50.00"},
          ],
          "https://images.unsplash.com/photo-1590362891991-f776e747a588?auto=format&fit=crop&q=80&w=200",
        ),
        const SizedBox(height: 16),
        _buildItem(
          3,
          "Ford F-150 • AB-1234",
          "Job #8825",
          Icons.local_shipping,
          "Ford F-150",
          "Bob Wilson • AB-1234",
          "\$310.00",
          [
            {"title": "Transmission Fluid", "price": "\$120.00"},
            {"title": "Tire Replacement (1)", "price": "\$190.00"},
          ],
          "https://images.unsplash.com/photo-1550355291-bbee04a92027?auto=format&fit=crop&q=80&w=200",
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildItem(
    int index,
    String collapsedTitle,
    String collapsedSubtitle,
    IconData icon,
    String expandedTitle,
    String expandedSubtitle,
    String totalPrice,
    List<Map<String, String>> invoices,
    String imageUrl,
  ) {
    if (_expandedIndex == index) {
      // Return expanded card wrapped in GestureDetector to handle toggle close
      return GestureDetector(
        onTap: () => setState(() => _expandedIndex = null),
        child: _buildExpandedCompletedCard(
          expandedTitle,
          expandedSubtitle,
          totalPrice,
          invoices,
          imageUrl,
        ),
      );
    }
    return _buildCollapsedCard(
      collapsedTitle,
      collapsedSubtitle,
      icon,
      onTap: () => setState(() => _expandedIndex = index),
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
        height: 82,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1C2630),
          borderRadius: BorderRadius.circular(48),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
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
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(19, 127, 236, 0.1),
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Icon(Icons.done_all, color: Color(0xFF137FEC)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF94A3B8),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedCompletedCard(
    String title,
    String subtitle,
    String totalPrice,
    List<Map<String, String>> invoices,
    String imageUrl,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C2127),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
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
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Badge
          Container(
            width: 146,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(34, 197, 94, 0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF22C55E),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "READY FOR PICKUP",
                  style: TextStyle(
                    color: Color(0xFF22C55E),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Header
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.white, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Color(0xFF9DABB9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          Divider(color: Colors.white.withOpacity(0.05)),
          const SizedBox(height: 16),

          // Invoice Items
          ...invoices.map(
            (item) => _buildInvoiceItem(item['title']!, item['price']!),
          ),

          const SizedBox(height: 24),

          // Total Section container
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(40, 48, 57, 0.5),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Estimate",
                      style: TextStyle(
                        color: Color(0xFF9DABB9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      totalPrice,
                      style: const TextStyle(
                        color: Color(0xFF137FEC),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.75,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF137FEC),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(19, 127, 236, 0.25),
                        blurRadius: 15,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.send_rounded, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "Send to Customer",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceItem(String title, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF283039),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.receipt_long,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFD1D5DB),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

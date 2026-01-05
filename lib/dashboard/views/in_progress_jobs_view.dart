import 'package:flutter/material.dart';

class InProgressJobsView extends StatefulWidget {
  const InProgressJobsView({super.key});

  @override
  State<InProgressJobsView> createState() => _InProgressJobsViewState();
}

class _InProgressJobsViewState extends State<InProgressJobsView> {
  // Simulating the first item is expanded for "In Progress" demo
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        _buildItem(
          0,
          "ABC-1234",
          "2021 Toyota Camry",
          "John Doe • Phone: 555-0123",
          "Full Synthetic Oil Change • In Progress",
          const [
            {"title": "Synthetic Oil Change", "isDone": true},
            {"title": "Tire Rotation", "isDone": true},
            {"title": "Fluid Check", "isDone": false},
          ],
          "00",
          "45",
          "12",
          "https://images.unsplash.com/photo-1619767886558-efdc259cde1a?auto=format&fit=crop&q=80&w=200",
        ),

        const SizedBox(height: 16),

        _buildItem(
          1,
          "XYZ-9876",
          "2019 Toyota Camry",
          "Sarah Connor • Phone: 555-0987",
          "Brake Pad Replacement • Queued",
          const [
            {"title": "Brake Inspection", "isDone": false},
            {"title": "Pad Replacement", "isDone": false},
          ],
          "00",
          "00",
          "00",
          "https://images.unsplash.com/photo-1590362891991-f776e747a588?auto=format&fit=crop&q=80&w=200",
        ),

        const SizedBox(height: 16),

        _buildItem(
          2,
          "LMN-4567",
          "2022 Honda Civic",
          "Mike Ross • Phone: 555-0456",
          "Tire Rotation • Queued",
          const [
            {"title": "Tire Rotation", "isDone": false},
            {"title": "Alignment Check", "isDone": false},
          ],
          "00",
          "00",
          "00",
          "https://images.unsplash.com/photo-1580273916550-e323be2ebcc9?auto=format&fit=crop&q=80&w=200",
          opacity: 0.6,
        ),

        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildItem(
    int index,
    String plate,
    String carName,
    String ownerInfo,
    String collapsedSubtitle,
    List<Map<String, dynamic>> tasks,
    String hours,
    String minutes,
    String seconds,
    String imageUrl, {
    double opacity = 1.0,
  }) {
    if (_expandedIndex == index) {
      return GestureDetector(
        onTap: () => setState(() => _expandedIndex = null),
        child: _buildExpandedProgressCard(
          plate,
          carName,
          ownerInfo,
          tasks,
          hours,
          minutes,
          seconds,
          imageUrl,
        ),
      );
    }
    return _buildCollapsedCard(
      carName,
      collapsedSubtitle,
      Icons.directions_car,
      onTap: () => setState(() => _expandedIndex = index),
      opacity: opacity,
    );
  }

  Widget _buildCollapsedCard(
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
    double opacity = 1.0,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: opacity,
        child: Container(
          height: 98,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF1C252E),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(19, 127, 236, 0.2),
                  borderRadius: BorderRadius.circular(48),
                ),
                child: const Icon(
                  Icons.build_circle_outlined,
                  color: Color(0xFF137FEC),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.blueGrey[200],
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const CircleAvatar(
                backgroundColor: Color(0xFF283039),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedProgressCard(
    String plate,
    String carName,
    String ownerInfo,
    List<Map<String, dynamic>> tasks,
    String hours,
    String minutes,
    String seconds,
    String imageUrl,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C2630),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color.fromRGBO(19, 127, 236, 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(32),
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
                      plate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      carName,
                      style: const TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ownerInfo,
                      style: const TextStyle(
                        color: Color(0xFF6A7785),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Active Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(34, 197, 94, 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF22C55E),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "ACTIVE",
                      style: TextStyle(
                        color: Color(0xFF4ADE80),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Timer Display
          Container(
            height: 85,
            decoration: BoxDecoration(
              color: const Color(0xFF111418),
              borderRadius: BorderRadius.circular(48),
              border: Border.all(color: const Color(0xFF1F2937)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTimeSegment(hours, "HOURS"),
                Container(width: 1, height: 32, color: const Color(0xFF374151)),
                _buildTimeSegment(minutes, "MIN"),
                Container(width: 1, height: 32, color: const Color(0xFF374151)),
                _buildTimeSegment(seconds, "SEC", isActive: true),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            "SERVICE TASKS",
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          ...tasks.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: _buildTaskItem(task['title'], task['isDone']),
            ),
          ),

          const SizedBox(height: 24),

          // Action Buttons: Add Note / Call Owner
          Row(
            children: [
              Expanded(child: _buildSecondaryButton(Icons.edit, "Add Note")),
              const SizedBox(width: 16),
              Expanded(child: _buildSecondaryButton(Icons.phone, "Call Owner")),
            ],
          ),

          const SizedBox(height: 24),

          // Mark Done Button
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFF137FEC),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(19, 127, 236, 0.2),
                  blurRadius: 15,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.check_circle_outline, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "Mark Service Done",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSegment(
    String value,
    String label, {
    bool isActive = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            color: isActive ? const Color(0xFF137FEC) : Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF137FEC) : const Color(0xFF9CA3AF),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskItem(String task, bool isDone) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF252E38),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isDone ? Colors.white : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            task,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryButton(IconData icon, String label) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFF283039),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

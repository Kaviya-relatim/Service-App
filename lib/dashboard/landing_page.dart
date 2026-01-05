import 'package:flutter/material.dart';
import 'components/dashboard_header.dart';
import 'components/voice_command_bar.dart';
import 'components/dashboard_filters.dart';
import 'views/today_services_view.dart';
import 'views/upcoming_jobs_view.dart';
import 'views/reported_jobs_view.dart';
import 'views/in_progress_jobs_view.dart';
import 'views/completed_jobs_view.dart';
import 'views/billed_jobs_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String _activeFilter = "All";

  // Unifying theme to Dark Mode for all pages
  bool get _isDark => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark
          ? const Color(0xFF101922)
          : const Color(0xFFF4F7FC),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashboardHeader(isDark: _isDark),
                SizedBox(height: _isDark ? 0 : 20),
                _buildFilterRow(),
                const SizedBox(height: 20),
                Expanded(child: _buildBody()),
              ],
            ),

            // Floating Voice Command Component
            Positioned(
              bottom: _isDark ? 30 : 100,
              left: _isDark ? 50 : null,
              right: 20,
              child: VoiceCommandBar(isDark: _isDark),
            ),

            // Gradient overlay at bottom (Only for Dark Mode design)
            if (_isDark)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 48,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xFF101922),
                        const Color(0xFF101922).withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),

            // Bottom Nav (Only for Light Mode design "All")
            if (!_isDark)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: _buildBottomNav(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_activeFilter) {
      case "All":
        return const TodayServicesView();
      case "Scheduled":
        return const UpcomingJobsView();
      case "Reported":
        return const ReportedJobsView();
      case "In Progress":
        return const InProgressJobsView();
      case "Completed":
      case "Done":
        return const CompletedJobsView();
      case "Billed":
        return const BilledJobsView();
      default:
        // Placeholder for other tabs
        return Center(
          child: Text(
            "$_activeFilter View",
            style: TextStyle(
              color: _isDark ? Colors.white : Colors.blueGrey,
              fontSize: 18,
            ),
          ),
        );
    }
  }

  Widget _buildFilterRow() {
    return DashboardFilterBar(
      activeFilter: _activeFilter,
      isDark: _isDark,
      onFilterSelected: (val) {
        setState(() {
          _activeFilter = val;
        });
      },
    );
  }

  // Original Bottom Nav (Only used in activeFilter == "All" / Light mode)
  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.grid_view_rounded, "All", true),
          _buildNavItem(Icons.timelapse_rounded, "In Progress", false),
          _buildNavItem(Icons.calendar_today_rounded, "Scheduled", false),
          _buildNavItem(Icons.check_circle_outline_rounded, "Completed", false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            )
          : null,
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey[400],
            size: 20,
          ),
          if (isSelected) ...[
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

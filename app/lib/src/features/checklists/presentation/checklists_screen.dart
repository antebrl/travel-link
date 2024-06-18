import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/checklists/presentation/checklist_view.dart';
import 'package:travel_link/src/features/checklists/presentation/personal_checklist_view.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';

class ChecklistsScreen extends ConsumerStatefulWidget {
  const ChecklistsScreen({required this.trip, super.key});

  final Trip trip;

  @override
  ConsumerState<ChecklistsScreen> createState() => _ChecklistsScreenState();
}

class _ChecklistsScreenState extends ConsumerState<ChecklistsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklists'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Personal'),
            Tab(text: 'Group'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  [
          PersonalChecklistView(tripId: widget.trip.tripId),
          ChecklistView(tripId: widget.trip.tripId, participants: widget.trip.participants),
        ],
      ),
    );
    
  }
}

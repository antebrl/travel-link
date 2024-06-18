import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trips_controller.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class AddParticipantScreen extends ConsumerStatefulWidget {
  const AddParticipantScreen({required this.trip, super.key});

  final Trip trip;

  @override
  ConsumerState<AddParticipantScreen> createState() =>
      _AddParticipantScreenState();
}

class _AddParticipantScreenState extends ConsumerState<AddParticipantScreen> {
  String _queryUser = '';
  List<UserAccount> _previousUsers = [];

  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUsers('');
  }

  Future<void> _fetchUsers(String textValue) async {
    _queryUser = textValue;

    final fetchedUsers = await ref.read(fetchUsersQueryProvider(
            query: _queryUser, participants: widget.trip.participants)
        .future);

    // If the query has changed, don't update and wait for next options build
    if (_queryUser == textValue) {
      setState(() {
        _previousUsers = fetchedUsers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26, 16, 26, 20),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.group_add),
                labelText: 'Add Participant',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (textValue) async {
                unawaited(_fetchUsers(textValue));
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: _previousUsers.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    final option = _previousUsers.elementAt(index);
                    return ListTile(
                      leading: option.pictureUrl != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                option.pictureUrl!,
                              ),
                            )
                          : const CircleAvatar(
                              backgroundImage: NetworkImage(
                                CustomImages.defaultProfilePictureUrl,
                              ),
                            ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.grey[700],
                        ),
                        onPressed: () {
                          //Go to user public
                          final uid = option.id;
                          context.pushNamed(
                            TopLevelDestinations.user.name,
                            pathParameters: {
                              'uid': uid,
                            },
                          );
                        },
                      ),
                      title: Text(option.displayName ?? 'Anonymous User'),
                      onTap: () async {
                        // Add participant to trip
                        if (widget.trip.participants.length >=
                            (widget.trip.maxParticipants ?? double.infinity)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Trip is full'),
                            ),
                          );
                          return;
                        }
                        // join Trip
                        await ref
                            .read(myTripsControllerProvider.notifier)
                            .addToTrip(trip: widget.trip, uid: option.id);

                        if (mounted) {
                          context.pop();
                        }
                        // ignore: unused_result
                        ref.refresh(fetchMyTripsProvider);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

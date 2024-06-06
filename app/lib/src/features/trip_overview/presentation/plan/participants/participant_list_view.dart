import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class ParticipantListView extends ConsumerWidget {
  const ParticipantListView({required this.participants, super.key});

  final List<String> participants;

  Future<List<UserAccount>> _fetchParticipants(WidgetRef ref) async {
    final List<UserAccount> users = [];
    for (int i = 0; i < participants.length; i++) {
      final user = await ref.read(FetchUserProvider(participants[i]).future);
      if (user != null) {
        users.add(user);
      } else {
        users.add(
          UserAccount(
            displayName: 'Anonymous User',
            pictureUrl: CustomImages.defaultProfilePictureUrl,
            description: 'No description',
            id: participants[i],
          ),
        );
      }
    }
    return users;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          // Add participant to trip
        },
        label: const Text(
          'Add',
          style: TextStyle(fontSize: 18),
        ),
        icon: const Icon(Icons.add, color: Colors.white, size: 25),
      ),
      body: FutureBuilder<List<UserAccount>>(
        future: _fetchParticipants(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return const CircularProgressIndicator();
          } else {
            final users = snapshot.data!;
            return ListView.separated(
              itemCount: users.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: users[index].pictureUrl != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                            users[index].pictureUrl!,
                          ),
                        )
                      : const CircleAvatar(
                          backgroundImage: NetworkImage(
                            CustomImages.defaultProfilePictureUrl,
                          ),
                        ),
                  title: Text(users[index].displayName ?? 'Anonymous User'),
                  onTap: () {
                    // Go to user public profile
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

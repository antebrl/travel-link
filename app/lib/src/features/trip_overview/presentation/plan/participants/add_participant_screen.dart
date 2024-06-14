import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class AddParticipantScreen extends ConsumerStatefulWidget {
  const AddParticipantScreen({super.key});

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

    final fetchedUsers =
        await ref.read(fetchUsersQueryProvider(query: _queryUser).future);

    // If the query has changed, don't update and wait for next options build
    if (_queryUser == textValue) {
      setState(() {
        _previousUsers = fetchedUsers;
      });
    }
  }

  // void _addUser() async {
  //   final name = _nameController.text;
  //   final email = _emailController.text;

  //   if (name.isNotEmpty && email.isNotEmpty) {
  //     await FirebaseFirestore.instance.collection('users').add({
  //       'name': name,
  //       'email': email,
  //     });

  //     _nameController.clear();
  //     _emailController.clear();
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User added')));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
  //   }
  // }

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
                prefixIcon: Icon(Icons.group_add),
                labelText: 'Add Participant',
                
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      
                focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
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
        icon: Icon(Icons.account_circle_outlined, color: Colors.grey[700],),
        onPressed: () {
          //Go to user public profile
        },
      ),
                      title: Text(option.displayName ?? 'Anonymous User'),
                      onTap: () {
                        // Add participant to trip
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

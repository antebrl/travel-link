import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';
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

  // Future<List<String>> _getUserSuggestions(String query) async {
  //   final snapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       //Query to check if displayName starts with query
  //       .where('displayName', isGreaterThanOrEqualTo: query, isLessThan: query.substring(0, query.length-1) + String.fromCharCode(query.codeUnitAt(query.length - 1) + 1))
  //       .get();

  //   final l = snapshot.docs.map((doc) => doc.data()['displayName'] as String).toList();
  //   return l;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Autocomplete<UserAccount>(
              optionsBuilder: (TextEditingValue textEditingValue) async {
                _queryUser = textEditingValue.text;

                final fetchedUsers = await ref
                    .read(fetchUsersQueryProvider(query: _queryUser).future);

                // If the query has changed, don't update and wait for next options build
                if (_queryUser != textEditingValue.text) {
                  return _previousUsers;
                }
                _previousUsers = fetchedUsers;
                return fetchedUsers;
              },
              onSelected: (UserAccount selection) {
                //add user to trip
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                );
              },
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<UserAccount> onSelected,
                  Iterable<UserAccount> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: options.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          final option = options.elementAt(index);
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
                            title: Text(option.displayName ?? 'Anonymous User'),
                            onTap: () {
                              onSelected(option);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

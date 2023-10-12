import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../../common_widgets/two_panel_widget.dart';
import '../../../routing/app_router.dart';
import '../../../utils/localization.dart';
import '../data/people_repository.dart';
import '../domain/person.dart';
import 'edit_person_controller.dart';
import 'edit_person_form.dart';

class PeopleScreen extends ConsumerWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(context.loc.appTitle),
      ),
      body: TwoPanelWidget(
        firstPanel: RefreshIndicator(
          //pull to refresh
          onRefresh: () {
            ref.invalidate(fetchPeopleProvider);
            return ref.read(fetchPeopleProvider.future);
          },
          child: AsyncValueWidget<List<Person>>(
            value: ref.watch(fetchPeopleProvider),
            data: (people) => people.isEmpty
                ? Center(
                    child: Text(
                      context.loc.noItems,
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    itemCount: people.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(people[index].name),
                        onTap: () {
                          context.goNamed(
                            SubRoutes.details.name,
                            pathParameters: {
                              Parameter.id.name: people[index].id.toString(),
                            },
                            extra: people[index],
                          );
                        },
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: 'Edit '.hardcoded + people[index].name,
                          onPressed: () {
                            ref
                                .read(
                                  editPersonControllerProvider.notifier,
                                )
                                .editPerson(people[index]);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ),
        secondPanel: const EditPersonForm(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(editPersonControllerProvider.notifier).newPerson();
        },
        tooltip: 'click to add a new person'.hardcoded,
        child: const Icon(Icons.add),
      ),
    );
  }
}

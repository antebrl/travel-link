import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../../constants/ui_constants.dart';
import '../../../utils/localization.dart';
import '../../../utils/logger.dart';
import '../data/people_repository.dart';
import '../domain/person.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key, this.id, this.person});
  final int? id;
  final Person? person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.details),
        ),
        body: Text(context.loc.error),
      );
    } else if (person != null) {
      return DetailsScreenPlainWidget(person!);
    } else {
      // e.g. navigated to details by bookmark
      return AsyncValueWidget<Person>(
        value: ref.watch(fetchPersonByIdProvider(id!)),
        data: DetailsScreenPlainWidget.new,
      );
    }
  }
}

class DetailsScreenPlainWidget extends StatelessWidget {
  const DetailsScreenPlainWidget(this.person, {super.key});
  final Person person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.details),
      ),
      body: Padding(
        padding: const EdgeInsets.all(UIConstants.defaultPadding),
        child: Column(
          children: [
            Text('hi ${person.name}'),
            const Gap(UIConstants.verticalItemSpace),
            if (person.imageUrl.startsWith('http'))
              Expanded(
                child: Image(
                  image: NetworkImage(person.imageUrl),
                  errorBuilder: (context, error, stackTrace) {
                    logger.d(
                      'DetailsScreen - image, url=${person.imageUrl}',
                      error: error,
                      stackTrace: stackTrace,
                    );
                    return Text(person.imageUrl);
                  },
                ),
              )
            else
              Text(person.imageUrl),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ContinentItem extends StatelessWidget {
  const ContinentItem({
    required this.continent,
    required this.onSelectContintent,
    super.key,
  });

  final Continent continent;
  final void Function() onSelectContintent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: CustomColors.white,
      borderRadius: BorderRadius.circular(16),
      onTap: onSelectContintent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Image.asset(
                  continent.imageAssetPath,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                child: Text(
                  continent.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: CustomColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

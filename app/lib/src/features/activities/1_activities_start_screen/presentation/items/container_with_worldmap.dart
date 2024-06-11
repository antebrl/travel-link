import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/presentation/activities_continents_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class CustomContainerWithWorldMap extends StatelessWidget {
  const CustomContainerWithWorldMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 5, bottom: 15, right: 40),
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              'assets/images/continents/ContinentsMap.png',
              height: 150,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<ActivitiesContinentsScreen>(
              builder: (BuildContext context) =>
                  const ActivitiesContinentsScreen(),
            ),
          );
        },
      ),
    );
  }
}

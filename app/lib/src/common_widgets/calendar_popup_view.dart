import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_link/src/utils/theme/theme.dart';

import 'custom_calendar.dart';

// from https://github.com/mitesh77/Best-Flutter-UI-Templates/blob/master/best_flutter_ui_templates/lib/hotel_booking/calendar_popup_view.dart
// adapted (see #67)

class CalendarPopupView extends StatefulWidget {
  const CalendarPopupView({
    super.key,
    this.initialStartDate,
    this.initialEndDate,
    this.onApplyClick,
    this.onCancelClick,
    this.barrierDismissible = true,
    this.minimumDate,
    this.maximumDate,
  });

  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final bool barrierDismissible;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  // ignore: inference_failure_on_function_return_type
  final Function(DateTime?, DateTime?)? onApplyClick;

  // ignore: inference_failure_on_function_return_type
  final Function()? onCancelClick;
  @override
  _CalendarPopupViewState createState() => _CalendarPopupViewState();
}

class _CalendarPopupViewState extends State<CalendarPopupView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: animationController!.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (widget.barrierDismissible) {
                    Navigator.pop(context);
                  }
                },
                child: Center(
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: 440,
                        height: 664,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(4, 4),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'From',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color: Colors.grey.withOpacity(0.8),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          startDate != null
                                              ? DateFormat('EEE, dd MMM')
                                                  .format(startDate!)
                                              : '--/-- ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 74,
                                    width: 1,
                                    color:
                                        CustomAppTheme.lightTheme.dividerColor,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'To',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color: Colors.grey.withOpacity(0.8),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          endDate != null
                                              ? DateFormat('EEE, dd MMM')
                                                  .format(endDate!)
                                              : '--/-- ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 1,
                              ),
                              CustomCalendarView(
                                minimumDate: widget.minimumDate,
                                maximumDate: widget.maximumDate,
                                initialEndDate: widget.initialEndDate,
                                initialStartDate: widget.initialStartDate,
                                startEndDateChange: (
                                  DateTime startDateData,
                                  DateTime endDateData,
                                ) {
                                  setState(() {
                                    startDate = startDateData;
                                    endDate = endDateData;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  bottom: 10,
                                  top: 8,
                                ),
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color:
                                        CustomAppTheme.lightTheme.primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        blurRadius: 8,
                                        offset: const Offset(4, 4),
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(24),
                                      ),
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        try {
                                          widget.onApplyClick!(
                                            startDate,
                                            endDate,
                                          );
                                          Navigator.pop(context);
                                        } catch (_) {}
                                      },
                                      child: const Center(
                                        child: Text(
                                          'Apply',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 126,
                                  right: 126,
                                  bottom: 10,
                                  top: 10,
                                ),
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: CustomAppTheme
                                          .lightTheme.primaryColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                  ),
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      try {
                                        widget.onApplyClick!(
                                          null,
                                          null,
                                        );
                                        Navigator.pop(context);
                                      } catch (_) {}
                                    },
                                    child: Center(
                                      child: Text(
                                        'Flexible Dates',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: CustomAppTheme
                                              .lightTheme.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A calendar widget that allows users to select a date and apply the
/// selection.
class AppCalendar extends StatefulWidget {
  /// Creates an [AppCalendar].
  ///
  /// The [onApply] and [initialDate] parameters must not be null.
  const AppCalendar({
    required this.onApply,
    required this.initialDate,
    super.key,
  });

  /// Callback function that is called when the apply button is pressed.
  final void Function(DateTime) onApply;

  /// The initial date to be selected when the calendar is first displayed.
  final DateTime? initialDate;

  @override
  State<AppCalendar> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  late final PageController _pageController;
  late DateTime _selectedDate;
  late final DateTime _today;
  late final DateTime _rawToday;
  late int _currentPage;
  late final NextMenuController yearDropdownController;
  late final FocusNode yearMenuFocusNode;
  late final NextMenuController monthDropdownController;
  late final FocusNode monthMenuFocusNode;

  @override
  void initState() {
    super.initState();
    yearDropdownController = NextMenuController();
    yearMenuFocusNode = FocusNode();
    _today = DateTime.now();
    _rawToday = DateTime(_today.year, _today.month, _today.day);
    _selectedDate = widget.initialDate ?? _today;
    _currentPage = (_selectedDate.year * 12 + _selectedDate.month) - 1;
    _pageController = PageController(initialPage: _currentPage);
    monthDropdownController = NextMenuController();
    monthMenuFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _pageController.dispose();

    monthMenuFocusNode.dispose();
    yearMenuFocusNode.dispose();
    super.dispose();
  }

  void _jumpToYear(int year) {
    final newDate = DateTime(year, _selectedDate.month, 1);
    setState(() {
      _selectedDate = newDate;
    });
    _pageController.animateToPage(
      (newDate.year * 12 + newDate.month) - 1,
      duration: AnimationConstants.defaultDuration,
      curve: AnimationConstants.defaultCurve,
    );
  }

  void _jumpToMonth(int month) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, month, 1);
    });
    _pageController.animateToPage(
      (_selectedDate.year * 12 + month) - 1,
      duration: AnimationConstants.defaultDuration,
      curve: AnimationConstants.defaultCurve,
    );
  }

  /// Moves the calendar to the next month.
  void _nextMonth() {
    _pageController.nextPage(
      duration: AnimationConstants.defaultDuration,
      curve: AnimationConstants.defaultCurve,
    );
  }

  /// Moves the calendar to the previous month.
  void _prevMonth() {
    _pageController.previousPage(
      duration: AnimationConstants.defaultDuration,
      curve: AnimationConstants.defaultCurve,
    );
  }

  /// Jumps the calendar to the current month.
  void _jumpToToday() {
    final todayPage = (_today.year * 12 + _today.month) - 1;

    _pageController.animateToPage(
      todayPage,
      duration: AnimationConstants.defaultDuration,
      curve: AnimationConstants.defaultCurve,
    );
  }

  /// Jumps the calendar to the selected date.
  void _jumpToSelectedDate() {
    final selectedPage = (_selectedDate.year * 12 + _selectedDate.month) - 1;
    _pageController.animateToPage(
      selectedPage,
      duration: AnimationConstants.defaultDuration,
      curve: AnimationConstants.defaultCurve,
    );
  }

  /// Updates the current page index when the page changes.
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  /// Builds a calendar page for the given [date].
  Widget _buildCalendarPage(DateTime date) {
    final daysInMonth = DateTime(date.year, date.month + 1, 0).day;

    final firstDayOfMonth = DateTime(date.year, date.month);

    final startingWeekday = firstDayOfMonth.weekday;

    final lastWeekday = DateTime(date.year, date.month, daysInMonth).weekday;

    final dayWidgets = <Widget>[];
    final prevMonthLastDay = DateTime(date.year, date.month, 0).day;
    final prevMonth = date.month == 1 ? 12 : date.month - 1;
    final prevMonthYear = date.month == 1 ? date.year - 1 : date.year;
    final nextMonth = date.month == 12 ? 1 : date.month + 1;
    final nextMonthYear = date.month == 12 ? date.year + 1 : date.year;

    // Add days from previous month
    for (var i = 0; i < (startingWeekday - 1) % 7; i++) {
      final day = prevMonthLastDay - (startingWeekday - 2 - i);
      final prevDate = DateTime(prevMonthYear, prevMonth, day);
      final isToday = _today.year == prevDate.year &&
          _today.month == prevDate.month &&
          _today.day == day;

      dayWidgets.add(
        Container(
          margin: const EdgeInsets.all(2),
          child: CalenderDayButton(
            isToday: isToday,
            isSelected: false,
            day: day,
            isDifferentMonth: true,
            onPressed: () {
              setState(() {
                _selectedDate = prevDate;
              });
              _pageController.animateToPage(
                (prevDate.year * 12 + prevDate.month) - 1,
                duration: AnimationConstants.defaultDuration,
                curve: AnimationConstants.defaultCurve,
              );
            },
          ),
        ),
      );
    }
    DateTime? lastNextDate;
    // Add days from current month
    for (var i = 1; i <= daysInMonth; i++) {
      final currentDate = DateTime(date.year, date.month, i);
      final isSelected = _selectedDate.year == date.year &&
          _selectedDate.month == date.month &&
          _selectedDate.day == i;
      final isToday = _today.year == date.year &&
          _today.month == date.month &&
          _today.day == i;

      dayWidgets.add(
        Container(
          margin: const EdgeInsets.all(2),
          child: CalenderDayButton(
            isToday: isToday,
            isSelected: isSelected,
            day: i,
            isDifferentMonth: false,
            onPressed: () {
              setState(() {
                _selectedDate = currentDate;
              });
            },
          ),
        ),
      );
      lastNextDate = currentDate;
    }

    // last weekday from current month

    // Add days from next month to fill the last week

    if (lastWeekday != 7) {
      final daysToAdd = 7 - lastWeekday;
      for (var i = 0; i < daysToAdd; i++) {
        final day = i + 1;
        final nextDate = DateTime(nextMonthYear, nextMonth, day);
        dayWidgets.add(
          Container(
            margin: const EdgeInsets.all(2),
            child: CalenderDayButton(
              isToday: false,
              isSelected: false,
              isDifferentMonth: true,
              day: day,
              onPressed: () {
                setState(() {
                  _selectedDate = nextDate;
                });
                _pageController.animateToPage(
                  (nextDate.year * 12 + nextDate.month) - 1,
                  duration: AnimationConstants.defaultDuration,
                  curve: AnimationConstants.defaultCurve,
                );
              },
            ),
          ),
        );
        lastNextDate = nextDate;
      }
    }

    // get starting day for this line

    // add 6th line of days if needed
    if (dayWidgets.length == 35 && lastNextDate != null) {
      for (var i = 0; i < 7; i++) {
        final nextDate = lastNextDate.add(Duration(days: i + 1));
        dayWidgets.add(
          Container(
            margin: const EdgeInsets.all(2),
            child: CalenderDayButton(
              isToday: false,
              isSelected: false,
              isDifferentMonth: true,
              day: nextDate.day,
              onPressed: () {
                setState(() {
                  _selectedDate = nextDate;
                });
                _pageController.animateToPage(
                  (nextDate.year * 12 + nextDate.month) - 1,
                  duration: AnimationConstants.defaultDuration,
                  curve: AnimationConstants.defaultCurve,
                );
              },
            ),
          ),
        );
      }
    }
    final l10n = context.l10n;
    return Column(
      children: [
        GridView.count(
          physics: const ClampingScrollPhysics(),
          crossAxisCount: 7,
          shrinkWrap: true,
          children: [
            Center(child: AppText(l10n.gen_monday_short)),
            Center(child: AppText(l10n.gen_tuesday_short)),
            Center(child: AppText(l10n.gen_wednesday_short)),
            Center(child: AppText(l10n.gen_thursday_short)),
            Center(child: AppText(l10n.gen_friday_short)),
            Center(child: AppText(l10n.gen_saturday_short)),
            Center(child: AppText(l10n.gen_sunday_short)),
          ],
        ),
        Flexible(
          child: GridView.count(
            physics: const ClampingScrollPhysics(),
            crossAxisCount: 7,
            children: dayWidgets,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    //final temporaryProperties = context.appTheme.temporaryProperties;
    final calenderProperties = context.appTheme.calenderProperties;
    final isCurrentPageToday =
        _currentPage == (_today.year * 12 + _today.month) - 1;
    final isSelectedDateOnPage =
        _currentPage == (_selectedDate.year * 12 + _selectedDate.month) - 1;

    return SizedBox(
      height: 412,
      width: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: UiConstants.defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIconButton.secondary(
                  color: calenderProperties.dayButtonPrimaryColor,
                  iconSize: 28,
                  iconData: AppIcons.chevron_left,
                  onPressed: _prevMonth,
                  // tooltip: 'PREV_MONTH',
                ),
                Row(
                  children: [
                    _MonthSelector(
                      monthDropdownController: monthDropdownController,
                      monthMenuFocusNode: monthMenuFocusNode,
                      onMonthSelected: _jumpToMonth,
                      selectedMonth: (_currentPage % 12) + 1,
                    ),
                    const SizedBox(width: UiConstants.elementMargin),
                    _YearSelector(
                      yearDropdownController: yearDropdownController,
                      yearMenuFocusNode: yearMenuFocusNode,
                      onYearSelected: _jumpToYear,
                      selectedYear: _currentPage ~/ 12,
                    ),
                  ],
                ),
                // AppText(
                //   '${_currentPage ~/ 12} - ${(_currentPage % 12) + 1}',
                //   style: context.appTheme.textStyles.h3,
                // ),
                AppIconButton.secondary(
                  color: calenderProperties.dayButtonPrimaryColor,
                  // tooltip: 'NEXT_MONTH',
                  iconSize: 28,
                  iconData: AppIcons.chevron_right,
                  onPressed: _nextMonth,
                ),
              ],
            ),
          ),
          const AppDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UiConstants.defaultPadding,
            ),
            child: SizedBox(
              height: 280,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final year = index ~/ 12;
                  final month = index % 12 + 1;
                  final date = DateTime(year, month);
                  return _buildCalendarPage(date);
                },
              ),
            ),
          ),
          const AppDivider(),
          Padding(
            padding: const EdgeInsets.all(
              UiConstants.defaultPadding,
            ),
            child: Row(
              children: [
                AppIconButton.secondary(
                  color: calenderProperties.dayButtonPrimaryColor,
                  tooltip: l10n.calendar_today,
                  iconData: AppIcons.today_outlined,
                  onPressed: !isCurrentPageToday || _selectedDate != _rawToday
                      ? _jumpToToday
                      : null,
                ),
                AppIconButton.secondary(
                  color: calenderProperties.dayButtonPrimaryColor,
                  tooltip: l10n.calendar_selected_date,
                  onPressed: isSelectedDateOnPage ? null : _jumpToSelectedDate,
                  iconData: AppIcons.event_available,
                ),
                const Spacer(),
                AppApplyButton(
                  onPressed: () {
                    widget.onApply(_selectedDate);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _YearSelector extends StatelessWidget {
  const _YearSelector({
    required this.yearDropdownController,
    required this.yearMenuFocusNode,
    required this.onYearSelected,
    required this.selectedYear,
  });

  final NextMenuController yearDropdownController;
  final FocusNode yearMenuFocusNode;
  final void Function(int) onYearSelected;
  final int selectedYear;
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final l10n = context.l10n;
    return SizedBox(
      width: 70,
      child: NextMenuAnchor(
        alignmentOffset: const Offset(0, 5),
        controller: yearDropdownController,
        childFocusNode: yearMenuFocusNode,
        onDismiss: () {},
        style: MenuStyle(
          maximumSize: WidgetStateProperty.all(
            const Size(70, 200),
          ),
        ),
        menuChildren: List.generate(
          100,
          (index) => SizedBox(
            width: 70,
            child: NextMenuItemButton(
              onPressed: () {
                onYearSelected(currentYear - index);
              },
              child: AppText(
                '${currentYear - index}',
                autoSize: false,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        child: AppButton.outline(
          color: context.appTheme.calenderProperties.dayButtonSecondaryColor,
          foregroundColorOnHover:
              context.appTheme.calenderProperties.dayButtonSecondaryColor,
          overlayColor:
              context.appTheme.calenderProperties.dayButtonOverlayColor,
          onPressed: yearDropdownController.open,
          tooltip: l10n.gen_year,
          child: Align(
            child: AppText(
              selectedYear.toString(),
              autoSize: false,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class _MonthSelector extends StatelessWidget {
  const _MonthSelector({
    required this.monthDropdownController,
    required this.monthMenuFocusNode,
    required this.onMonthSelected,
    required this.selectedMonth,
  });

  final NextMenuController monthDropdownController;
  final FocusNode monthMenuFocusNode;
  final void Function(int) onMonthSelected;
  final int selectedMonth;
  static const width = 90.0;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final monthMap = {
      1: l10n.gen_january_short,
      2: l10n.gen_february_short,
      3: l10n.gen_march_short,
      4: l10n.gen_april_short,
      5: l10n.gen_may_short,
      6: l10n.gen_june_short,
      7: l10n.gen_july_short,
      8: l10n.gen_august_short,
      9: l10n.gen_september_short,
      10: l10n.gen_october_short,
      11: l10n.gen_november_short,
      12: l10n.gen_december_short,
    };

    return SizedBox(
      width: width,
      child: NextMenuAnchor(
        alignmentOffset: const Offset(0, 5),
        controller: monthDropdownController,
        childFocusNode: monthMenuFocusNode,
        onDismiss: () {},
        style: MenuStyle(
          maximumSize: WidgetStateProperty.all(
            const Size(width, 200),
          ),
        ),
        menuChildren: monthMap.entries
            .map(
              (e) => SizedBox(
                width: width,
                child: NextMenuItemButton(
                  onPressed: () => onMonthSelected(e.key),
                  child: AppText(
                    e.value,
                    autoSize: false,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
            .toList(),
        child: AppButton.outline(
          color: context.appTheme.calenderProperties.dayButtonSecondaryColor,
          foregroundColorOnHover:
              context.appTheme.calenderProperties.dayButtonSecondaryColor,
          overlayColor:
              context.appTheme.calenderProperties.dayButtonOverlayColor,
          onPressed: monthDropdownController.open,
          tooltip: l10n.gen_month,
          child: Align(
            child: AppText(
              monthMap[selectedMonth]!,
              autoSize: false,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

/// A button widget representing a day in a calendar.
///
/// The [CalenderDayButton] widget is used to display a day in a calendar view.
/// It provides visual feedback for the current day, selected days, and days
/// from different months. The button's appearance changes based on its state,
/// such as whether it is selected, represents today, or belongs to a different
/// month.
///
/// {@tool snippet}
/// This example shows how to use [CalenderDayButton] to display a calendar day
/// button:
///
/// ```dart
/// CalenderDayButton(
///   day: 15,
///   onPressed: () {
///     // Handle button press
///   },
///   isToday: true,
///   isSelected: false,
///   isDifferentMonth: false,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [OutlinedButton], which is used to create the button.
///  * [AppText], which is used to display the day number.
class CalenderDayButton extends StatelessWidget {
  /// Creates a [CalenderDayButton].
  ///
  /// The [day], [onPressed], [isToday], [isSelected], and [isDifferentMonth]
  /// parameters must not be null.
  const CalenderDayButton({
    required this.day,
    required this.onPressed,
    required this.isToday,
    required this.isSelected,
    required this.isDifferentMonth,
    super.key,
  });

  /// The day number to display on the button.
  final int day;

  /// The callback to invoke when the button is pressed.
  final VoidCallback onPressed;

  /// Whether the button represents the current day.
  final bool isToday;

  /// Whether the button is selected.
  final bool isSelected;

  /// Whether the button represents a day from a different month.
  final bool isDifferentMonth;

  @override
  Widget build(BuildContext context) {
    final calenderProperties = context.appTheme.calenderProperties;
    final generalColors = context.appTheme.generalColors;
    return OutlinedButton(
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith<BorderSide>(
          (states) {
            return BorderSide(
              color: isSelected || isToday
                  ? calenderProperties.dayButtonPrimaryColor
                  : calenderProperties.dayButtonBorderColor,
            );
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            return isSelected
                ? calenderProperties.dayButtonPrimaryColor
                : generalColors.transparent;
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            final foregroundColor = isSelected
                ? calenderProperties.dayButtonSelectedForegroundColor
                : isToday
                    ? calenderProperties.dayButtonPrimaryColor
                    : isDifferentMonth
                        ? calenderProperties.dayButtonSecondaryColor
                            .withAppOpacity(0.2)
                        : calenderProperties.dayButtonSecondaryColor;

            return foregroundColor;
          },
        ),
        overlayColor: WidgetStateProperty.all(
          calenderProperties.dayButtonOverlayColor,
        ),
        fixedSize: WidgetStateProperty.all(
          const Size.fromHeight(50),
        ),
        minimumSize: WidgetStateProperty.all(
          Size.zero,
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.zero,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed,
      child: AppText(
        '$day',
      ),
    );
  }
}

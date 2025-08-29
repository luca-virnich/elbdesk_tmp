part of '../contact_card.dart';

/// @nodoc
class _ContactCompanyEmployeeView extends StatelessWidget {
  /// This view shows the employees of a company contact or the companies
  /// of an employee contact.
  const _ContactCompanyEmployeeView({
    required this.contactId,
    required this.isCompany,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
  });
  final int contactId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool isCompany;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context) {
    print('ContactCompanyEmployeeView build $contactId $sessionId');
    return isCompany
        ? EmployeesByCompanyView(
            contactId: contactId,
            sessionId: sessionId,
            navigatorKey: navigatorKey,
            floatingWindowId: floatingWindowId,
            componentIdentifier:
                ComponentIdentifier.companyEmployeeTableEmployeesView,
          )
        : CompaniesByEmployeeView(
            contactIdFromEmployee: contactId,
            sessionId: sessionId,
            navigatorKey: navigatorKey,
            floatingWindowId: floatingWindowId,
            componentIdentifier:
                ComponentIdentifier.companyEmployeeTableCompaniesView,
          );
  }
}

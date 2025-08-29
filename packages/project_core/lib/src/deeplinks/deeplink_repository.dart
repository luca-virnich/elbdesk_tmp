import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart' hide Deeplink;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deeplink_repository.g.dart';

@riverpod
DeeplinkRepository deeplinkRepository(Ref ref) {
  return DeeplinkRepository(
    client: serverpodClient.deeplink,
    clientCore: serverpodClient.modules.core.deeplinkCore,
    ref: ref,
  );
}

class DeeplinkRepository {
  DeeplinkRepository({
    required this.client,
    required this.clientCore,
    required this.ref,
  });

  // final EndpointDeeplink client;
  final EndpointDeeplink client;
  final EndpointDeeplinkCore clientCore;
  final Ref ref;

  Future<void> handleDeeplink(String path) async {
    final deeplink = await clientCore.getDeeplink(path: path);
    if (deeplink == null) return;
    return _handleDeeplink(deeplink);
  }

  Future<void> _handleDeeplink(Deeplink deeplink) async {
    final windowType = Parser.enumFromString(
      FloatingWindowType.values,
      deeplink.floatingWindowType,
    );
    if (windowType == null) return;
    switch (windowType) {
      case FloatingWindowType.contactPerson:
        ref.openWindow(
          FloatingContactPersonWindowData(
            contactId: deeplink.primaryId,
          ),
        );
        return;
      case FloatingWindowType.contactCompany:
        ref.openWindow(
          FloatingContactCompanyWindowData(
            contactId: deeplink.primaryId,
          ),
        );
        return;
      case FloatingWindowType.artwork:
        final artworkCustomerId =
            await client.getArtworkCustomerId(artworkId: deeplink.primaryId);
        if (artworkCustomerId == null) return;
        ref.openWindow(
          FloatingArtworkWindowData(
            artworkId: deeplink.primaryId,
            customerId: artworkCustomerId,
          ),
        );
      case FloatingWindowType.salesOrder:
        final salesOrderCustomerId = await client.getSalesOrderCustomerId(
          salesOrderId: deeplink.primaryId,
        );
        if (salesOrderCustomerId == null) return;
        ref.openWindow(
          FloatingSalesOrderWindowData(
            salesOrderId: deeplink.primaryId,
            customerId: salesOrderCustomerId,
          ),
        );
        return;
      case FloatingWindowType.soiConsulting:
        final (soiCustomerId, salesOrderId) =
            await client.getSoiCustomerIdAndSalesOrderId(
          soiTypePrimaryKey: deeplink.primaryId,
          soiType: SalesOrderItemType.consulting,
        );
        if (soiCustomerId == null || salesOrderId == null) return;

        ref.openWindow(
          FloatingSoiConsultingWindowData(
            entityId: deeplink.primaryId,
            customerId: soiCustomerId,
            salesOrderId: salesOrderId,
          ),
        );
        return;
      case FloatingWindowType.soiPrepareArtwork:
        final (soiCustomerId, salesOrderId) =
            await client.getSoiCustomerIdAndSalesOrderId(
          soiTypePrimaryKey: deeplink.primaryId,
          soiType: SalesOrderItemType.prepareArtwork,
        );
        if (soiCustomerId == null || salesOrderId == null) return;
        ref.openWindow(
          FloatingSoiPrepareArtworkWindowData(
            entityId: deeplink.primaryId,
            customerId: soiCustomerId,
          ),
        );
        return;
      case FloatingWindowType.customer:
        ref.openWindow(
          FloatingCustomerWindowData(
            customerId: deeplink.primaryId,
          ),
        );
      case FloatingWindowType.drucklayout:
        break;

      case FloatingWindowType.crmEvent:
        ref.openWindow(
          FloatingCrmEventWindowData(
            eventId: deeplink.primaryId,
          ),
        );
        return;
      case FloatingWindowType.companyDepartment:
        break;

      case FloatingWindowType.customerTable:
        break;
      case FloatingWindowType.companyEmployee:
        break;
      case FloatingWindowType.contactPersonTable:
        break;
      case FloatingWindowType.contactCompanyTable:
        break;

      case FloatingWindowType.salesOrderTable:
        break;

      case FloatingWindowType.salesOrderItemTable:
        break;

      case FloatingWindowType.soiRequestArtworkApproval:
        break;
      case FloatingWindowType.soiEinzelformaufbau:
        break;
      case FloatingWindowType.allSoiFromSalesOrder:
        break;
      case FloatingWindowType.product:
        break;
      case FloatingWindowType.productMaster:
        break;
      case FloatingWindowType.productTable:
        break;

      case FloatingWindowType.color:
        break;
      case FloatingWindowType.colorPalette:
        break;

      case FloatingWindowType.artworkQuarantineGroup:
        break;
      case FloatingWindowType.artworkQuarantineGroupTable:
        break;
      case FloatingWindowType.artworkTemplate:
        break;

      case FloatingWindowType.appUser:
        break;

      case FloatingWindowType.appClient:
        break;

      case FloatingWindowType.adminSettings:
        break;
      case FloatingWindowType.adminLog:
        break;
      case FloatingWindowType.flutterLog:
        break;
      case FloatingWindowType.adminMigration:
        break;
      case FloatingWindowType.serverpodLog:
        break;
      case FloatingWindowType.adminUsersTable:
        break;
      case FloatingWindowType.adminEntityLockTable:
        break;
      case FloatingWindowType.developerOptions:
        break;
      case FloatingWindowType.mopAdmin:
        break;
      case FloatingWindowType.crmAdmin:
        break;
      case FloatingWindowType.serviceUser:
        break;
      case FloatingWindowType.adminServiceUsersTable:
        break;
    }
    return;
  }
}

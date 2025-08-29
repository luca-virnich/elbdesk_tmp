import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:project_core/project_core.dart';

final List<WindowRegistryEntry<FloatingWindowData>> windowRegistry = [
  // Core
  WindowRegistryEntry<FloatingAppUserWindowData>(
    (context, data) => FloatingAppUserCard(data: data),
    duplicateCheck: (data, other) {
      if (other.appUserId == null) {
        return false;
      }
      return data.appUserId == other.appUserId;
    },
  ),
  WindowRegistryEntry<FloatingAppClientWindowData>(
    (context, data) => FloatingAppClientCard(data: data),
    duplicateCheck: (data, other) {
      if (other.entityId == null) {
        return false;
      }
      return data.entityId == other.entityId;
    },
  ),

  // Admin
  WindowRegistryEntry<FloatingAdminSettingsWindowData>(
    (context, data) => FloatingAdminSettingsCard(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),
  WindowRegistryEntry<FloatingAppUserTableWindowData>(
    (context, data) => FloatingAppUserTable(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),
  WindowRegistryEntry<FloatingServiceUserWindowData>(
    (context, data) => FloatingServiceUserCard(data: data),
    duplicateCheck: (data, other) {
      if (other.serviceUserId == null) {
        return false;
      }
      return data.serviceUserId == other.serviceUserId;
    },
  ),
  WindowRegistryEntry<FloatingServiceUserTableWindowData>(
    (context, data) => FloatingServiceUserTable(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),
  WindowRegistryEntry<FloatingEntityLockTableWindowData>(
    (context, data) => FloatingEntityLockTable(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),
  WindowRegistryEntry<FloatingAdminLogWindowData>(
    (context, data) => FloatingAdminLogCard(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),
  WindowRegistryEntry<FloatingAdminMigrationWindowData>(
    (context, data) => FloatingAdminMigrationCard(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),
  WindowRegistryEntry<FloatingFlutterLogWindowData>(
    (context, data) => FloatingFlutterLogCard(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),
  WindowRegistryEntry<FloatingServerpodLogWindowData>(
    (context, data) => FloatingServerpodLogCard(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),

  // CRM
  WindowRegistryEntry<FloatingCrmAdminWindowData>(
    (context, data) => FloatingCrmAdminCard(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),

  WindowRegistryEntry<FloatingContactPersonWindowData>(
    (context, data) => FloatingContactPersonCard(data: data),
    duplicateCheck: (data, other) {
      if (other.contactId == null) {
        return false;
      }
      return data.contactId == other.contactId;
    },
  ),
  WindowRegistryEntry<FloatingContactCompanyWindowData>(
    (context, data) => FloatingContactCompanyCard(data: data),
    duplicateCheck: (data, other) {
      if (other.contactId == null) {
        return false;
      }
      return data.contactId == other.contactId;
    },
  ),

  WindowRegistryEntry<FloatingCustomerWindowData>(
    (context, data) => FloatingCustomerCard(data: data),
    duplicateCheck: (data, other) {
      if (other.customerId == null) {
        return false;
      }
      return data.customerId == other.customerId;
    },
  ),
  WindowRegistryEntry<FloatingCustomerTableWindowData>(
    (context, data) => FloatingCustomerTable(data: data),
  ),
  WindowRegistryEntry<FloatingCompanyEmployeeWindowData>(
    (context, data) => FloatingCompanyEmployeeCard(
      data: data,
    ),
    duplicateCheck: (data, other) {
      return data.entityId == other.entityId;
    },
  ),
  WindowRegistryEntry<FloatingCompanyDepartmentWindowData>(
    (context, data) => FloatingCompanyDepartmentCard(
      data: data,
    ),
    duplicateCheck: (data, other) {
      return data.entityId == other.entityId;
    },
  ),
  WindowRegistryEntry<FloatingContactPersonTableWindowData>(
    (context, data) => FloatingContactPersonTable(data: data),
  ),
  WindowRegistryEntry<FloatingContactCompanyTableWindowData>(
    (context, data) => FloatingContactCompanyTable(data: data),
  ),

  WindowRegistryEntry<FloatingCrmEventWindowData>(
    (context, data) => FloatingEventCard(data: data),
  ),

  // Sales
  WindowRegistryEntry<FloatingSalesOrderWindowData>(
    (context, data) => FloatingSalesOrderCard(data: data),
    duplicateCheck: (data, other) {
      if (other.salesOrderId == null) {
        return false;
      }
      return data.salesOrderId == other.salesOrderId;
    },
  ),
  WindowRegistryEntry<FloatingSalesOrderTableWindowData>(
    (context, data) => FloatingSalesOrderTable(data: data),
  ),
  WindowRegistryEntry<FloatingSalesOrderItemTableWindowData>(
    (context, data) => FloatingSalesOrderItemTable(data: data),
  ),
  WindowRegistryEntry<FloatingAllSoiFromSalesOrderWindowData>(
    (context, data) => FloatingAllSoiFromSalesOrder(data: data),
  ),
  WindowRegistryEntry<FloatingSoiConsultingWindowData>(
    (context, data) => FloatingSoiConsultingCard(data: data),
    duplicateCheck: (data, other) {
      if (other.entityId == null) {
        return false;
      }
      return data.entityId == other.entityId;
    },
  ),
  WindowRegistryEntry<FloatingSoiEinzelformaufbauWindowData>(
    (context, data) => FloatingSoiEinzelformaufbauCard(data: data),
    duplicateCheck: (data, other) {
      if (other.entityId == null) {
        return false;
      }
      return data.entityId == other.entityId;
    },
  ),

  // Product
  WindowRegistryEntry<FloatingProductWindowData>(
    (context, data) => FloatingProductCard(data: data),
    duplicateCheck: (data, other) {
      if (other.productId == null) {
        return false;
      }
      return data.productId == other.productId;
    },
  ),
  WindowRegistryEntry<FloatingProductTableWindowData>(
    (context, data) => FloatingProductTable(data: data),
  ),
  WindowRegistryEntry<FloatingProductMasterWindowData>(
    (context, data) => FloatingProductMasterCard(data: data),
  ),

  // Prepress
  WindowRegistryEntry<FloatingMopAdminWindowData>(
    (context, data) => FloatingMopAdminCard(data: data),
  ),
  WindowRegistryEntry<FloatingPrepressColorWindowData>(
    (context, data) => FloatingPrepressColorCard(data: data),
  ),
  WindowRegistryEntry<FloatingPrepressColorPaletteWindowData>(
    (context, data) => FloatingColorPaletteCard(data: data),
    duplicateCheck: (data, other) {
      if (other.colorPaletteId == null) {
        return false;
      }
      return data.colorPaletteId == other.colorPaletteId;
    },
  ),
  WindowRegistryEntry<FloatingArtworkTemplateWindowData>(
    (context, data) => FloatingArtworkTemplateCard(data: data),
    duplicateCheck: (data, other) {
      if (other.artworkTemplateId == null) {
        return false;
      }
      return data.artworkTemplateId == other.artworkTemplateId;
    },
  ),
  WindowRegistryEntry<FloatingArtworkWindowData>(
    (context, data) => FloatingArtworkCard(data: data),
    duplicateCheck: (data, other) {
      if (other.artworkId == null) {
        return false;
      }
      return data.artworkId == other.artworkId;
    },
  ),

  WindowRegistryEntry<FloatingArtworkQuarantineGroupWindowData>(
    (context, data) => FloatingArtworkQuarantineGroupCard(data: data),
    duplicateCheck: (data, other) {
      if (other.groupId == null) {
        return false;
      }
      return data.groupId == other.groupId;
    },
  ),
  WindowRegistryEntry<FloatingArtworkQuarantineGroupTableWindowData>(
    (context, data) => FloatingArtworkQuarantineGroupTable(data: data),
  ),
  WindowRegistryEntry<FloatingSoiPrepareArtworkWindowData>(
    (context, data) => FloatingSoiPrepareArtworkCard(data: data),
    duplicateCheck: (data, other) {
      if (other.entityId == null) {
        return false;
      }
      return data.entityId == other.entityId;
    },
  ),
  WindowRegistryEntry<FloatingSoiRequestArtworkApprovalWindowData>(
    (context, data) => FloatingSoiRequestArtworkApprovalCard(data: data),
    duplicateCheck: (data, other) {
      if (other.entityId == null) {
        return false;
      }
      return data.entityId == other.entityId;
    },
  ),
  WindowRegistryEntry<FloatingDrucklayoutWindowData>(
    (context, data) => FloatingDrucklayoutCard(data: data),
  ),

  // Developer
  WindowRegistryEntry<FloatingDeveloperOptionsWindowData>(
    (context, data) => FloatingDeveloperOptionsCard(data: data),
    duplicateCheck: (data, other) {
      return true;
    },
  ),
];

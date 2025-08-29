import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_core/src/features/light_user/models/light_user.dart';

class LightUserRepository {
  LightUserRepository({
    required this.endpoint,
  });
  final EndpointLightUser endpoint;

  Future<List<LightUser>> fetchAll() async {
    final lightUsers = await endpoint.fetchAll(
      includeUserInfo: false,
      showInactive: true,
    );
    return lightUsers.map(LightUser.fromDTO).toList();
  }
}

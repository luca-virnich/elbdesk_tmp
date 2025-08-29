part of 'app_user_endpoint.dart';

// class AppUserSharedEndpoint extends Endpoint {
//   @override
//   bool get requireLogin => true;

//   Future<List<AppUserDTO>> findAppUsers(
//     Session session, {
//     Sort? sort,
//     Filter? filter,
//   }) async =>
//       _getAppUsers(session, sort: sort, filter: filter);

//   /// Find a User by its id
//   Future<AppUserDTO?> findAppUser(Session session, int appUserId) async =>
//       AppUserDTO.db.findById(
//         session,
//         appUserId,
//         include: AppUserDTO.include(
//           userInfo: UserInfo.include(),
//         ),
//       );
// }

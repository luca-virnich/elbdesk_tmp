part of 'app_user_endpoint.dart';

class AppUserPublicInsecureEndpoint extends Endpoint {
  @override
  bool get requireLogin => false;

  Future<bool> hasUsers(
    Session session,
  ) async {
    final users = await AppUserDTO.db.find(
      session,
    );
    return users.isNotEmpty;
  }

  Future<AppUserDTO> createInitialAdminAppUser(
    Session session, {
    required String email,
    required String fullName,
  }) async {
    final hasRegistredUsers = await hasUsers(session);

    if (hasRegistredUsers) {
      throw Exception('Admin user already exists');
    }
    final splittedName = fullName.split(' ');
    final lastName = splittedName.last;
    final firstName = splittedName.length > 1
        ? splittedName.sublist(0, splittedName.length - 1).join(' ')
        : '';
    final initials = (firstName.isNotEmpty ? firstName.substring(0, 1) : '') +
        (lastName.isNotEmpty ? lastName.substring(0, 1) : '');

    final password = AppUserUtils.generateRandomString(20);

    final userInfo = await _createInitialAdminUserInfo(
      session,
      email: email,
      password: password,
      fullName: fullName,
    );
    final now = DateTime.now();
    final appUser = AppUserDTO(
      userInfoId: userInfo.id,
      privateEmail: '',
      userInfo: userInfo,
      createdAt: now,
      initials: initials,
      isDraft: false,
      createdById: null,
      editingById: null,
      firstName: firstName,
      lastName: lastName,
      address: '',
      address2: '',
      postCode: '',
      city: '',
      state: '',
      phone: '',
      mobile: '',
      employeeNumber: '',
      position: '',
      costCenter: '',
      isActive: true,
    );

    final newAppUser = await AppUserDTO.db.insertRow(session, appUser);

    await Users.updateUserScopes(
      session,
      newAppUser.id!,
      AppScope.values.rwd,
    );

    final fetchedAppUser = await AppUserDTO.db.findById(
      session,
      newAppUser.id!,
      include: AppUserDTO.include(
        userInfo: UserInfo.include(),
      ),
    );

    await session.serverpod.mailer.sendRegistrationEmail(
      registrarEmail: '',
      registrantEmail: fetchedAppUser!.userInfo!.email!,
      password: password,
    );

    return fetchedAppUser;
  }

  Future<UserInfo> _createInitialAdminUserInfo(
    Session session, {
    required String email,
    required String password,
    required String fullName,
  }) async {
    final userInfo = await Emails.createUser(
      session,
      '',
      email,
      password,
    );
    final updatedFullName = userInfo!.copyWith(fullName: fullName);
    return UserInfo.db.updateRow(session, updatedFullName);
  }
}

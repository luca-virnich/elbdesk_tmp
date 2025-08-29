/// Type-safe server error translations using advanced enums
enum ElbValidationError {
  // General errors
  serverError(de: 'Serverfehler', en: 'Server error'),
  unknownError(de: 'Unbekannter Fehler', en: 'Unknown error'),
  validationError(de: 'Validierungsfehler', en: 'Validation error'),

  // Authentication errors
  authenticationFailed(
    de: 'Authentifizierung fehlgeschlagen',
    en: 'Authentication failed',
  ),
  unauthorized(de: 'Nicht autorisiert', en: 'Unauthorized'),
  sessionExpired(de: 'Sitzung abgelaufen', en: 'Session expired'),
  invalidCredentials(de: 'Ungültige Anmeldedaten', en: 'Invalid credentials'),

  // Permission errors
  permissionDenied(de: 'Zugriff verweigert', en: 'Permission denied'),
  insufficientPrivileges(
    de: 'Unzureichende Berechtigungen',
    en: 'Insufficient privileges',
  ),
  accessRestricted(de: 'Zugriff eingeschränkt', en: 'Access restricted'),

  // Data errors
  notFound(de: 'Nicht gefunden', en: 'Not found'),
  alreadyExists(de: 'Existiert bereits', en: 'Already exists'),
  dataIntegrityError(de: 'Datenintegritätsfehler', en: 'Data integrity error'),
  invalidData(de: 'Ungültige Daten', en: 'Invalid data'),

  // Operation errors
  operationFailed(de: 'Vorgang fehlgeschlagen', en: 'Operation failed'),
  concurrentModification(
    de: 'Gleichzeitige Änderung erkannt',
    en: 'Concurrent modification detected',
  ),
  operationTimeout(de: 'Zeitüberschreitung', en: 'Operation timeout'),
  operationCancelled(de: 'Vorgang abgebrochen', en: 'Operation cancelled'),

  // Network errors
  networkError(de: 'Netzwerkfehler', en: 'Network error'),
  connectionFailed(de: 'Verbindung fehlgeschlagen', en: 'Connection failed'),
  serviceUnavailable(de: 'Dienst nicht verfügbar', en: 'Service unavailable'),

  // Business logic errors
  businessRuleViolation(
    de: 'Geschäftsregel verletzt',
    en: 'Business rule violation',
  ),
  workflowError(de: 'Workflow-Fehler', en: 'Workflow error'),
  stateTransitionError(
    de: 'Ungültiger Statusübergang',
    en: 'Invalid state transition',
  ),

  // Edit request specific errors
  editRequestActive(de: 'Bearbeitungsanfrage aktiv', en: 'Edit request active'),
  editRequestRejected(
    de: 'Bearbeitungsanfrage abgelehnt',
    en: 'Edit request rejected',
  ),
  editRequestTimeout(
    de: 'Bearbeitungsanfrage abgelaufen',
    en: 'Edit request timeout',
  ),
  cannotEditWhileOthersEditing(
    de: 'Bearbeitung nicht möglich, während andere Benutzer bearbeiten',
    en: 'Cannot edit while others are editing',
  ),

  // Session & Entity errors
  invalidSessionId(de: 'Ungültige Sitzungs-ID', en: 'Invalid session ID'),
  entityNotFound(de: 'Entität nicht gefunden', en: 'Entity not found'),
  modifiedByAnotherUser(
    de: 'Von einem anderen Benutzer geändert',
    en: 'Modified by another user',
  ),
  alreadyDeleted(de: 'Bereits gelöscht', en: 'Already deleted'),

  // User errors
  userNotAuthenticated(
    de: 'Benutzer nicht authentifiziert',
    en: 'User not authenticated',
  ),
  noPermissions(de: 'Keine Berechtigungen', en: 'No permissions'),

  // AppUser errors
  appUserFirstNameAndLastNameCannotBeEmpty(
    de: 'Vor- und Nachname dürfen nicht leer sein',
    en: 'First name and last name cannot be empty',
  ),
  appUserInitialsCannotBeEmpty(
    de: 'Initialen dürfen nicht leer sein',
    en: 'Initials cannot be empty',
  ),
  appUserInitialsAlreadyExists(
    de: 'Initialen existieren bereits',
    en: 'Initials already exist',
  ),
  appUserEmailAlreadyExists(
    de: 'E-Mail-Adresse existiert bereits',
    en: 'Email already exists',
  ),
  appUserNameAlreadyExists(
    de: 'Benutzername existiert bereits',
    en: 'Username already exists',
  ),
  appUserInitialsTooLong(
    de: 'Initialen dürfen nicht länger als 4 Zeichen sein',
    en: 'Initials cannot be longer than 4 characters',
  ),
  appUserEmailCannotBeEmpty(
    de: 'E-Mail-Adresse darf nicht leer sein',
    en: 'Email cannot be empty',
  ),
  appUserCouldntBeCreated(
    de: 'Benutzer konnte nicht erstellt werden',
    en: 'User could not be created',
  ),

  // ServiceUser errors
  serviceUserServiceNameCannotBeEmpty(
    de: 'Service-Name darf nicht leer sein',
    en: 'Service name cannot be empty',
  ),
  serviceUserServiceDescriptionCannotBeEmpty(
    de: 'Service-Beschreibung darf nicht leer sein',
    en: 'Service description cannot be empty',
  ),
  serviceUserNameAlreadyExists(
    de: 'Service-Benutzername existiert bereits',
    en: 'Service username already exists',
  ),

  // CompanyEmployee errors
  companyEmployeeAlreadyAssigned(
    de: 'Mitarbeiter bereits zugewiesen',
    en: 'Company employee already assigned',
  ),
  companyEmployeeNotFound(
    de: 'Mitarbeiter nicht gefunden',
    en: 'Company employee not found',
  ),
  companyEmployeeContactNotSaved(
    de: 'Kontakt muss erst gespeichert werden',
    en: 'Contact must be saved first',
  ),
  companyEmployeeCompanyNotSaved(
    de: 'Firma muss erst gespeichert werden',
    en: 'Company must be saved first',
  ),

  companyEmployeeCompanyNotFound(
    de: 'Firma nicht gefunden',
    en: 'Company not found',
  ),
  companyEmployeeDepartmentNotFound(
    de: 'Abteilung nicht gefunden',
    en: 'Department not found',
  ),
  companyEmployeeAlreadyAssignedToDepartment(
    de: 'Mitarbeiter bereits in dieser Abteilung',
    en: 'Company employee already assigned to department',
  ),
  companyEmployeeNotAssignedToDepartment(
    de: 'Mitarbeiter nicht in dieser Abteilung',
    en: 'Company employee not assigned to department',
  ),

  // Customer errors
  contactAlreadyAssignedAsShippingAddress(
    de: 'Kontakt bereits als Lieferadresse zugewiesen',
    en: 'Contact already assigned as shipping address',
  ),
  customerAlreadyAssignedAsBillingAddress(
    de: 'Kunde bereits als Rechnungsadresse zugewiesen',
    en: 'Customer already assigned as billing address',
  ),
  customerOrContactNotFound(
    de: 'Kunde oder Kontakt nicht gefunden',
    en: 'Customer or contact not found',
  ),
  customerCustomerAlreadyAssigned(
    de: 'Kundenzuordnung bereits vorhanden',
    en: 'Customer-to-customer already assigned',
  ),

  // SOI Artwork errors
  artworkAlreadyInSoiPrepareArtwork(
    de: 'Artwork bereits in Auftragsvorbereitung',
    en: 'Artwork already in SOI prepare artwork',
  ),
  prepareArtworkAlreadyAdded(
    de: 'Artwork-Vorbereitung bereits hinzugefügt',
    en: 'Prepare artwork already added',
  ),
  artworkAlreadyInAnotherSalesOrder(
    de: 'Artwork bereits in einem anderen Auftrag',
    en: 'Artwork already in another sales order',
  ),

  // SOI Request Artwork Approval errors
  artworkApprovalAlreadyAdded(
    de: 'Artwork-Freigabe bereits hinzugefügt',
    en: 'Artwork approval already added',
  ),

  // Data Import errors
  dataImportAttachmentRemovalFailed(
    de: 'Entfernen des Anhangs fehlgeschlagen',
    en: 'Data import attachment removal failed',
  ),
  dataImportMultipleAttachmentsNotAllowed(
    de: 'Mehrere Anhänge nicht erlaubt',
    en: 'Multiple attachments not allowed',
  ),
  dataImportFileProcessingFailed(
    de: 'Dateiverarbeitung fehlgeschlagen',
    en: 'File processing failed',
  ),
  dataImportFileCleanupFailed(
    de: 'Dateibereinigung fehlgeschlagen',
    en: 'File cleanup failed',
  ),
  dataImportFileAnalysisFailed(
    de: 'Dateianalyse fehlgeschlagen',
    en: 'File analysis failed',
  ),
  dataImportNoFileAccess(de: 'Kein Dateizugriff', en: 'No file access'),
  dataImportNoPermissionOutputFolder(
    de: 'Keine Berechtigung für Ausgabeordner',
    en: 'No permission for output folder',
  ),

  // File errors
  invalidFileTypeOnlyPdfAndZip(
    de: 'Ungültiger Dateityp - nur PDF und ZIP erlaubt',
    en: 'Invalid file type - only PDF and ZIP allowed',
  ),
  invalidFileTypeOnlyZip(
    de: 'Ungültiger Dateityp - nur ZIP erlaubt',
    en: 'Invalid file type - only ZIP allowed',
  ),
  invalidFileTypeOnlyPdf(
    de: 'Ungültiger Dateityp - nur PDF erlaubt',
    en: 'Invalid file type - only PDF allowed',
  ),
  filePathAccess(de: 'Dateipfad-Zugriffsfehler', en: 'File path access error'),
  fileOperationException(
    de: 'Dateioperations-Fehler',
    en: 'File operation exception',
  ),

  // Migration errors
  migrationAborted(de: 'Migration abgebrochen', en: 'Migration aborted'),

  // Product errors
  serienIndexNotAvailable(
    de: 'Serienindex nicht verfügbar',
    en: 'Series index not available',
  ),
  artworkTemplateNotFound(
    de: 'Artwork-Vorlage nicht gefunden',
    en: 'Artwork template not found',
  ),
  artworkMasterNotFound(
    de: 'Artwork-Master nicht gefunden',
    en: 'Artwork master not found',
  ),
  productNotFound(de: 'Produkt nicht gefunden', en: 'Product not found'),
  productMasterNotFound(
    de: 'Produktmaster nicht gefunden',
    en: 'Product master not found',
  ),
  productMasterAlreadyInSalesOrder(
    de: 'Produktmaster bereits im Auftrag',
    en: 'Product master already in sales order',
  ),
  artworkQuarantineNotFound(
    de: 'Artwork-Quarantäne nicht gefunden',
    en: 'Artwork quarantine not found',
  ),
  artworkDimensionsCantBeChangedBecauseItsInNutzenlayout(
    de: 'Maße können nicht geändert werden, da das Artwork bereits in einem Nutzenlayout verwendet wird.',
    en: 'Dimensions cannot be changed because the artwork is already used in a nutzenlayout',
  ),
  unfinishedArtworksFromProductInOtherSalesOrder(
    de: 'Unfertige Artworks vom Produkt in anderem Auftrag',
    en: 'Unfinished artworks from product in other sales order',
  );

  const ElbValidationError({required this.de, required this.en});

  final String de;
  final String en;

  /// Get translation by language code with parameters
  String call(String lang, [Map<String, dynamic>? params]) {
    var translation = switch (lang) {
      'en' => en,
      'de' => de,
      _ => de, // Fallback to German
    };

    // Replace parameters if provided
    if (params != null && params.isNotEmpty) {
      for (final entry in params.entries) {
        translation = translation.replaceAll(
          '{${entry.key}}',
          entry.value.toString(),
        );
      }
    }

    return translation;
  }

  /// Get translation by language code (without parameters)
  String translate(String lang) => call(lang);

  /// Get error key as string
  String get key => name;
}

/// Extension for even simpler usage
extension ServerErrorExtension on ElbValidationError {
  /// Get German translation with parameters
  String deTr([Map<String, dynamic>? params]) => call('de', params);

  /// Get English translation with parameters
  String enTr([Map<String, dynamic>? params]) => call('en', params);
}

/// Helper class for structured error responses
class TranslatedServerError {
  const TranslatedServerError({
    required this.error,
    required this.lang,
    this.details,
    this.parameters,
  });

  final ElbValidationError error;
  final String lang;
  final String? details;
  final Map<String, dynamic>? parameters;

  String get message {
    final baseMessage = error(lang, parameters);

    if (details != null && details!.isNotEmpty) {
      return '$baseMessage: $details';
    }

    return baseMessage;
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error.key,
      'message': message,
      'lang': lang,
      if (details != null) 'details': details,
    };
  }
}

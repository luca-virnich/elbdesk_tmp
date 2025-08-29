---
sidebar_position: 5
---

# Entity Repository (Client)

Every Entity should have his own `EntityRepository` on the Client to interact with the `EntitiyEndpoint`.

The Repository should implement the abstract class `EntityRepository<T>`.

An Example from the `LanguageCodeRepository`:

```dart
class LanguageCodeRepository implements EntityRepository<LanguageCode> {
  
  LanguageCodeRepository({required this.endpoint});

  final EndpointLanguageCode endpoint;

}
```

The Definiton of the Class which implements the `EntityRepository` and depends on the Serverpod Endpoint, which we will pass via the Provider to the class later on.

### find

```dart
  @override
  Future<List<LanguageCode>> find({Sort? sort, Filter? filter}) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(LanguageCode.fromDTO).toList();
  }
  ```
  
  The Find Mehtod which is used for the Table

  ### fetchById

  ```dart
  @override
  Future<LanguageCode> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return LanguageCode.fromDTO(response!);
  }
```

### fetchAll

```dart
  @override
  Future<List<LanguageCode>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(LanguageCode.fromDTO).toList();
  }
  ```
  Only used when we want to access the Entity inside another Entity as dependency. For Example, we want to select the Language in a ContactCard, or the PaymentCode etc.



### fetchAndLock

  ```dart
  @override
  Future<LanguageCode?> fetchAndLock(int id, String sessionId) async {
    final response =
        await endpoint.fetchAndLock(id: id, editSessionId: sessionId);
    return response != null ? LanguageCode.fromDTO(response) : null;
  }
```

Used when we want to fetch an entity and lock it for editing

### release

```dart
 @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }
```

Releases the EntityLock after finishing editing the Entity.

### update

```dart
  @override
  Future<LanguageCode> update({
    required LanguageCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return LanguageCode.fromDTO(response);
  }
  ```

  Updates an Entity, mainly we are using this when saving/save and close an EntityCard, or when releasing an Entity while staying in the Card but give access for editing to another User.

### createAbdReturnEntity

```dart
  @override
  Future<LanguageCode> createAndReturnEntity({
    required LanguageCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return LanguageCode.fromDTO(response);
  }
  ```

  Create and Returns the Entity, mainly we are just using then the new created id for refetch the Server-Entity. In this case, the initial Entity is created at the Client

### create

```dart
 Future<int> create({
    required String sessionId,
    required ContactType type,
  }) async {
    final newContact = await endpoint.create(
      sessionId: sessionId,
      type: type,
    );
    return newContact.id!;
  }
```

Custom Implementation for creating an Entity, this is an Example from the `ContactRepository`
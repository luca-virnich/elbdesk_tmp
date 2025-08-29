abstract class EntityState<T> {
  /// use _stateManager.saveAndUnlockAndRefetch()
  Future<void> saveAndUnlockAndRefetch();

  /// use _stateManager.refetchWithoutLock()
  Future<void> refetchWithoutLock();

  /// use _stateManager.refetchWithLock()
  Future<void> refetchWithLock();

  void updateMetaAfterSave();
}

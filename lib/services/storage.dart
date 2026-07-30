abstract interface class Storage<T> {
  Future<void> save(List<T> items);
  Future<List<T>> load();
}
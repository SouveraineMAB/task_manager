abstract class Repository<T> {
  void add (T item);

  List<T> getAll();
  T ? findById(int id);
  void delete (int id);
}
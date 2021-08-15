abstract class IDao<T> {
  Future<void> update(T object);
  Future<void> add(T object);
  Future<void> delete(T object);
  Future<T> obtain(T object);
}

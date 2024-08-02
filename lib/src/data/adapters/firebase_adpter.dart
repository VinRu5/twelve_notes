abstract class FirebaseAdapter<T> {
  T fromFirebase(Map<String, dynamic> map);

  Map<String, dynamic> toFirebase(T entity);
}

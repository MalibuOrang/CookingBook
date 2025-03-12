extension GroupExtension<T> on List<T> {
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    Map<K, List<T>> result = {};
    for (T element in this) {
      K key = keyFunction(element);
      if (result.containsKey(key)) {
        result[key]!.add(element);
      } else {
        result[key] = [element];
      }
    }
    return result;
  }
}

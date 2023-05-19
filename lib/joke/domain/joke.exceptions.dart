class NoResultException implements Exception {
  const NoResultException();

  @override
  String toString() {
    return 'Something went wrong..';
  }
}

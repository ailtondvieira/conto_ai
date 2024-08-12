T ternaryClean<T>({
  required bool condition,
  required T caseTrue,
  required T caseFalse,
}) {
  return condition ? caseTrue : caseFalse;
}

enum EnumIndex { One, Two, Three, Four, Five, Six, Seven, Eight, Nigh, Ten }

void main() {
  printIndex(EnumIndex.One);
  printIndex(EnumIndex.Two);
  printIndex(EnumIndex.Three);
  printIndex(EnumIndex.Four);
  printIndex(EnumIndex.Five);
  printIndex(EnumIndex.Six);
  printIndex(EnumIndex.Seven);
  printIndex(EnumIndex.Eight);
  printIndex(EnumIndex.Nigh);
  printIndex(EnumIndex.Ten);
  print("--------------------");
  print(EnumIndex.values);
  print(EnumIndex.values.length);
  print("--------------------");
}

void printIndex(EnumIndex ei) {
  print('${ei.toString()} => ${ei.index}');
}

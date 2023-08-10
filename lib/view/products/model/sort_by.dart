extension SortByExt on SortBy {
  String get toText {
    switch (this) {
      case SortBy.lowerToHigher:
        return "Lower to higher";
      case SortBy.higherToLower:
        return "Higher to lower";
    }
  }
}

enum SortBy { lowerToHigher, higherToLower }

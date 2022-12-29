class MoreText {
  static String truncateString(String data, bool isExpanded) {
    return (data.length >= 100 && isExpanded == false) ? '${data.substring(0, 100)}...' : data;
  }
}
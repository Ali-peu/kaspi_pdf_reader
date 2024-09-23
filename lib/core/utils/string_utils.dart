class StringUtils {
  static String firstLetterIsCamel(String data) {
    return "${data.substring(0, 1).toUpperCase()}${data.substring(1)}";
  }
}

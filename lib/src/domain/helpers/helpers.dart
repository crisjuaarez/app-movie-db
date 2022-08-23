class Helpers {
  static String getUrlImage(String path) =>
      'https://image.tmdb.org/t/p/original$path';

  static dateTimeToString(DateTime dateTime) {
    final String year = dateTime.year.toString();
    final String month = dateTime.month.toString();
    final String day = dateTime.day.toString();
    return '$day/$month/$year';
  }
}

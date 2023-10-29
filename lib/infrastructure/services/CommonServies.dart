extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }

    String capitalizeFirst(){
      return split(" ").map((words) => words.capitalize()).join(" ");
    }
}
mixin UserUtils {
  capitalize(String str) {
    return str[0].toUpperCase() + str.substring(1).toLowerCase();
  }
}

bool testFilters(String testTitle) {
  // var tags = "not @undefind";
  // for (var arg in args) {
  //   List<String> argList = arg.split('=');
  //   if (argList[0] == '--tags') {
  //     tags = argList[1];
  //   }
  // }
  // print('custom==================>' + tags);
  const tags = String.fromEnvironment("tags");
  print('Run with Tags ==================> ' + tags);
  return testTitle.contains('#' + tags) ? false : true;
}

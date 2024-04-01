const months = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

calculateMilageFromList(var list) {
  for (int i = 1; i < list.length; i++) {
    var lastData = list[i - 1];
    var lastmeter = lastData['odometer'];
    var lastliter = lastData['liter'];
    var currentData = list[i];
    var odoDiff = double.parse(currentData['odometer']) - double.parse(lastmeter);
    var milage = odoDiff / double.parse(lastliter);
    currentData['milage'] = milage.toString();
  }
  return list;
}

// sortList(List list){
//   list..sort((a, b) => ,);
// }

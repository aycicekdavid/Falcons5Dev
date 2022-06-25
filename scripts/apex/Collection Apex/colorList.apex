// Create a List named as coloursList, store at least 5 colourNames in it and print it.
List<String> colorList = new List<String>();
colorList.add('blue');
colorList.add('red');
colorList.add('black');
colorList.add('white');
colorList.add('yellow');
System.debug('Colour list is ' + colorList);

// 2. Print the size of the above created List.
Integer colorSize = colorList.size();
System.debug('The size of list is ' + colorSize);

// 3. Check if the coloursList contains ‘Red’ colour in it or not.
Boolean isContainRed = colorList.contains('red');
System.debug(isContainRed);

// 4. Retrieve the last element of the List and print it in the upper case.
String lastElement = colorList.get(colorSize-1);
System.debug('The last element of the list is ' + lastElement);

// 5. Make the fifth element in the List as Upper case.
String fifthElmUpper = colorList.get(4).toUpperCase();
System.debug('Fifth element to uppercase ' + fifthElmUpper);

// 6. Create a different List named colourCodesList in which we need to store some colourcodes. For example: ‘#FF0000’ is code for red colour.
List<String> colorCodesList = new List<String>{'#FF0000','#FF0001','#FF0002','#FF0003','#FF0004'};
// colorCodesList.add('#FF0000');
// colorCodesList.add('#FF0001');
// colorCodesList.add('#FF0002');
// colorCodesList.add('#FF0003');
// colorCodesList.add('#FF0004');
System.debug(colorCodesList);

//7. Compare if the two lists colourCodesList and coloursList are equal or not.
Boolean isTwoListEqual = colorList.equals(colorCodesList);
System.debug(isTwoListEqual);

// 8. Merge the two Lists (colourCodesList, coloursList) and print the newly created list.
List<String> mergedList = new List<String>();
mergedList.addAll(colorCodesList);
mergedList.addAll(colorList);
System.debug(mergedList);


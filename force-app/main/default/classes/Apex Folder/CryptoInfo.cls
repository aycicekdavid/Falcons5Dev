public class CryptoInfo {
  // 1- Create one class called CryptoInfo, which contains the method called showPrice.
  // 2- This method should accept one string which will be called as coinName and
  // 3- will return the price based on the given input.
  // 4- This class will hold the values of crypto in one map called cryptoMap.
  // 5- From anonymous, first we will set the price of each crypto and
  // 6- than we will pass the name of crypto coin while calling the showPrice method.

  // == Example ==
  // ----------------------------
  // Input : BTC = $39,045.39;
  // Output : $39,045.39

  // Input : ETH
  // Output : $2,720.71

  //Create a static method called as showPrice
  //This method should accept one string which will be called as coinName
  //This method should return the price. Use decimal data type.
  public static Decimal showPrice(String coinName) {
    Decimal price = 0.00;

    Map<String, Decimal> cryptoMap = new Map<String, Decimal>();

    //We have to have a map which the key is crypto name and the value is its price
    //I have to put the values of the coins into mat, use put method.
    //Use map reference.put(key, value);
    cryptoMap.put('BTC', 39045.39);
    cryptoMap.put('ETH', 2720.71);
    cryptoMap.put('CYH', 12720.71);
    cryptoMap.put('PTH', 720.71);
    cryptoMap.put('ZTH', 20.71);

    //To find the right coin I have to use if else statement
    //If the coinName is in the Map, then give me the price. To achive this, write containsKey method which is "coinName.containsKey(coinName)"
    // Give a message to user 'There is no such currency. Please enter the correct currency name.'
    // What if the map is empty? Then put it in else statemnt and eliminate the proble. else(mapName.isEmpty()) show a message from System.debug.

    if (cryptoMap == null) {
      System.debug('The map is null!');
    } else if (!cryptoMap.containsKey(coinName)) {
      System.debug('No such coin! Please put the correct coin name.');
    } else {
      // If there is no any blocker then price should equal to the value comig from the map.
      // price = mapName.get(coinName);
      price = cryptoMap.get(coinName);

      System.debug(coinName + ' price is $' + price + ' .');
    }

    return price;
  }
}

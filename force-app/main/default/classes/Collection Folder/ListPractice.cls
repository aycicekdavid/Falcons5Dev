public class ListPractice {
  // Create a class named as ListPractice and fullfill the following requirements:
  // 1. Create a static class variable of type List and name it as planetsList, here the planets is the class which we already have in our org.
  // 2. Create a method addPlanet.
  //- Take planetName, planetNumber and numberOfMoons as parameters in this method.
  //- Inside the method
  // - Method should create the instance of the 'Planets class' only when the planetName is provided and
  // - once the instance is created add it to the planetsList variable.
  // - This method should return the following messages:
  //   - If planetName is provided and instance is added to the planetsList variable, then return "Planet added successfully" message.
  //   - if planetName is not provided then return "Planet without name cannot be added to the list"

  public static List<Planets> planetsList = new List<Planets>();

  public String addPlanet(
    String planetName,
    Integer planetNumber,
    Integer numberOfMoons
  ) {
    String message;

    if (planetName != null && planetName != '') {
      Planets planets = new Planets();

      planets.name = planetName;
      planets.planetNumber = planetNumber;
      planets.numberOfMoons = numberOfMoons;

      planetsList.add(planets);

      message = 'Planet added successfully!';
    } else {
      message = 'Planet without name cannot be added to the list!';
    }

    return message;
  }
}

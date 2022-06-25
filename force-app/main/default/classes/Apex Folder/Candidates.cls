public class Candidates {
  public String name;
  public String gender;
  public static String companyName;

  public void printCandidate() {
    System.debug('Candidate Name is ' + name + '(' + gender + ')');
    System.debug('Company name is ' + companyName);
  }

  public static void printCandidateInfo() {
    System.debug('Company name is ' + companyName);
  }
}

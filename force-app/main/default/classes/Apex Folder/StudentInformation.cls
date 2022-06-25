public class StudentInformation {
  public String name;
  public String emailId;
  public String phoneNumber;

  // - Create one class as StudentInformation
  // - which does have one parameterized constructor and it accepts or defines the values of three variables which are name, emailId and phoneNumber.

  public StudentInformation(String name, String emailId, String phoneNumber) {
    this.name = name;
    this.emailId = emailId;
    this.phoneNumber = phoneNumber;
  }

  // We will create another class called ShowStudentInformation which will have the method named as showStudentInfo which will have the list of StudentInformation as parameter to show the student information. From anonymous window you will pass the list of StudentInformation and information of all students should be printed.

  // Example Output:
  // {
  // StudentInformation:[email=james@mail.com, name=Jimmy, phoneNumber=989898989898], StudentInformation:[email=James@mail.com, name=James, phoneNumber=767676767676], StudentInformation:[email=Karl@mail.com, name=Karl, phoneNumber=878787878787], StudentInformation:[email=Suzi@mail.com, name=Suzi, phoneNumber=909090909090], StudentInformation:[email=John@mail.com, name=John, phoneNumber=878787878787],
  // }
  // +2
  // 11 replies
  // Last reply 21 hours agoView thread
}

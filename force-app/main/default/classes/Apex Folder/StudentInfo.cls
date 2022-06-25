public class StudentInfo {
  // - Create one class with the name as StudentInfo and that should have one static variable which is InstituteName.

  public static String InstituteName;

  // - This class should have one non-parameterized constructor to show the welcome message.
  public StudentInfo() {
    System.debug('Welcome to ' + InstituteName + '.');
  }

  // - Along with the same, we need to create one method named as printStudentInfo which can accept the name, course and marks of the student as parameters.
  // - This method will accept three things from anonymous window and will print the information, based on the marks we need to give the grade (Distinction class, First class, Second class, Pass class, Failed) to the students too.
  // Marks greater than 70 = Distinction
  // Marks between 60 and 70 = First Class
  // Marks between 50 and 60 = Second Class
  // Marks between 35 and 50 = Pass Class
  // Marks less than 35 = Failed
  // Hey, Jimmy! You have got distinction class in your IT course.
  // - Note : You can use the if ... else statement OR swtich statement as per your choice.

  // ===Example===
  // InstituteName: Salesforce University
  // Input: name = Jimmy, course = IT, marks = 99
  // Expected output:
  // Welcome to Salesforce University.
  // Hey, Jimmy! You have got distinction class in your IT course.
  // ===Example===
  // InstituteName: Salesforce University
  // Input: name = Karl, course = Science, marks = 60
  // Expected output:
  // Welcome to Salesforce University.
  // Hey, Jimmy! You have got first class in your Science course.

  public static void printStudentInfo(
    String name,
    String course,
    Integer marks
  ) {
    String grade = '';

    if (marks > 70) {
      grade = 'Distinction';
    } else if (marks < 70 && marks >= 60) {
      grade = 'First Class';
    } else if (marks < 60 && marks >= 50) {
      grade = 'Second Class';
    } else if (marks < 50 && marks >= 35) {
      grade = 'Pass Class';
    } else if (marks < 35 && marks >= 0) {
      grade = 'Failed';
    }

    System.debug(
      'Hey ' +
      name +
      '!' +
      ' You have got ' +
      grade +
      ' class in your ' +
      course +
      ' course.'
    );
  }
}

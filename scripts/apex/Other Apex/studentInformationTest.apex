StudentInformation stInfo1 = new StudentInformation('james@mail.com', 'Jimmy', '189898989898');
StudentInformation stInfo2 = new StudentInformation('kames@mail.com', 'Kimmy', '289898989898');
StudentInformation stInfo3 = new StudentInformation('names@mail.com', 'Nimmy', '389898989898');
StudentInformation stInfo4 = new StudentInformation('lames@mail.com', 'Limmy', '489898989898');
List<StudentInformation> stIn = new List<StudentInformation>();

stIn.add(stInfo1);
stIn.add(stInfo2);
stIn.add(stInfo3);
stIn.add(stInfo4);

ShowStudentInformation.showStudentInfo(stIn);
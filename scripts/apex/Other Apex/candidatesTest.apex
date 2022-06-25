Candidates candidate = new Candidates();

Candidates.companyName = 'SoftInnovas';
candidate.name = 'Jerry';
candidate.gender = 'Male';
Candidates.companyName += ' Inc';
Candidates.printCandidateInfo();

candidate.printCandidate();

candidate.name = 'Elaine';
candidate.gender = 'Female';

Candidates.companyName = 'Amazon';

candidate.printCandidate();

Candidates.printCandidateInfo();// calling a static method with the class name.

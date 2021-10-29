# Student Grades Smart Contract

## Use cases

- [done] We need to store student grades by a hash based on the student ID, and the corresponding grade
- [done] The Teacher should be the only only that can submit a grade
- [done] We should emit an event with the student hash every time a grade is submitted
- [done] Anyone can check a student grade by providing the corresponding ID
- [done] Anyone can request a grade revision for a given student ID, we should emit an event notifying the requested revision. We must keep a record of the student IDs that request the revisions
- [done] The teacher should be able to get the list of student IDs that requested revisions
- [in progress] We must implement test to validate the contract

## Data example

| STUDENT | ID | GRADE |
| ----------- | ----------- | ----------- |
Marcos |    77755N    |      5
Joan   |    12345X    |      9
Maria  |    02468T    |      2
Marta  |    13579U    |      3
Alba   |    98765Z    |      5

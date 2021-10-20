pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract Grades {
    address teacher;
    mapping(bytes32 => uint256) studentGrades;
    string[] studentsForRevision;

    event GradeSubmitted(bytes32 studentId);
    event RevisionRequested(string studentId);

    constructor() public {
        teacher = msg.sender;
    }

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only teacher can perform this action");
        _;
    }

    function submitGrade(string memory studentId, uint256 grade)
        public
        onlyTeacher
    {
        bytes32 studentHash = keccak256(abi.encodePacked(studentId));
        studentGrades[studentHash] = grade;
        emit GradeSubmitted(studentHash);
    }

    function viewGrade(string memory studentId) public view returns (uint256) {
        bytes32 studentHash = keccak256(abi.encodePacked(studentId));
        return studentGrades[studentHash];
    }

    function requestGradeRevision(string memory studentId) public {
        studentsForRevision.push(studentId);
        emit RevisionRequested(studentId);
    }

    function getRevisionsRequested()
        public
        view
        onlyTeacher
        returns (string[] memory)
    {
        return (studentsForRevision);
    }
}

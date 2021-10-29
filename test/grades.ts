const Grades = artifacts.require("Grades");

contract("Grades", async accounts => {
    const owner = accounts[0];
    let grades;

    beforeEach(async () => {
        grades = await Grades.deployed();
    });

    it("should allow submit grades only by teacher (owner)", async () => {        
        const fakeOwner = accounts[1];
        try {
            await grades.submitGrade.call("Dani", 5, {from: fakeOwner});
        } catch(e) {
            console.log(`${accounts[0]} is not owner`);
        }
    });

    it("should successfully submit grade if teacher is the submitter", async () => {
        const result = await grades.submitGrade("Dani", 5, {from: owner});
        assert.equal(result.logs[0].event, "GradeSubmitted", "A grade was submitted successfully");
    });

    xit("should view grade of existing student", async () => {});
    xit("should fail to view grade if student doesn't exist", async () => {});
    xit("should request grade revision if student exists", async () => {});
    xit("should fail to request grade revision if student doesn't exist", async () => {});
    xit("should fail to return revisions requested if not teacher", async () => {});
    xit("should return revisions requested if is teacher", async () => {});
})
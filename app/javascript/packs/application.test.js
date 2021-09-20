const rewire = require("rewire")
const application = rewire("./application")
const closeNav = application.__get__("closeNav")
// @ponicode
describe("closeNav", () => {
    test("0", () => {
        let callFunction = () => {
            closeNav()
        }
    
        expect(callFunction).not.toThrow()
    })
})

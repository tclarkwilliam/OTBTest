import Quick
import Nimble

@testable import OTBTest

class WebServiceSpec: QuickSpec {
  override func spec() {

    var subject: WebService!
    var mockDataTask: MockDataTask!
    var mockSession: MockSession!
    var resource: Resource<String>!
    var url: URL!

    beforeEach {
      mockDataTask = MockDataTask()
      mockSession = MockSession(dataTask: mockDataTask)
      subject = WebService(session: mockSession)
      url = URL(string: "url/path")
      resource = Resource<String>(url: url) {
        json in
        let dictionary = json as? [String: String]
        return dictionary?["key"]
      }
    }

    describe("load") {

      beforeEach {
        subject.load(resource) { _ in }
      }

      it("sends the correct url") {
        expect(mockDataTask.url).to(equal(url))
      }
      
    }


    describe("completion") {

      context("success") {

        it("returns a result") {
          waitUntil { done in
            subject.load(resource) {
              result, error in
              expect(result).toNot(beNil())
              expect(error).to(beNil())
              done()
            }
            let jsonString = "{\"key\":\"value\"}"
            let data = jsonString.data(using: .utf8)
            mockSession.completionHandler?(data, nil, nil)
          }
        }

      }

      context("failure") {

        it("returns an error") {
          waitUntil { done in
            subject.load(resource) {
              result, error in
              expect(error).toNot(beNil())
              expect(result).to(beNil())
              done()
            }
            let error = NSError(domain: "", code: 0, userInfo: nil)
            mockSession.completionHandler?(nil, nil, error)
          }
        }

      }

    }

  }
}

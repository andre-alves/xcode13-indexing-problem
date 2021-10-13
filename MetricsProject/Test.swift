import Alamofire

struct Test {
    func foobar() {
        let manager = SessionManager()
        manager.startRequestsImmediately = false
    }
}

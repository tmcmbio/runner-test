import Hummingbird

public struct Server {
    let hostname: String = "127.0.0.1"
    let port: Int = 8080
    
    public init() {}
    
    public func make(onCode: @escaping (String) -> Void) -> Task<Void, any Error> {
        let router = Router()
        router.get("hello") { _, _ in
            onCode("hello")
            return HTTPResponse.Status.ok
        }

        let app = Application(
            router: router,
            configuration: .init(address: .hostname(hostname, port: port))
        )
        
        let task = Task {
            try await app.runService()
        }

        return task
    }
}

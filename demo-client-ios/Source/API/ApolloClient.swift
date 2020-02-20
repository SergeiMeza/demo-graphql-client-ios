import Foundation
import Apollo

// MARK: - LollipopApollo
class LollipopApollo {
  static var shared = LollipopApollo()

  private static let baseUrl: String = {
      return "api.lpp.pw"
  }()

  private let baseUrl: String = {
      return "api.lpp.pw"
  }()

  private static let defaultHeaders: [AnyHashable: Any] = [
    "Lollipop-App-OS": "iOS",
    "Lollipop-App-Version": UIApplication.shared.version ?? "1.0",
    "Lollipop-App-Build": UIApplication.shared.buildNumber ?? "0"
  ]

  private let defaultHeaders: [AnyHashable: Any] = [
    "Lollipop-App-OS": "iOS",
    "Lollipop-App-Version": UIApplication.shared.version ?? "1.0",
    "Lollipop-App-Build": UIApplication.shared.buildNumber ?? "0"
  ]

  lazy var httpNetworkTransport: HTTPNetworkTransport! = createHTTPNetworkTransport()

  private func createHTTPNetworkTransport() -> HTTPNetworkTransport {
    return HTTPNetworkTransport(
      url: URL(string: "https://" + baseUrl + "/v1/graphql")!
    )
  }
  
  private func connectingPayload() -> GraphQLMap {
    guard let token = token else {
      return [:]
    }
    return ["LOLLIPOP-AUTH": "Bearer \(token)"]
  }

  private(set) lazy var client: ApolloClient = {
    return ApolloClient(
      networkTransport: httpNetworkTransport
    )
  }()

  private var token: String?

  static func login(token: String) {
    guard token.count > 0 else { return }
    LollipopApollo.shared.token = token
  }

  static func logout() {
    LollipopApollo.shared.token = nil
  }
}

// MARK: - Pre-flight delegate

extension LollipopApollo: HTTPNetworkTransportPreflightDelegate {
  func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
    return true
  }

  func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
    var headers = request.allHTTPHeaderFields ?? [String: String]()
    if let token = token {
      headers["Lollipop-Auth"] = "Bearer \(token)"
    }
    request.allHTTPHeaderFields = headers
  }
}

// MARK: - Task Completed Delegate

extension LollipopApollo: HTTPNetworkTransportTaskCompletedDelegate {
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        didCompleteRawTaskForRequest request: URLRequest,
                        withData data: Data?,
                        response: URLResponse?,
                        error: Error?) {
    // use this to debug and remove double requests!
//    Logger.log("Graphql request done!")

    if let error = error {
      print("Error: \(error)")
    }

    if let _ = response {
      //      Logger.log("Response: \(response)")
    } else {
      // Server down?
//      Logger.log("No URL Response received!")
    }

    if let _ = data {
      //      Logger.log("Data: \(String(describing: String(bytes: data, encoding: .utf8)))")
    } else {
//      Logger.log("No data received!")
    }
  }
}

// MARK: - Retry Delegate

extension LollipopApollo: HTTPNetworkTransportRetryDelegate {
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        receivedError error: Error,
                        for request: URLRequest,
                        response: URLResponse?,
                        retryHandler: @escaping (_ shouldRetry: Bool) -> Void) {
    print("Check how to decide if Apollo should retry request: (Error)", error)
    if let token = token, token.count > 0 {
      DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
        retryHandler(true)
      }
    }
    //    // Check if the error and/or response you've received are something that requires authentication
    //    guard UserManager.shared.requiresReAuthentication(basedOn: error, response: response) else {
    //      // This is not something this application can handle, do not retry.
    //      shouldRetry(false)
    //    }
    //
    //    // Attempt to re-authenticate asynchronously
    //    UserManager.shared.reAuthenticate { success in
    //      // If re-authentication succeeded, try again. If it didn't, don't.
    //      shouldRetry(success)
    //    }
  }
}

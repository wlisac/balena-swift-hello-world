import Dispatch
import Foundation

print("Hello from Swift 👋")

// Setup shutdown handlers to handle SIGINT and SIGTERM
// https://www.balena.io/docs/reference/base-images/base-images/#how-the-images-work-at-runtime
let signalQueue = DispatchQueue(label: "shutdown")

func makeSignalSource(_ code: Int32) {
    let source = DispatchSource.makeSignalSource(signal: code, queue: signalQueue)
    source.setEventHandler {
        source.cancel()
        print()
        print("Goodbye")
        exit(0)
    }
    source.resume()
    signal(code, SIG_IGN)
}

makeSignalSource(SIGTERM)
makeSignalSource(SIGINT)

// If the application is running on balena,
// start the main run loop so that the application doesn't quit.
//
// Otherwise the container will be repeatedly restarted by balena.
// https://www.balena.io/docs/learn/develop/runtime
if ProcessInfo.processInfo.environment["BALENA"] == "1" {
    RunLoop.main.run()
}

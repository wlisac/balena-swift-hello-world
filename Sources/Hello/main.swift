import Foundation

print("Hello from Swift 👋")

// If the application is running on balena,
// start the main run loop so that the application doesn't quit.
//
// Otherwise the container will be repeatedly restarted by balena.
// https://www.balena.io/docs/learn/develop/runtime
//
if ProcessInfo.processInfo.environment["BALENA"] == "1" {
    RunLoop.main.run()
}

# Swift on Balena – Hello, world! 👋 

<p>
    <img src="https://img.shields.io/badge/Swift-5.1-orange.svg" />
    <img src="https://img.shields.io/badge/architectures-ARMv6 | ARMv7 | ARMv8-lightgray.svg" />
    <a href="https://twitter.com/wlisac"><img src="https://img.shields.io/badge/twitter-@wlisac-blue.svg" /></a>
    <a href="https://launchpass.com/swift-arm"><img src="https://img.shields.io/badge/slack-swift--arm-purple.svg" /></a>
</p>

This is a sample project that shows how to run [Swift](http://swift.org) on Raspberry Pi and other ARM devices using Docker images from [Swift on Balena](https://github.com/wlisac/swift-on-balena).

## Getting Started

You can build and run this sample [Swift Package Manager](https://github.com/apple/swift-package-manager) app in a Docker container by using [Docker](https://www.docker.com) or by using [BalenaCloud](https://www.balena.io).

### Using Docker

If you want to use Docker directly, the first step is to [install Docker on your Raspberry Pi](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/). You can do this by running a single command in a terminal on your Raspberry Pi.

```bash
$ curl -sSL https://get.docker.com | sh
```

> Note: If you don't have a Raspberry Pi or other ARM device available, you can still follow the steps below using [Docker Desktop](https://docs.docker.com/docker-for-mac/install/) on your Mac. Docker on macOS uses QEMU to emulate ARM architectures and can be used to build and run many ARM based Docker containers.

Once Docker is installed, clone this project to your Raspberry Pi and navigate to the `balena-swift-hello-world` directory.

```bash
$ git clone https://github.com/wlisac/balena-swift-hello-world.git
$ cd balena-swift-hello-world
```

Build and tag a new Docker image using [`docker build`](https://docs.docker.com/engine/reference/commandline/build/).

> Note: Depending on your device type, you may need to use a different `Dockerfile`. The command below is using `Dockerfile.raspberrypi3` for Raspberry Pi 3 devices. `Dockerfile`s for other devices are included in this example project.

```bash
$ docker build -t balena-swift-hello-world -f Dockerfile.raspberrypi3 .
```

Now you can run the newly built Docker image using [`docker run`](https://docs.docker.com/engine/reference/commandline/run/).

```bash
$ docker run -it --rm balena-swift-hello-world
```

That's it! You just built and ran a Swift app in a Docker container on ARM! You should see the output below in your terminal.

```bash
Hello from Swift 👋
```

### Using BalenaCloud

Balena makes it easy to develop, deploy, and run Docker containers on Raspberry Pi and other IoT devices.

If you don't already have an account setup, [this tutorial](https://www.balena.io/docs/learn/getting-started/raspberrypi3/rust/) is a great place to start. 

Once you've setup a new application and provisioned a device, you can deploy this Swift project instead of the Rust program shown in the tutorial. The steps are almost the same!

When you're ready to deploy, clone this project and navigate to the `balena-swift-hello-world` directory.

```bash
$ git clone https://github.com/wlisac/balena-swift-hello-world.git
$ cd balena-swift-hello-world
```

Add balena as a new git remote. You can find this in the top-right corner of your balena application page.

```
git remote add balena <USERNAME>@git.balena-cloud.com:<USERNAME>/<APPNAME>.git
```

Now you can deploy this Swift project to all of the devices in your application with one command.

```
git push balena master
```

You'll know the Docker container has been built when you see a unicorn in your terminal! 🦄

Once your device(s) have downloaded and started the Docker container, you should see some logs from the Swift app.

```bash
Hello from Swift 👋
```

Congrats! You now have a Swift app running in a Docker container on a Raspberry Pi using balena.

## Next Steps

### Swift, Docker, and Balena
- Learn more about [Swift on Balena](https://github.com/wlisac/swift-on-balena) Docker images.
- Take a deeper dive into creating a [Dockerfile for balena](https://www.balena.io/docs/learn/develop/dockerfile/).
- Check out [balena's local mode](https://www.balena.io/docs/learn/develop/local-mode/) for a rapid local development workflow.

### Community Projects
There is so much you can do with Swift on ARM. Try out some of these community projects to see what's possible.

- Use Swift to control sensors with [SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO) and [SwiftyLinkerKit](https://github.com/SwiftyLinkerKit/SwiftyLinkerKit).
- Use Swift to communicate over Bluetooth with [BluetoothLinux](https://github.com/PureSwift/BluetoothLinux).
- Send messages over MQTT using [Perfect-Mosquitto](https://github.com/PerfectlySoft/Perfect-Mosquitto)

Join the Swift on ARM community in the [swift-arm](https://launchpass.com/swift-arm) Slack channel.
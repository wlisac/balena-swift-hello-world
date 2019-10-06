# Dockerfile for Raspberry Pi 3

# The build container for building the Swift app from source
FROM wlisac/raspberrypi3-swift:5.1-build AS build

WORKDIR /app

COPY . ./

RUN swift build --jobs 1

# The run container that will go to devices
FROM wlisac/raspberrypi3-swift:5.1-run

WORKDIR /app

COPY --from=build /app/.build/debug/Hello .

CMD ["./Hello"]

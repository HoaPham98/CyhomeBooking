# CyhomeBooking SDK

A CyhomeBooking SDK built with Flutter for iOS

## Installation

```
pod 'CyhomeBooking', :git => 'https://github.com/HoaPham98/CyhomeBooking.git', :tag => '0.0.1'
```

## Usage
```swift
    // create settings for sdk
    let setting = Settings(isSandbox: true, accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ODE4OCwidHlwZSI6IlJFU0lERU5UIiwiaWF0IjoxNjE3MjUyNDQ2LCJleHAiOjE2NDg4MTAwNDZ9.dsksruyj0z5HSLTpFUefohI8Oanad9tLJWB3XshwJ0g",
                               language: "vi",
                               unitGroupId: 21,
                               unitId: 7095)
    // create sdk instance
    let booking = CyhomeBooking(setting: setting)
    // present list amenities on current viewcontroller
    booking.presentListAmenities(on: self)
```
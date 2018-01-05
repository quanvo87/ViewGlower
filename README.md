# ViewGlower

<p align="center">
  <img src="ViewGlower/Assets/demo.gif" width="369" title="View Glower">
</p>

Make any `UIView` glow ✨

<!--[![CI Status](http://img.shields.io/travis/quanvo87/ViewGlower.svg?style=flat)](https://travis-ci.org/quanvo87/ViewGlower)-->
[![Version](https://img.shields.io/cocoapods/v/ViewGlower.svg?style=flat)](http://cocoapods.org/pods/ViewGlower)
[![License](https://img.shields.io/cocoapods/l/ViewGlower.svg?style=flat)](http://cocoapods.org/pods/ViewGlower)
[![Platform](https://img.shields.io/cocoapods/p/ViewGlower.svg?style=flat)](http://cocoapods.org/pods/ViewGlower)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Swift 4

## Installation

ViewGlower is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ViewGlower'
```

## Usage

Import the framework:

```swift
import ViewGlower
```

Initialize an instance of `ViewGlower`:

```swift
class ViewController: UIViewController {
    let viewGlower = ViewGlower()

    ...
}
```

Pass it a `UIView`:

```swift
let barButton: UIBarButtonItem!
let button: UIButton!

...

viewGlower.glow(barButton.customView)

viewGlower.glow(button.imageView)
```

> Note: Calling `glow()` in `viewDidLoad()` does not work.

#### Customize

```swift
func glow(_ view: UIView?,
	  color: UIColor = UIColor.white,
	  from: CGFloat = 0,
	  to: CGFloat = 0.9,
	  duration: CFTimeInterval = 1,
	  shouldRepeat: Bool = true)
```

#### Stop glowing

```swift
func stopGlowing(_ view: UIView?)
```

## Acknowledgements

Modified from [https://github.com/thesecretlab/UIView-Glow](https://github.com/thesecretlab/UIView-Glow).

Icon in example from [https://www.shareicon.net/cute-emoticons-emoji-feelings-smileys-847494](https://www.shareicon.net/cute-emoticons-emoji-feelings-smileys-847494).

## Author

quanvo87, qvo1987@gmail.com

## License

ViewGlower is available under the MIT license. See the LICENSE file for more info.

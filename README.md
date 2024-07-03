# ShareLink for SwiftUI Example

This example demonstrates how to use `ShareLinkButton` in SwiftUI to share various types of data such as strings, URLs, images, data, attributed strings, and locations

## Requirements

- iOS 14.0+
- Swift 5.3+
- Xcode 12.0+

## Example Usage

This example demonstrates how to use the functionality provided by the [package](https://github.com/The-Igor/sharelink-for-swiftui). 

![ShareLinkButton Example](https://github.com/The-Igor/sharelink-for-swiftui/blob/main/img/sharelink_swiftui.jpeg)

## Usage

### Supported Types

The `ShareLinkButton` supports sharing the following types:
- `String`
- `URL`
- `UIImage`
- `Data`
- `NSAttributedString`
- `CLLocation`
- `UIActivityItemSource`

### Examples

Here are examples of how to use `ShareLinkButton` with various types of data.

#### Sharing a String

```swift
let sampleString = "This is a sample string to share."
ShareLinkButton(item: sampleString) {
    ButtonLabel(image: "square.and.arrow.up", text: "Share String", backgroundColor: .blue)
}
```

#### Sharing a URL

```swift
let sampleURL = URL(string: "https://www.apple.com")!
ShareLinkButton(item: sampleURL) {
    ButtonLabel(image: "square.and.arrow.up", text: "Share URL", backgroundColor: .green)
}
```

#### Sharing an Image

```swift
let sampleImage = UIImage(named: "vision")!
ShareLinkButton(item: sampleImage) {
    ButtonLabel(image: "square.and.arrow.up", text: "Share Image", backgroundColor: .orange)
}
```

#### Sharing Data

```swift
let sampleData = "Sample data".data(using: .utf8)!
ShareLinkButton(item: sampleData) {
    ButtonLabel(image: "square.and.arrow.up", text: "Share Data", backgroundColor: .purple)
}
```

#### Sharing an NSAttributedString

```swift
let sampleAttributedString = NSAttributedString(string: "Simple sample NSAttributedString", attributes: [
    .font: UIFont.systemFont(ofSize: 24),
    .foregroundColor: UIColor.red
])
ShareLinkButton(item: sampleAttributedString) {
    ButtonLabel(image: "square.and.arrow.up", text: "Share NSAttributedString", backgroundColor: .red)
}
```

#### Sharing a Location

```swift
let sampleLocation = CLLocation(latitude: 37.7749, longitude: -122.4194)
ShareLinkButton(item: sampleLocation) {
    ButtonLabel(image: "square.and.arrow.up", text: "Share Location", backgroundColor: .yellow, textColor: .blue)
}
```

#### Creating a Custom Activity Item Source

You can also create your own custom activity item sources.

```swift
class CustomActivityItemSource: NSObject, UIActivityItemSource {
    private let text: String
    
    init(text: String) {
        self.text = text
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return text
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return text
    }
}

ShareLinkButton(itemSource: CustomActivityItemSource(text: "Hello, world!")) {
    ButtonLabel(image: "square.and.arrow.up", text: "Share Custom Text", backgroundColor: .blue)
}
```

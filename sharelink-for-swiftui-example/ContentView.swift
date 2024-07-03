//
//  ContentView.swift
//  sharelink-for-swiftui-example
//
//  Created by Igor  on 03.07.24.
//
import SwiftUI
import CoreLocation
import sharelink_for_swiftui

struct ContentView: View {
    
    /// A sample string to share.
    let sampleString = "This is a sample string to share."
    
    /// A sample URL to share.
    let sampleURL = URL(string: "https://www.apple.com")!
    
    /// A sample image to share.
    let sampleImage = UIImage(named: "vision")!
    
    /// Sample data to share.
    let sampleData = "Sample data".data(using: .utf8)!
    
    /// A sample NSAttributedString to share.
    let sampleAttributedString = NSAttributedString(string: "Simple sample NSAttributedString", attributes: [
        .font: UIFont.systemFont(ofSize: 24),
        .foregroundColor: UIColor.red
    ])
    
    /// A sample location to share.
    let sampleLocation = CLLocation(latitude: 37.7749, longitude: -122.4194)
    
    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 20) {
                // Share String
                ShareLinkButton(item: sampleString) {
                    ButtonLabel(image: "square.and.arrow.up", text: "Share String", backgroundColor: .blue)
                }
                .accessibility(identifier: "Share String")
                
                // Share URL
                ShareLinkButton(item: sampleURL) {
                    ButtonLabel(image: "square.and.arrow.up", text: "Share URL", backgroundColor: .green)
                }
                .accessibility(identifier: "Share URL")
                
                // Share Image
                ShareLinkButton(item: sampleImage) {
                    ButtonLabel(image: "square.and.arrow.up", text: "Share Image", backgroundColor: .orange)
                }
                .accessibility(identifier: "Share Image")
                
                // Share Data
                ShareLinkButton(item: sampleData) {
                    ButtonLabel(image: "square.and.arrow.up", text: "Share Data", backgroundColor: .purple)
                }
                .accessibility(identifier: "Share Data")
                
                // Share NSAttributedString
                ShareLinkButton(item: sampleAttributedString) {
                    ButtonLabel(image: "square.and.arrow.up", text: "Share NSAttributedString", backgroundColor: .red)
                }
                .accessibility(identifier: "Share NSAttributedString")
                
                // Share Location
                ShareLinkButton(item: sampleLocation) {
                    ButtonLabel(image: "square.and.arrow.up", text: "Share Location", backgroundColor: .yellow, textColor: .blue)
                }
                .accessibility(identifier: "Share Location")
                
                // Share Custom Activity
                ShareLinkButton(itemSource: CustomActivityItemSource(text: "Hello, world!")) {
                    ButtonLabel(image: "square.and.arrow.up", text: "Share Custom Activity", backgroundColor: .blue)
                }
                .accessibility(identifier: "Share Custom Activity")
            }
            .padding()
        }
        .font(.title3)
    }
}

/// A custom button label view used for the share buttons.
fileprivate struct ButtonLabel: View {
    let image: String
    let text: String
    let backgroundColor: Color
    let textColor: Color
    
    /// Initializes the button label with image, text, background color, and optional text color.
    ///
    /// - Parameters:
    ///   - image: The system name of the image to display.
    ///   - text: The text to display on the button.
    ///   - backgroundColor: The background color of the button.
    ///   - textColor: The text color of the button. Default is white.
    init(image: String, text: String, backgroundColor: Color, textColor: Color = .white) {
        self.image = image
        self.text = text
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Spacer()
            Text(text)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .foregroundColor(textColor)
        .cornerRadius(10)
    }
}


//
//  CustomActivityItemSource.swift
//  sharelink-example
//
//  Created by Igor  on 02.07.24.
//

import UIKit
import LinkPresentation

/// A custom activity item source for providing shareable content.
final class CustomActivityItemSource: NSObject, UIActivityItemSource {
    // The item to be shared, which can be any type.
    let item: Any
    
    /// Initializes the item source with a text string.
    ///
    /// - Parameter text: The text to be shared.
    init(text: String) {
        self.item = text
    }
    
    /// Provides a placeholder item to display while the actual item is being prepared.
    ///
    /// - Parameter activityViewController: The activity view controller requesting the placeholder item.
    /// - Returns: The placeholder item, which in this case is the actual item itself.
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return item
    }
    
    /// Provides the actual item to be shared.
    ///
    /// - Parameters:
    ///   - activityViewController: The activity view controller requesting the item.
    ///   - activityType: The type of activity that is requesting the item.
    /// - Returns: The item to be shared, which in this case is the actual item itself.
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return item
    }
    
    /// Provides metadata for the link being shared.
    ///
    /// - Parameter activityViewController: The activity view controller requesting the metadata.
    /// - Returns: The metadata for the link, which includes the title if the item is a string.
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        
        // If the item is a string, set it as the title in the metadata.
        if let text = item as? String {
            metadata.title = text
        }
        
        return metadata
    }
}

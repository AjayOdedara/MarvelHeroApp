//
//  CachedMemoryManager.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import UIKit

class CachedMemoryManager {
    static let shared: CachedMemoryManager = CachedMemoryManager()
    private let imageCache: NSCache<NSString, UIImage>
    private init() {
        imageCache = NSCache<NSString, UIImage>()
    }
    func retrieveCachedImage(for key: String) -> UIImage? {
        return self.imageCache.object(forKey: key as NSString)
    }
    func cacheImage(_ image: UIImage, forKey key: String) {
        self.imageCache.setObject(image, forKey: key as NSString)
    }
    func isImageCached(for key: String) -> Bool {
        if self.retrieveCachedImage(for: key) != nil {
            return true
        }
        return false
    }
}

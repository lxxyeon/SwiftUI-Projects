//
//  Extension.swift
//  Project04 - VideoEffect
//
//  Created by leeyeon2 on 2021/12/01.
//

import Foundation
import CoreImage
import Metal

extension CVPixelBuffer {
    
    func makeMetalTexture(textureFormat: MTLPixelFormat,
                          textureCache: CVMetalTextureCache) -> MTLTexture? {

        let width = CVPixelBufferGetWidth(self)
        let height = CVPixelBufferGetHeight(self)

        var texture: CVMetalTexture?
        let status = CVMetalTextureCacheCreateTextureFromImage(
            kCFAllocatorDefault,
            textureCache,
            self,
            nil,
            textureFormat,
            width,
            height,
            0,
            &texture
        )

        guard status == kCVReturnSuccess,
              let cvTexture = texture,
              let metalTexture = CVMetalTextureGetTexture(cvTexture) else {
            return nil
        }

        return metalTexture
    }
}

extension CVMetalTextureCache {
    
    static func makeDefault(device: MTLDevice) -> CVMetalTextureCache? {
        
        var metalTextureCache: CVMetalTextureCache?
        
        let status = CVMetalTextureCacheCreate(
            kCFAllocatorDefault,
            nil,
            device,
            nil,
            &metalTextureCache
        )
        
        guard status == kCVReturnSuccess, let cache = metalTextureCache else {
            assertionFailure("Failed to allocate texture cache")
            return nil
        }
        
        return cache
    }
}

extension String: Identifiable {
    public var id: String {
        self
    }
}

extension URL: Identifiable {
    public var id: String {
        self.absoluteString
    }
}

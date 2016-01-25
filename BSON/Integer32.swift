//
//  Boolean.swift
//  BSON
//
//  Created by Joannis Orlandos on 23/01/16.
//  Copyright © 2016 Robbert Brandsma. All rights reserved.
//

import Foundation

extension Int32 : BSONElementConvertible {
    public var elementType: ElementType {
        return .Int32
    }
    
    public static func instantiate(bsonData data: [UInt8]) throws -> Int32 {
        guard data.count == 4 else {
            throw DeserializationError.InvalidElementSize
        }
        
        let integer = UnsafePointer<Int32>(data).memory
        return integer
    }
    
    public var bsonData: [UInt8] {
        var integer = self
        return withUnsafePointer(&integer) {
            Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>($0), count: sizeof(Int32)))
        }
    }
    
    public static let bsonLength = BsonLength.Fixed(length: 4)
}
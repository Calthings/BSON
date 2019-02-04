//
//  EmbeddedDocuments.swift
//  BSON
//
//  Created by Robbert Brandsma on 13-02-17.
//
//

import Foundation

fileprivate protocol NilTestable {
    var isNil: Bool { get }
}
extension Optional : NilTestable {
    var isNil : Bool {
        return self == nil
    }
}

extension Dictionary : Primitive  where Key == String, Value: Primitive  {
    private func errorOut() {
        let error = "Only [String : BSON.Primitive] dictionaries are BSON.Primitive. Tried to initialize a document using [\(Key.self) : \(Value.self)]. This will crash on debug and print this message on release configurations."
        assertionFailure(error)
        print(error)
    }
    
    public var typeIdentifier: UInt8 { return 0x03 }
    public func makeBinary() -> Data {
        let doc = Document(dictionaryElements: self.compactMap {
            let key: String = $0.0
            let value: Primitive = $0.1

            if let optional = value as? NilTestable, optional.isNil {
                return (key, nil)
            }
            
            return (key, value)
        })
        return doc.makeBinary()
    }
}

extension Array : Primitive where Element: Primitive {
    public var typeIdentifier: UInt8 { return 0x04 }
    public func makeBinary() -> Data {
        return Document(array: self).makeBinary()
    }
}

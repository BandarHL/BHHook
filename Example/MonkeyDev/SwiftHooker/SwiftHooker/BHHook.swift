//
//  BHHook.swift
//  BHHook
//
//  Created by Bandar Alruwaili on 14/02/2023.
//

import Foundation
import Runtime


public class BHHook: NSObject {
    
    /// The instance of the object to hook.
    private var hookedInstance: AnyObject?
    /// The class that the instance belongs to.
    private var hookedClass: AnyClass?
    
    /// An initializer for BHHook class.
    /// - Parameters:
    ///   - instance: The instance of the object to hook.
    ///   - _class:  The class that the instance belongs to.
    @objc init(instance: AnyObject, _class: AnyClass) {
        self.hookedInstance = instance
        self.hookedClass = _class
    }
    
    /// This function is used to hook an instance of a given class and set a value on a specific property of that instance.
    /// - Parameters:
    ///   - property: The name of a property.
    ///   - value: The value that is to be set on the property.
    @objc public func hook(property: String, value: Any) {
        if let hookedInstance = self.hookedInstance, let hookedClass = self.hookedClass {
            let rawPointer = bridgeRetained(obj: hookedInstance)
            var objInstnace = bridgeTransfer(ptr: rawPointer) as AnyObject
            
            do {
                let classInfo = try typeInfo(of: hookedClass)
                let _property = try classInfo.property(named: property)
                try _property.set(value: value, on: &objInstnace)
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("There is no class and instance to be hooked")
        }
    }
    
    /// This function is used to get the value of a property from an instance of a given class.
    /// - Parameter property: The name of a property
    /// - Returns: The value of the property.
    @objc public func getValue(property: String) -> AnyObject {
        if let hookedInstance = self.hookedInstance, let hookedClass = self.hookedClass {
            do {
                let classInfo = try typeInfo(of: hookedClass)
                let _property = try classInfo.property(named: property)
                return try _property.get(from: hookedInstance)
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("There is no class and instance to be hooked")
        }
    }
    
    /// This function is used to access the properties of a given class.
    /// - Parameter _class:  The class of which properties are to be retrieved.
    /// - Returns: An array of property names.
    @objc public static func getProperties(of _class: AnyClass) -> [String] {
        var names: [String] = []
        do {
            let classInfo = try typeInfo(of: _class)
            for prop in classInfo.properties {
                names.append(prop.name)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
        
        return names
    }
    
    /// This function is used to get the pointer of an any object.
    /// - Parameter obj: The instance of the object to bridge.
    /// - Returns: The pointer of the object instance
    private func bridgeRetained<T: AnyObject>(obj: T) -> UnsafeRawPointer {
        return UnsafeRawPointer(Unmanaged.passRetained(obj).toOpaque())
    }
    
    /// This function is used to get object instance from the pointer.
    /// - Parameter ptr: The pointer to bridge.
    /// - Returns: The instance of the pointer.
    private func bridgeTransfer<T: AnyObject>(ptr: UnsafeRawPointer) -> T {
        return Unmanaged<T>.fromOpaque(ptr).takeRetainedValue()
    }
}

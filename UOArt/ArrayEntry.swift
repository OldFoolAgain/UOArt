//Copyright © 2023 Charles Kerr. All rights reserved.

import Cocoa

class ArrayEntry : NSObject {
    @objc dynamic var index = 0
    var hasEntry = false
    @objc dynamic var color:NSColor {
        get{
            return hasEntry ? NSColor.systemBlue : NSColor.systemRed
        }
    }
}
extension ArrayEntry {
    convenience init(index:Int,hasEntry:Bool) {
        self.init()
        self.index = index
        self.hasEntry = hasEntry
    }
}

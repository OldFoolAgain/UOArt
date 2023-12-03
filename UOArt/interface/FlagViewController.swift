//Copyright © 2023 Charles Kerr. All rights reserved.

import Cocoa

class FlagViewController : NSViewController {
    
    @objc dynamic var information:WInformation?
    
    override var nibName: NSNib.Name? {
        return "FlagView"
    }
    
}

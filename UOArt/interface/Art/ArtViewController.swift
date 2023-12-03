//Copyright © 2023 Charles Kerr. All rights reserved.

import Cocoa
class ArtViewController : NSViewController {
    override var nibName: NSNib.Name? {
        return "ArtView"
    }
    
    @IBOutlet var flagController :FlagViewController!
    
    @IBOutlet var viewHolder : NSView!
    @IBOutlet var parentController: AllArtViewController!

    @IBOutlet var scrollView:NSScrollView!
    
    @objc dynamic var information:WArtInformation?
    @objc dynamic var informationObserver: NSKeyValueObservation!
    
    @objc dynamic var localImageView:NSImageView?
    deinit {
        informationObserver.invalidate()
    }
}

extension ArtViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flagController.view.frame = viewHolder.bounds
        viewHolder.addSubview(flagController.view)
        informationObserver = self.observe(\.information, options: .new){ (obj,change) in
            if (self.information != nil) {
                self.loadArtImage(tileID: self.parentController.currentIndex)
                self.flagController.information = self.information
            }
            else {
                self.scrollView.documentView = NSImageView()
                self.flagController.information = nil
            }
        }
    }
    
    func loadArtImage(tileID tile:Int) {
        guard let image = parentController.uoData.artImage(forTIleID: self.parentController.currentIndex) else {
            self.scrollView.documentView = NSImageView()
            return
        }
        localImageView = NSImageView(image: NSImage(cgImage: image, size: NSSize(width: image.width, height: image.height)))
        
        localImageView!.frame = NSRect(origin: CGPoint(x: 0.0, y: 0.0), size: NSSize(width: image.width, height: image.height))
        self.scrollView.documentView = localImageView
    }
    
    
}

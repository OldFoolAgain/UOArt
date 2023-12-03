//Copyright © 2023 Charles Kerr. All rights reserved.

import Cocoa
class TerrainViewController : NSViewController {
    override var nibName: NSNib.Name? {
        return "TerrainView"
    }
    @IBOutlet var flagController :FlagViewController!
    @IBOutlet var textureView : NSImageView!
    @IBOutlet var terrainView : NSImageView!
    @IBOutlet var viewHolder : NSView!
    @IBOutlet var parentController: AllTerViewController!
    
    @objc dynamic var information:WTerrainInformation?
    
    @objc dynamic var informationObserver: NSKeyValueObservation!
    @objc dynamic var textureObserver: NSKeyValueObservation!

    deinit {
        informationObserver.invalidate()
        textureObserver.invalidate()
    }
}

extension TerrainViewController  {
    //==========================================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        flagController.view.frame = viewHolder.bounds
        viewHolder.addSubview(flagController.view)
        informationObserver = self.observe(\.information, options: .new){ (obj,change) in
            if (self.information != nil) {
                self.loadTerrainImage(tileID: self.parentController.currentIndex)
                self.flagController.information = self.information
            }
            else {
                self.terrainView.image = NSImage()
                self.flagController.information = nil
            }
        }
        textureObserver = self.observe(\.information?.textureID, options: .new){ (obj,change) in
            if (self.information == nil){
                self.textureView.image = NSImage()
            }
            else {
                self.loadTextureImage(tileID: self.information!.textureID)
            }
        }
    }
    
    //==========================================================================================
    func loadTerrainImage(tileID tile:Int) {
        guard let image = parentController.uoData.terrainImage(forTileID: tile) else {
            terrainView.image = nil
            return
        }
        terrainView.image = NSImage(cgImage: image, size: NSSize(width: 64.0, height: 64.0))
    }
    //==========================================================================================
    func loadTextureImage(tileID tile:Int) {
        guard let image = parentController.uoData.texture.imageFor(tileID: tile) else {
            terrainView.image = nil
            return
        }
        textureView.image = NSImage(cgImage: image, size: NSSize(width: 128.0, height: 128.0))
    }
}

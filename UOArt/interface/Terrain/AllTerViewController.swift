//Copyright © 2023 Charles Kerr. All rights reserved.

import Cocoa

class AllTerViewController : NSViewController {
    override var nibName: NSNib.Name? {
        return "AllTerView"
    }
    
    @IBOutlet var uoData:UOData!
    
    @IBOutlet var holderView:BaseView!
    @IBOutlet var viewController:TerrainViewController!
    
    @IBOutlet var arrayController:NSArrayController!
    @IBOutlet var tableView:NSTableView!

    @objc dynamic var currentIndex = 0 {
        
        didSet{
            if (currentIndex != arrayController.selectionIndex) {
                self.tableView.scrollRowToVisible(currentIndex)
                arrayController.setSelectionIndex(currentIndex)
            }
            // Now also reset all the data to the values
            viewController.information = self.uoData.terrainInformation(forTileID: currentIndex)

        }
    }


    @objc dynamic var selectionObserver: NSKeyValueObservation!
    
    deinit {
        selectionObserver.invalidate()
    }

}

extension AllTerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewController.view.frame = holderView.bounds
        
        holderView.addSubview(viewController.view)
        selectionObserver = arrayController.observe(\.selectionIndex, options: .new){ (obj,change) in
            if (self.currentIndex != self.arrayController.selectionIndex) {
                if (self.arrayController.selectionIndex >= self.uoData.terrainIndex.count) {
                    
                    // Do something?
                }
                else {
                    self.currentIndex = self.arrayController.selectionIndex
                }
                
            }
        }
    }
}

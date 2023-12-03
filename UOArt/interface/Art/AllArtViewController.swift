//Copyright © 2023 Charles Kerr. All rights reserved.

import Cocoa

class AllArtViewController : NSViewController {
    override var nibName: NSNib.Name? {
        return "AllArtView"
    }
    
    @IBOutlet var uoData:UOData!
    @IBOutlet var holderView:BaseView!
    
    @IBOutlet var viewController:ArtViewController!
    
    @IBOutlet var arrayController:NSArrayController!
    @IBOutlet var tableView:NSTableView!

    @objc dynamic var currentIndex:Int = 0{
        didSet{
            if (currentIndex != arrayController.selectionIndex) {
                self.tableView.scrollRowToVisible(currentIndex)
                arrayController.setSelectionIndex(currentIndex)
            }
            viewController.information = self.uoData.artInformation(forTileID: currentIndex)

        }
    }


    @objc dynamic var selectionObserver: NSKeyValueObservation!
    
    deinit {
        selectionObserver.invalidate()
    }
}
extension AllArtViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewController.view.frame = holderView.bounds
        
        holderView.addSubview(viewController.view)
        selectionObserver = arrayController.observe(\.selectionIndex, options: .new){ (obj,change) in
            if (self.currentIndex != self.arrayController.selectionIndex) {
                if (self.arrayController.selectionIndex >= self.uoData.artIndex.count) {
                    
                    // Do something?
                }
                else {
                    self.currentIndex = self.arrayController.selectionIndex
                }
                
            }
        }
   }
}

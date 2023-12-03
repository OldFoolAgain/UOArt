//
//  AppDelegate.swift
//  UOArt
//
//  Created by Charles Kerr on 12/2/23.
//

import Cocoa
@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    @IBOutlet var uoData: UOData!
    
    @IBOutlet var artController : AllArtViewController!
    @IBOutlet var artViewHolder : BaseView!
    @IBOutlet var terrainController : AllTerViewController!
    @IBOutlet var terrainViewHolder : BaseView!
    
    
    @IBOutlet var tempController : ArtViewController!
    
    @objc dynamic var uoDataLocation : URL?
    
    @IBAction func openDocument(_ sender:Any?){
        let panel = NSOpenPanel()
        if (uoDataLocation != nil) {
            panel.directoryURL = uoDataLocation
        }
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.prompt = "Set UO Data Location"
        panel.beginSheetModal(for: self.window.contentView!.window!) { response in
            if (response == .OK) {
                if (self.uoDataLocation != nil) {
                    self.uoDataLocation!.stopAccessingSecurityScopedResource()
                }
                self.uoDataLocation = panel.url
                UserDefaults.standard.setValue(self.uoDataLocation?.securityData, forKey: "UODATALOCATION")
                // Now reload the uo data!
                self.refreshData(nil)
            }
            
        }
    }
    
    @IBAction func refreshData(_ sender:Any?) {
        // Now reload the uo data!
        self.uoData.loadUOData(uoLocationURL: self.uoDataLocation)
        self.terrainController.currentIndex = 0
        self.artController.currentIndex = 0

    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        uoDataLocation = (UserDefaults.standard.object(forKey: "UODATALOCATION")as? Data)?.securityBookmark
        if (uoDataLocation != nil){
            _ = uoDataLocation?.startAccessingSecurityScopedResource()
        }
        // Place our views
        
        artController.view.frame = artViewHolder.bounds
        terrainController.view.frame = terrainViewHolder.bounds
        artViewHolder.addSubview(artController.view)
        terrainViewHolder.addSubview(terrainController.view)
        self.refreshData(nil)

    
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}


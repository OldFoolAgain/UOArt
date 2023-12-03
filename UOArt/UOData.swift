//Copyright © 2023 Charles Kerr. All rights reserved.

import Cocoa

class UOData : NSObject {
    
    @IBOutlet var terrainArrayController : NSArrayController!
    @IBOutlet var artArrayController : NSArrayController!
    
    var artwork = Artwork()
    var texture = Texture()
    var info = TileInformation()

    //wrappers
    @objc dynamic var terrainIndex = [ArrayEntry]()
    @objc dynamic var artIndex = [ArrayEntry]()
    
}

extension UOData {
    //=======================================================================================
    func clearObject() {
        terrainIndex = [ArrayEntry]()
        artIndex = [ArrayEntry]()
        artwork = Artwork()
        texture = Texture()
        info = TileInformation()
    }
    //=======================================================================================
    func loadUOData(uoLocationURL url:URL?) {
        self.clearObject()
        guard url != nil else {
            // We need to refresh selection, or else the "information" panes may be stale
            return
        }
        artwork = Artwork(uoURL: url!)
        texture = Texture(uoURL: url!)
        info = TileInformation(uoURL: url!)
        var temp = [ArrayEntry]()
        for index in 0..<info.terrainInfo.count {
            temp.append(ArrayEntry(index: index, hasEntry: !artwork.terrainData[index].isEmpty))
        }
        terrainIndex = temp
        temp = [ArrayEntry]()
        for index in 0..<info.artInfo.count {
            temp.append(ArrayEntry(index: index, hasEntry: !artwork.artData[index].isEmpty))
        }
        artIndex = temp
    
        // We need to check the images! and refresh the selection!
        
    }
    //=======================================================================================
    func terrainImage(forTileID tileid:Int) -> CGImage? {
        guard tileid >= 0 && tileid < 0x4000 else {
            return nil
        }
        return artwork.terrainImage(forData: artwork.terrainData(forTileID: tileid))
    }
    // ==============================================================
    func artImage(forTIleID tileid:Int) -> CGImage? {
        guard tileid >= 0 && tileid <= 0xFFFF else {
            return nil
        }
        return artwork.artImage(forData: artwork.artData(forTileID: tileid ))
    }
    // ==============================================================
    func terrainInformation(forTileID tileid:Int) -> WTerrainInformation {
        guard tileid >= 0 && tileid < info.terrainInfo.count else  {
            return WTerrainInformation()
        }
        return WTerrainInformation(terrainInfo: info.terrainInfo[tileid])
    }
    
    //===================================================================================
    func artInformation(forTileID tileid:Int) -> WArtInformation {
        
        guard tileid >= 0 && tileid < info.artInfo.count else {
            return WArtInformation()
        }
        return WArtInformation(artInfo: info.artInfo[tileid])
    }
}

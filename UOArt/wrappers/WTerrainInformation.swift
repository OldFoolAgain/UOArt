//Copyright © 2023 Charles Kerr. All rights reserved.

import Cocoa

class WTerrainInformation : NSObject {
    
    static override func keyPathsForValuesAffectingValue(forKey key: String) -> Set<String> {
        var keypaths = super.keyPathsForValuesAffectingValue(forKey: key)
        switch key {
            case "flag":
                TileFlagBitType.TILEFLAGNAME.forEach { value in
                    keypaths.insert(value)
                }
            case _ where TileFlagBitType.TILEFLAGNAME.contains(key):
                keypaths.insert("flag")
            default:
                break
        }
        return keypaths
    }
    
    var information : TerrainInformation = TerrainInformation()
    
    @objc dynamic var name : String {
        get {
            return information.name
        }
        set {
            information.name = newValue
        }
    }
    @objc dynamic var flag : UInt64  {
        get {
            return information.flag
        }
        set {
            information.flag = newValue
        }
    }
    
    @objc dynamic var textureID : Int  {
        get {
            return information.textureID
        }
        set {
            information.textureID = newValue
        }
    }
    
}
extension WTerrainInformation : WInformation {
    convenience init(terrainInfo: TerrainInformation) {
        self.init()
        information = terrainInfo
    }
    
    @objc dynamic var background:Bool {
        get {
            return (flag & (UInt64(1)<<0)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<0)
            }
            else {
                flag &= ~(UInt64(1)<<0)
            }
        }
    }
    @objc dynamic var weapon:Bool {
        get {
            return (flag & (UInt64(1)<<1)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<1)
            }
            else {
                flag &= ~(UInt64(1)<<1)
            }
        }
    }
    @objc dynamic var transparent:Bool {
        get {
            return (flag & (UInt64(1)<<2)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<2)
            }
            else {
                flag &= ~(UInt64(1)<<2)
            }
        }
    }
    @objc dynamic var translucent:Bool {
        get {
            return (flag & (UInt64(1)<<3)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<3)
            }
            else {
                flag &= ~(UInt64(1)<<3)
            }
        }
    }
    @objc dynamic var wall:Bool {
        get {
            return (flag & (UInt64(1)<<4)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<4)
            }
            else {
                flag &= ~(UInt64(1)<<4)
            }
        }
    }
    @objc dynamic var damaging:Bool {
        get {
            return (flag & (UInt64(1)<<5)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<5)
            }
            else {
                flag &= ~(UInt64(1)<<5)
            }
        }
    }
    @objc dynamic var impassable:Bool {
        get {
            return (flag & (UInt64(1)<<6)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<6)
            }
            else {
                flag &= ~(UInt64(1)<<6)
            }
        }
    }
    @objc dynamic var wet:Bool {
        get {
            return (flag & (UInt64(1)<<7)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<7)
            }
            else {
                flag &= ~(UInt64(1)<<7)
            }
        }
    }
    @objc dynamic var bit8:Bool {
        get {
            return (flag & (UInt64(1)<<8)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<8)
            }
            else {
                flag &= ~(UInt64(1)<<8)
            }
        }
    }
    @objc dynamic var surface:Bool {
        get {
            return (flag & (UInt64(1)<<9)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<9)
            }
            else {
                flag &= ~(UInt64(1)<<9)
            }
        }
    }
    @objc dynamic var climbable:Bool {
        get {
            return (flag & (UInt64(1)<<10)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<10)
            }
            else {
                flag &= ~(UInt64(1)<<10)
            }
        }
    }
    @objc dynamic var stackable:Bool {
        get {
            return (flag & (UInt64(1)<<11)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<11)
            }
            else {
                flag &= ~(UInt64(1)<<11)
            }
        }
    }
    @objc dynamic var window:Bool {
        get {
            return (flag & (UInt64(1)<<12)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<12)
            }
            else {
                flag &= ~(UInt64(1)<<12)
            }
        }
    }
    @objc dynamic var noShoot:Bool {
        get {
            return (flag & (UInt64(1)<<13)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<13)
            }
            else {
                flag &= ~(UInt64(1)<<13)
            }
        }
    }
    @objc dynamic var articleA:Bool {
        get {
            return (flag & (UInt64(1)<<14)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<14)
            }
            else {
                flag &= ~(UInt64(1)<<14)
            }
        }
    }
    @objc dynamic var articleAn:Bool {
        get {
            return (flag & (UInt64(1)<<15)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<15)
            }
            else {
                flag &= ~(UInt64(1)<<15)
            }
        }
    }
    @objc dynamic var articleThe:Bool {
        get {
            return (flag & (UInt64(1)<<16)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<16)
            }
            else {
                flag &= ~(UInt64(1)<<16)
            }
        }
    }
    @objc dynamic var foilage:Bool {
        get {
            return (flag & (UInt64(1)<<17)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<17)
            }
            else {
                flag &= ~(UInt64(1)<<17)
            }
        }
    }
    @objc dynamic var partialHue:Bool {
        get {
            return (flag & (UInt64(1)<<18)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<18)
            }
            else {
                flag &= ~(UInt64(1)<<18)
            }
        }
    }
    @objc dynamic var noHouse:Bool {
        get {
            return (flag & (UInt64(1)<<19)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<19)
            }
            else {
                flag &= ~(UInt64(1)<<19)
            }
        }
    }
    @objc dynamic var map:Bool {
        get {
            return (flag & (UInt64(1)<<20)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<20)
            }
            else {
                flag &= ~(UInt64(1)<<20)
            }
        }
    }
    @objc dynamic var container:Bool {
        get {
            return (flag & (UInt64(1)<<21)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<21)
            }
            else {
                flag &= ~(UInt64(1)<<21)
            }
        }
    }
    @objc dynamic var wearable:Bool {
        get {
            return (flag & (UInt64(1)<<22)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<22)
            }
            else {
                flag &= ~(UInt64(1)<<22)
            }
        }
    }
    @objc dynamic var lightSource:Bool {
        get {
            return (flag & (UInt64(1)<<23)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<23)
            }
            else {
                flag &= ~(UInt64(1)<<23)
            }
        }
    }
    @objc dynamic var animated:Bool {
        get {
            return (flag & (UInt64(1)<<24)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<24)
            }
            else {
                flag &= ~(UInt64(1)<<24)
            }
        }
    }
    @objc dynamic var hoverOver:Bool {
        get {
            return (flag & (UInt64(1)<<25)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<25)
            }
            else {
                flag &= ~(UInt64(1)<<25)
            }
        }
    }
    @objc dynamic var noDiagnol:Bool {
        get {
            return (flag & (UInt64(1)<<26)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<26)
            }
            else {
                flag &= ~(UInt64(1)<<26)
            }
        }
    }
    @objc dynamic var armor:Bool {
        get {
            return (flag & (UInt64(1)<<27)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<27)
            }
            else {
                flag &= ~(UInt64(1)<<27)
            }
        }
    }
    @objc dynamic var roof:Bool {
        get {
            return (flag & (UInt64(1)<<28)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<28)
            }
            else {
                flag &= ~(UInt64(1)<<28)
            }
        }
    }
    @objc dynamic var door:Bool {
        get {
            return (flag & (UInt64(1)<<29)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<29)
            }
            else {
                flag &= ~(UInt64(1)<<29)
            }
        }
    }
    @objc dynamic var stairBack:Bool {
        get {
            return (flag & (UInt64(1)<<30)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<30)
            }
            else {
                flag &= ~(UInt64(1)<<30)
            }
        }
    }
    @objc dynamic var stairRight:Bool {
        get {
            return (flag & (UInt64(1)<<31)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<31)
            }
            else {
                flag &= ~(UInt64(1)<<31)
            }
        }
    }
    @objc dynamic var alphaBlend:Bool {
        get {
            return (flag & (UInt64(1)<<32)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<32)
            }
            else {
                flag &= ~(UInt64(1)<<32)
            }
        }
    }
    @objc dynamic var useNewArt:Bool {
        get {
            return (flag & (UInt64(1)<<33)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<33)
            }
            else {
                flag &= ~(UInt64(1)<<33)
            }
        }
    }
    @objc dynamic var artUsed:Bool {
        get {
            return (flag & (UInt64(1)<<34)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<34)
            }
            else {
                flag &= ~(UInt64(1)<<34)
            }
        }
    }
    @objc dynamic var bit35:Bool {
        get {
            return (flag & (UInt64(1)<<35)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<35)
            }
            else {
                flag &= ~(UInt64(1)<<35)
            }
        }
    }
    @objc dynamic var noShadow:Bool {
        get {
            return (flag & (UInt64(1)<<36)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<36)
            }
            else {
                flag &= ~(UInt64(1)<<36)
            }
        }
    }
    @objc dynamic var pixelBleed:Bool {
        get {
            return (flag & (UInt64(1)<<37)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<37)
            }
            else {
                flag &= ~(UInt64(1)<<37)
            }
        }
    }
    @objc dynamic var playAnimOnce:Bool {
        get {
            return (flag & (UInt64(1)<<38)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<38)
            }
            else {
                flag &= ~(UInt64(1)<<38)
            }
        }
    }
    @objc dynamic var bit39:Bool {
        get {
            return (flag & (UInt64(1)<<39)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<39)
            }
            else {
                flag &= ~(UInt64(1)<<39)
            }
        }
    }
    @objc dynamic var bit40:Bool {
        get {
            return (flag & (UInt64(1)<<40)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<40)
            }
            else {
                flag &= ~(UInt64(1)<<40)
            }
        }
    }
    @objc dynamic var bit41:Bool {
        get {
            return (flag & (UInt64(1)<<41)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<41)
            }
            else {
                flag &= ~(UInt64(1)<<41)
            }
        }
    }
    @objc dynamic var bit42:Bool {
        get {
            return (flag & (UInt64(1)<<42)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<42)
            }
            else {
                flag &= ~(UInt64(1)<<42)
            }
        }
    }
    @objc dynamic var bit43:Bool {
        get {
            return (flag & (UInt64(1)<<43)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<43)
            }
            else {
                flag &= ~(UInt64(1)<<43)
            }
        }
    }
    @objc dynamic var bit44:Bool {
        get {
            return (flag & (UInt64(1)<<44)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<44)
            }
            else {
                flag &= ~(UInt64(1)<<44)
            }
        }
    }
    @objc dynamic var bit45:Bool {
        get {
            return (flag & (UInt64(1)<<45)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<45)
            }
            else {
                flag &= ~(UInt64(1)<<45)
            }
        }
    }
    @objc dynamic var bit46:Bool {
        get {
            return (flag & (UInt64(1)<<46)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<46)
            }
            else {
                flag &= ~(UInt64(1)<<46)
            }
        }
    }
    @objc dynamic var bit47:Bool {
        get {
            return (flag & (UInt64(1)<<47)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<47)
            }
            else {
                flag &= ~(UInt64(1)<<47)
            }
        }
    }
    @objc dynamic var bit48:Bool {
        get {
            return (flag & (UInt64(1)<<48)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<48)
            }
            else {
                flag &= ~(UInt64(1)<<48)
            }
        }
    }
    @objc dynamic var bit49:Bool {
        get {
            return (flag & (UInt64(1)<<49)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<49)
            }
            else {
                flag &= ~(UInt64(1)<<49)
            }
        }
    }
    @objc dynamic var bit50:Bool {
        get {
            return (flag & (UInt64(1)<<50)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<50)
            }
            else {
                flag &= ~(UInt64(1)<<50)
            }
        }
    }
    @objc dynamic var bit51:Bool {
        get {
            return (flag & (UInt64(1)<<51)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<51)
            }
            else {
                flag &= ~(UInt64(1)<<51)
            }
        }
    }
    @objc dynamic var bit52:Bool {
        get {
            return (flag & (UInt64(1)<<52)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<52)
            }
            else {
                flag &= ~(UInt64(1)<<52)
            }
        }
    }
    @objc dynamic var bit53:Bool {
        get {
            return (flag & (UInt64(1)<<53)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<53)
            }
            else {
                flag &= ~(UInt64(1)<<53)
            }
        }
    }
    @objc dynamic var bit54:Bool {
        get {
            return (flag & (UInt64(1)<<54)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<54)
            }
            else {
                flag &= ~(UInt64(1)<<54)
            }
        }
    }
    @objc dynamic var bit55:Bool {
        get {
            return (flag & (UInt64(1)<<55)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<55)
            }
            else {
                flag &= ~(UInt64(1)<<55)
            }
        }
    }
    @objc dynamic var bit56:Bool {
        get {
            return (flag & (UInt64(1)<<56)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<56)
            }
            else {
                flag &= ~(UInt64(1)<<56)
            }
        }
    }
    @objc dynamic var bit57:Bool {
        get {
            return (flag & (UInt64(1)<<57)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<57)
            }
            else {
                flag &= ~(UInt64(1)<<57)
            }
        }
    }
    @objc dynamic var bit58:Bool {
        get {
            return (flag & (UInt64(1)<<58)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<58)
            }
            else {
                flag &= ~(UInt64(1)<<58)
            }
        }
    }
    @objc dynamic var bit59:Bool {
        get {
            return (flag & (UInt64(1)<<59)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<59)
            }
            else {
                flag &= ~(UInt64(1)<<59)
            }
        }
    }
    @objc dynamic var bit60:Bool {
        get {
            return (flag & (UInt64(1)<<60)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<60)
            }
            else {
                flag &= ~(UInt64(1)<<60)
            }
        }
    }
    @objc dynamic var bit61:Bool {
        get {
            return (flag & (UInt64(1)<<61)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<61)
            }
            else {
                flag &= ~(UInt64(1)<<61)
            }
        }
    }
    @objc dynamic var bit62:Bool {
        get {
            return (flag & (UInt64(1)<<62)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<62)
            }
            else {
                flag &= ~(UInt64(1)<<62)
            }
        }
    }
    @objc dynamic var bit63:Bool {
        get {
            return (flag & (UInt64(1)<<63)) != 0
        }
        set {
            if newValue {
                flag |= (UInt64(1)<<63)
            }
            else {
                flag &= ~(UInt64(1)<<63)
            }
        }
    }
}

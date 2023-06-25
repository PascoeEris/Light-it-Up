import UIKit

// MARK: - Enums
enum Color {
    case red
    case green
    case blue
    case none
}

enum LightMode{
    case on
    case off
}

enum SolarStatus {
    case charging
    case discharged
}

// MARK: - Protocols
protocol LightSource {
    var color: Color { get set }
    var mode: LightMode { get set }
}

protocol SolarPowerable{
    var solarPowerStatus: SolarStatus { get set }
    func startSolarCharge()
    func stopSolarCharge()
}

// MARK: - Classes
class SolarLight: LightSource, SolarPowerable{
    var color: Color
    var mode: LightMode
    var solarPowerStatus: SolarStatus
    
    init(color: Color, mode: LightMode, solarPowerStatus: SolarStatus){
        self.color = color
        self.mode = mode
        self.solarPowerStatus = solarPowerStatus
    }
    
    func startSolarCharge(){
        self.solarPowerStatus = .charging
        print("Solar panel is now charging")
    }
    
    func stopSolarCharge(){
        self.solarPowerStatus = .discharged
        print("Solar panel stopped charging")
    }
}

// MARK: - Global Function
func lightTheNight(light: LightSource){
    if light.mode == .on{
        print("Lighting the night with \(light.color)")
    }
    else{
        print("Night is dark")
    }
}

// MARK: - ViewController
class ViewController: UIViewController {
    
    // MARK: - Properties
    var solarLight: SolarLight
    
    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.solarLight = SolarLight(color: .blue, mode: .off, solarPowerStatus: .discharged)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        solarLight.startSolarCharge()
    }
}
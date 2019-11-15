//
//  bluetoothCentre.swift
//  BluetoothDemo
//
//  Created by Akshay Mehra on 14/10/2019.
//  Copyright © 2019 Akshay Mehra. All rights reserved.
//

import Foundation
import CoreBluetooth
protocol RFID {
    func rfidCode(rfid : String)
}
class BluetoothCentre :NSObject{
    
    var abc = [Character]()
    var manager = CBCentralManager()
    var smartBowPeripheral : CBPeripheral?
    var rfid = String()
    var delegateRFID : RFID?
    static var shared = BluetoothCentre()
    private override init() {
        super.init()
        manager.delegate = self
    }
}
extension BluetoothCentre : CBCentralManagerDelegate,CBPeripheralDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state {
        case .poweredOff:
            print( "Bluetooth on this device is currently powered off.")
        case .unsupported:
            print( "This device does not support Bluetooth Low Energy.")
        case .unauthorized:
            print( "This app is not authorized to use Bluetooth Low Energy.")
        case .resetting:
            print("The BLE Manager is resetting; a state update is pending.")
        case .unknown:
            print("The state of the BLE Manager is unknown.")
        case .poweredOn:
            print( "Bluetooth LE is turned on and ready for communication.")
            //Initiate Scan for Peripherals
            //Option 1: Scan for all devices
            //manager.scanForPeripherals(withServices: nil, options: nil)
            //Option 2: Scan for devices that have the service you're interested in...
            let sensorTagAdvertisingUUID = CBUUID(string: "00001101-0000-1000-8000-00805F9B34FB")//"725F8937-7F98-96E5-C54F-B48A18AD68B9")
            print("Scanning for SensorTag adverstising with UUID: \(sensorTagAdvertisingUUID)")
            manager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if peripheral.name == "ELD2000647176"{
            manager.connect(peripheral, options: [:])
            smartBowPeripheral = peripheral
        }
    }
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        smartBowPeripheral = peripheral
        manager.stopScan()
        smartBowPeripheral?.delegate = self
        smartBowPeripheral?.discoverServices(nil)
    }
    //Peripheral delegates
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
        if let services = peripheral.services {
            for service in services {
                smartBowPeripheral?.discoverCharacteristics(nil, for: service)
            }
        }
    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            // 1
            for characteristic in characteristics {
                smartBowPeripheral?.setNotifyValue(true, for: characteristic)
            }
        }
    }
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        
        if characteristic.uuid == CBUUID(string:"FF01"){
            for i in characteristic.value! {
                var char = Character(UnicodeScalar(i))
                abc.append(char)
                print(abc)
            }
            rfid = String(abc)
            
            delegateRFID?.rfidCode(rfid: rfid)
        }
    }
    
 
}

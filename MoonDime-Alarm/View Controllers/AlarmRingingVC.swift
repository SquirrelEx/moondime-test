//
//  AlarmRingingVC.swift
//  WakeUpAt
//
//  Created by Gaurav Bidalia on 7/22/22.
//  Copyright © 2022 Gaurav Bidalia. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AudioToolbox
import web3swift
import BigInt

class AlarmRingingVC: UIViewController {
    
    // MARK:- Declarations
    
    var didLayoutSubviews = false
    
    // AppDelegate
    var alarmRingingManager: AlarmRingingManager!
    
    // Injected
    var alarm: Alarm!
    
    // IBOutlets
    @IBOutlet weak var messageAndDistanceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var alarmNameLabel: UILabel!
    
    // MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        alarmRingingManager = appDelegate.alarmRingingManager
        
        let distance = LocationManager.getDistanceWithUnit(value: Float(alarm.distance))
        struct Wallet {
            let address: String
            let data: Data
            let name: String
            let isHD: Bool
        }

        struct HDKey {
            let name: String?
            let address: String
        }
        let password = "DoesitWork"
        let myABIString = "[{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"initialSupply\",\"type\":\"uint256\"}],\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"},{\"indexed\":false,\"internalType\":\"uint256\",\"name\":\"value\",\"type\":\"uint256\"}],\"name\":\"Approval\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"previousOwner\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"newOwner\",\"type\":\"address\"}],\"name\":\"OwnershipTransferred\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"indexed\":false,\"internalType\":\"uint256\",\"name\":\"value\",\"type\":\"uint256\"}],\"name\":\"Transfer\",\"type\":\"event\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"}],\"name\":\"allowance\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"approve\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"balanceOf\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"decimals\",\"outputs\":[{\"internalType\":\"uint8\",\"name\":\"\",\"type\":\"uint8\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"subtractedValue\",\"type\":\"uint256\"}],\"name\":\"decreaseAllowance\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"addedValue\",\"type\":\"uint256\"}],\"name\":\"increaseAllowance\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"mint\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"name\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"owner\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"renounceOwnership\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"symbol\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"totalSupply\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"transfer\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"transferFrom\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"newOwner\",\"type\":\"address\"}],\"name\":\"transferOwnership\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]"
        let key = "eb1fb181ec1ea1d66ca0870825554114bd16cbb05bc927482a587526be4eda8b" // Some private key
        let formattedKey = key.trimmingCharacters(in: .whitespacesAndNewlines)
        let dataKey = Data.fromHex(formattedKey)!
        let keystore = try! EthereumKeystoreV3(privateKey: dataKey, password: password)!
        let name = "ForMoonDime"
        let keyData = try! JSONEncoder().encode(keystore.keystoreParams)
        let address = keystore.addresses!.first!.address
        let wallet = Wallet(address: address, data: keyData, name: name, isHD: false)
        let data = wallet.data
        let keystoreManager: KeystoreManager
        if wallet.isHD {
            let keystore = BIP32Keystore(data)!
            keystoreManager = KeystoreManager([keystore])
        } else {
            let keystore = EthereumKeystoreV3(data)!
            keystoreManager = KeystoreManager([keystore])
        }
        
        let endpoint = "https://goerli.infura.io/v3/8a0ed175d2ee4f4fb8751f9a0e5b9e89"
        let web3 = web3(provider: Web3HttpProvider(URL(string: endpoint)!)!)
        
        let walletb = " "
        // precompiled Infura provider
        web3.addKeystoreManager(keystoreManager)
        let coldWalletAddress = EthereumAddress("0x770d0a50F512cdF200a2a4620AA30bDbA66986F9")!
        let contractAddress = EthereumAddress("0x1635aA89DcAc324B6D3e3549B83AdAaD15c409BF", ignoreChecksum: true)!
        let walletAddress = EthereumAddress(wallet.address)! // Your wallet address
        let exploredAddress = EthereumAddress("0xFe536B605fEB34351e5Ed8efE6e47795bd17092c")! // Address which balance we want to know. Here we used same wallet address
        let erc20ContractAddress = EthereumAddress("0x1635aA89DcAc324B6D3e3549B83AdAaD15c409BF")!
        web3.transactionOptions.from = walletAddress
        web3.transactionOptions.chainID = 5
        let value: String = "0.0" // Any amount of Ether you need to send
        let contractMethod = "mint" // Contract method you want to write
        let value2: String = "1.0"
        let amount2 = Web3.Utils.parseToBigUInt(value2, units: .eth)
        let value3: String = "0.003"
        let amount3 = Web3.Utils.parseToBigUInt(value3, units: .eth)
        let abiVersion = 2 // Contract ABI version
        let extraData: Data = Data() // Extra data for contract method
        let contract = web3.contract(myABIString, at: contractAddress, abiVersion: abiVersion)!
        let amount = Web3.Utils.parseToBigUInt(value, units: .eth)
        var options = TransactionOptions.defaultOptions
        options.value = amount
        options.from = walletAddress
        options.gasPrice = .automatic
        options.gasLimit = .automatic
        let tx = contract.write(
        contractMethod,
        parameters: [exploredAddress, amount2] as [AnyObject],
        extraData: extraData,
        transactionOptions: options)!
        let tokenBalance = try! tx.send(password:"DoesitWork", transactionOptions: options)
        /*let method = "balanceOf"
        let tx = contract.read(
            method,
            parameters: [exploredAddress] as [AnyObject],
            extraData: Data(),
            transactionOptions: options)!
        let tokenBalance = try! tx.call()
        let balanceBigUInt = tokenBalance["0"] as! BigUInt*/
        //web3.eth.sendETH(from: walletAddress, to: exploredAddress, amount: "0.0003")
        let balanceResult = try! web3.eth.getBalance(address: exploredAddress)
        let balanceString = Web3.Utils.formatToEthereumUnits(balanceResult, toUnits: .eth, decimals: 3)!
        
        //let balanceSend = try! web3.eth.sendTransaction(EthereumTransaction, transactionOptions: options, password:"DoesitWork")
        
        var options2 = TransactionOptions.defaultOptions
        
        options2.value = amount3
        options2.from = walletAddress
        options2.gasPrice = .automatic
        options2.gasLimit = .manual(3000000)
        //let estimatedGasResult = web3.contract(Web3.Utils.coldWalletABI, at: exploredAddress)!.method(options: options2)!.estimateGas()
        //guard case .success(let estimatedGas)? = estimatedGasResult else {return}
        //options2.gasLimit = estimatedGas
        let contract2 = web3.contract(Web3.Utils.coldWalletABI, at: exploredAddress, abiVersion: 2)!
        let tx3 = contract2.write(
        "fallback",
        parameters: [AnyObject](),
        extraData: Data(),
        transactionOptions: options2)!
        
        let transSuc =  try! tx3.send(password:"DoesitWork", transactionOptions: options2)
        print(transSuc)
        messageAndDistanceLabel.text = "Distance: \(distance) Wallet Balance: \(balanceString) "
        locationLabel.text = alarm.details
        alarmNameLabel.text = alarm.name
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !didLayoutSubviews {
            didLayoutSubviews = true
            makeViewCircular(view: imageView)
            addPulseToView(view: imageView)
        }
    }
    
    // MARK:- Actions
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        alarmRingingManager.stopRinging(for: alarm)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Helpers
    
    func makeViewCircular(view: UIView) {
        //view.layer.borderWidth = 2
        //view.layer.borderColor = UIColor.blue.cgColor
        view.layer.cornerRadius = view.frame.size.width / 2;
        view.clipsToBounds = true
    }
    
    func addPulseToView(view: UIView) {
        let pulse = PulsingLayer(numberOfPulses: Float.infinity, radius: view.frame.width, position: view.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = UIColor.blue.cgColor
        self.view.layer.insertSublayer(pulse, below: view.layer)
    }
    
}


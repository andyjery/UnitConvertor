//
//  ViewController.swift
//  UnitConvertor
//
//  Created by Jerry Chen on 2016/11/22.
//  Copyright © 2016年 Jerry Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var calculationCollectionView: UICollectionView!
    @IBOutlet weak var calculationCollectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    
    @IBOutlet weak var calculationProcessLabel: UILabel!
    
    var displayCalculation:String!
    var displayCalculationArray:[String] = []
    var getAnswer:String!
    var selectedTableIndicator:String = "left"
    
    var viewHightFlag:Bool = false
    
    let numbersCharSet:NSCharacterSet = NSCharacterSet(charactersIn: "0123456789")
    let operatorsCharSet:NSCharacterSet = NSCharacterSet(charactersIn: "÷x-+()")
    let pointCharSet:NSCharacterSet = NSCharacterSet(charactersIn: ".")
    var allowAddPoint = true
    var allowMultiZero = false
    var isSingleZero = false
    var numberSigne = true
    
    var tempUnitStructArray:[UnitStruct]!
    var selectedCategory:String = "distance"
    var selectedTableViewIndex:IndexPath!
    
    var unitObjects = UnitObjects().unitObjects
    lazy var imageArray:[String] =
    {
        var array:[String] = []
        for i in 1...19
        {
            array.append("\(i)-2")
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        calculationCollectionView.backgroundColor = UIColor.lightGray
        calculationCollectionView.delegate = self
        calculationCollectionView.dataSource = self
        
        leftTableView.estimatedRowHeight = 44
        leftTableView.contentInset = UIEdgeInsets(top: (leftTableView.frame.height/2 - leftTableView.estimatedRowHeight/2), left: 0, bottom: (leftTableView.frame.height/2 - leftTableView.estimatedRowHeight/2), right: 0)

        leftTableView.dataSource = self
        leftTableView.delegate = self
        
        rightTableView.estimatedRowHeight = 44
        rightTableView.contentInset = UIEdgeInsets(top: (rightTableView.frame.height/2 - rightTableView.estimatedRowHeight/2), left: 0, bottom: (rightTableView.frame.height/2 - rightTableView.estimatedRowHeight/2), right: 0)
        
        rightTableView.dataSource = self
        rightTableView.delegate = self
        
        tempUnitStructArray = UnitRecord(inputValue: "0", selectedIndex: 0).distance()
        
        self.view.addSubview(calculationCollectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.unitObjects.count

    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath ) as! CollectionViewCell
        cell.cellImageView.image = UIImage(named: imageArray[indexPath.row])
        cell.cellLabelView.adjustsFontSizeToFitWidth = true
        cell.cellLabelView.text = unitObjects[indexPath.row].unitObjectName
        
        cell.cellImageView.layer.borderColor = UIColor.white.cgColor;
        cell.cellImageView.layer.borderWidth = 3;
        cell.cellImageView.layer.cornerRadius = 3;
        cell.cellImageView.clipsToBounds = true;
        cell.backgroundColor = UIColor.lightGray

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(unitObjects[indexPath.row].unitObjectName)
        selectedCategory = unitObjects[indexPath.row].unitObjectName
        self.selectedTableViewIndex = IndexPath(row: 0, section: 0)
    
        selectUnitStructArray(selectedCategory: selectedCategory)
        rightTableView.scrollToRow(at: selectedTableViewIndex, at: UITableViewScrollPosition.middle, animated: true)
        leftTableView.scrollToRow(at: selectedTableViewIndex, at: UITableViewScrollPosition.middle, animated: true)
    }
    
    @IBAction func testButton(_ sender: UIButton) {
        
        if viewHightFlag
        {
            
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 1) {
                self.calculationCollectionViewHeightConstraint.constant = 80
                self.calculationCollectionView.setNeedsUpdateConstraints()
                self.calculationCollectionView.updateConstraintsIfNeeded()
                self.view.layoutIfNeeded()
            }
            viewHightFlag = false
        }else{
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 1, animations: {
                self.calculationCollectionViewHeightConstraint.constant = 180
                self.calculationCollectionView.setNeedsUpdateConstraints()
                self.calculationCollectionView.updateConstraintsIfNeeded()
                self.view.layoutIfNeeded()
            })
            viewHightFlag = true
        }
    }
    
//MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempUnitStructArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        switch selectedTableIndicator {
        case "left":
            if tableView == leftTableView
            {
                let cellLeft = tableView.dequeueReusableCell(withIdentifier: "LeftCell", for: indexPath) as! LeftTableViewCell
                cellLeft.unitNameLabel.text = tempUnitStructArray[indexPath.row].fullName
                cellLeft.unitValueLabel.text = (self.getAnswer ?? "0") + " " + tempUnitStructArray[indexPath.row].symbolName
                cell = cellLeft
            }else if tableView == rightTableView{
                let cellRight = tableView.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath) as! RightTableViewCell
                cellRight.unitNameLabel.text = tempUnitStructArray[indexPath.row].fullName
                cellRight.unitValueLabel.text = tempUnitStructArray[indexPath.row].outputValue + " " + tempUnitStructArray[indexPath.row].symbolName
                cell = cellRight
            }
        case "right":
            if tableView == leftTableView
            {
                let cellLeft = tableView.dequeueReusableCell(withIdentifier: "LeftCell", for: indexPath) as! LeftTableViewCell
                cellLeft.unitNameLabel.text = tempUnitStructArray[indexPath.row].fullName
                cellLeft.unitValueLabel.text = tempUnitStructArray[indexPath.row].outputValue + " " + tempUnitStructArray[indexPath.row].symbolName
                cell = cellLeft
            }else if tableView == rightTableView{
                let cellRight = tableView.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath) as! RightTableViewCell
                cellRight.unitNameLabel.text = tempUnitStructArray[indexPath.row].fullName
                cellRight.unitValueLabel.text = (self.getAnswer ?? "0") + " " + tempUnitStructArray[indexPath.row].symbolName
                cell = cellRight
            }

        default:
            break
        }
                return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: true)
        self.selectedTableViewIndex = indexPath
        switch tableView {
        case leftTableView:
            selectUnitStructArray(selectedCategory: selectedCategory)
            selectedTableIndicator = "left"

        case rightTableView:
            selectUnitStructArray(selectedCategory: selectedCategory)
            selectedTableIndicator = "right"

        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    
    
//MARK: CalculationKeyboardButtons
    
    @IBAction func calculatorButtons(_ sender: UIButton) {
        
        if let identifyString = sender.titleLabel?.text
        {
            switch  identifyString{
            case "0":
                if displayCalculationArray.isEmpty
                {
                    displayCalculationArray.append("0")
                    allowMultiZero = false
                    isSingleZero = true
                }else if displayCalculationArray[displayCalculationArray.count - 1].rangeOfCharacter(from: operatorsCharSet as CharacterSet) != nil {
                    displayCalculationArray.append("0")
                    allowMultiZero = false
                    isSingleZero = true
                }
                if allowMultiZero
                {
                    displayCalculationArray[displayCalculationArray.count - 1].append("0")
                }
                
            case "1","2","3","4","5","6","7","8","9":
                if displayCalculationArray.isEmpty
                {
                    displayCalculationArray.append(identifyString)
                    allowMultiZero = true
                } else if  displayCalculationArray[displayCalculationArray.count - 1] == ")" {
                    print("numbers can not be followed by \")\"")
                } else {
                    if isSingleZero
                    {
                        displayCalculationArray[displayCalculationArray.count - 1] = identifyString
                        isSingleZero = false
                    }else{
                        displayCalculationArray[displayCalculationArray.count - 1].rangeOfCharacter(from: operatorsCharSet as CharacterSet) != nil ? displayCalculationArray.append(identifyString) : displayCalculationArray[displayCalculationArray.count - 1].append(identifyString)
                    }
                     allowMultiZero = true
                }
                
            case ".":
                if displayCalculationArray.isEmpty || displayCalculationArray[displayCalculationArray.count - 1].isEmpty
                {
                    print("the first Character can not be \".\"")
                    allowAddPoint = false
                }else{
                    let testStirng:String = displayCalculationArray[displayCalculationArray.count - 1]
                    let charSet = NSCharacterSet(charactersIn: ".")
                    testStirng.rangeOfCharacter(from: charSet as CharacterSet) == nil && testStirng.rangeOfCharacter(from: numbersCharSet as CharacterSet) != nil ? allowAddPoint = true : (allowAddPoint = false)
                }
                if allowAddPoint
                {
                    displayCalculationArray[displayCalculationArray.count - 1].append(identifyString)
                    allowMultiZero = true
                    isSingleZero = false
                }else{
                    print("the \".\" is only followed by numbers and only single one in one number")
                }
                
            case "+/-":
                if displayCalculationArray.isEmpty || displayCalculationArray[displayCalculationArray.count - 1].rangeOfCharacter(from: numbersCharSet as CharacterSet) == nil
                {
                    print("There is no number to be signed number")
                }else if displayCalculationArray[displayCalculationArray.count - 1].rangeOfCharacter(from: numbersCharSet as CharacterSet) != nil{
                    if numberSigne
                    {
                        displayCalculationArray[displayCalculationArray.count - 1].insert("-", at: displayCalculationArray[displayCalculationArray.count - 1].startIndex)
                        numberSigne = false
                    }else{
                        displayCalculationArray[displayCalculationArray.count - 1] = displayCalculationArray[displayCalculationArray.count - 1].replacingOccurrences(of: "-", with: "")
                        numberSigne = true
                    }
                }
                
            case "DIV", "X", "-", "+":
                if displayCalculationArray.isEmpty || displayCalculationArray[displayCalculationArray.count - 1].isEmpty
                {
                    print("Operators can not be the first charater or no numbers right before itself")
                }else if displayCalculationArray[displayCalculationArray.count - 1] == ")" || displayCalculationArray[displayCalculationArray.count - 1].rangeOfCharacter(from: numbersCharSet as CharacterSet) != nil {
                    displayCalculationArray.append(stringConverter(inputString: identifyString))
                    isSingleZero = false
                }else{
                    print("Operators can not be the first charater or no numbers right before itself")
                }
                
            case "Back":
                if displayCalculationArray.isEmpty
                {
                    print ("the String is empty")
                }else if displayCalculationArray[displayCalculationArray.count - 1].rangeOfCharacter(from: numbersCharSet as CharacterSet) != nil{
                    displayCalculationArray[displayCalculationArray.count - 1].remove(at: displayCalculationArray[displayCalculationArray.count - 1].index(before: displayCalculationArray[displayCalculationArray.count - 1].endIndex))
                    if displayCalculationArray[displayCalculationArray.count - 1] == "0"
                    {
                        isSingleZero = true
                    }
                    if displayCalculationArray[displayCalculationArray.count - 1].isEmpty
                    {
                        displayCalculationArray.removeLast(1)
                    }
                }else{
                    displayCalculationArray.removeLast(1)
                }
                
            case "(":
                if displayCalculationArray.isEmpty
                {
                    displayCalculationArray.append(identifyString)
                }else if displayCalculationArray[displayCalculationArray.count - 1].rangeOfCharacter(from: numbersCharSet as CharacterSet) == nil && (displayCalculationArray[displayCalculationArray.count - 1] != ")"){
                    displayCalculationArray.append(identifyString)
                }else{
                    print("there is no operators right before itself or not the first place")
                }
                
            case ")":
                if displayCalculationArray.isEmpty || displayCalculationArray[displayCalculationArray.count - 1].rangeOfCharacter(from: operatorsCharSet as CharacterSet) != nil
                {
                    if  displayCalculationArray[displayCalculationArray.count - 1] == ")"
                    {
                        displayCalculationArray.append(")")
                    }else{
                        print("Operators can not be the first charater or no numbers right before itself")
                    }
                }else if !displayCalculationArray.isEmpty || displayCalculationArray[displayCalculationArray.count - 1].rangeOfCharacter(from: numbersCharSet as CharacterSet) != nil{
                    displayCalculationArray.append(")")
                }
                
            case "AC":
                displayCalculationArray.removeAll()
                
            default: break
            }
            
            displayCalculation == nil ? displayCalculation = "" : displayCalculation.removeAll()
            if displayCalculationArray.isEmpty
            {
                print("Stirng is empty")
            }else{
                for stackString:String in displayCalculationArray
                {
                    print(stackString)
                    displayCalculation! += stackString
                }
            }
            print(displayCalculationArray)
            print(Calculator(infix: displayCalculationArray).toPostfix())
            getAnswer = Calculator(infix: displayCalculationArray).getAnswer()
            print(self.getAnswer)
            calculationProcessLabel.text = displayCalculation
            
            leftTableView.reloadData()
            rightTableView.reloadData()
        }
    }
 
    func stringConverter( inputString:String ) -> String
    {
        switch inputString {
        case "DIV":
            return "÷"
        case "X":
            return "x"
        case "+":
            return "+"
        case "-":
            return "-"
        default: break
        }
        return ""
    }
    
    func selectUnitStructArray(selectedCategory:String)
    {
        let unitRecord = UnitRecord(inputValue: self.getAnswer ?? "0", selectedIndex: self.selectedTableViewIndex.row)
        switch selectedCategory {
        case "distance":
            self.tempUnitStructArray = unitRecord.distance()
        case "area":
            self.tempUnitStructArray = unitRecord.area()
        case "volume":
            self.tempUnitStructArray = unitRecord.volume()
        case "mass":
            self.tempUnitStructArray = unitRecord.mass()
        case "angle":
            self.tempUnitStructArray = unitRecord.angle()
        case "acceleration":
            self.tempUnitStructArray = unitRecord.acceleration()
        case "concentration":
            self.tempUnitStructArray = unitRecord.concentration()
        case "dispersion":
            self.tempUnitStructArray = unitRecord.dispersion()
        case "duration":
            self.tempUnitStructArray = unitRecord.duration()
        case "charge":
            self.tempUnitStructArray = unitRecord.charge()
        case "current":
            self.tempUnitStructArray = unitRecord.current()
        case "voltage":
            self.tempUnitStructArray = unitRecord.voltage()
        case "resistance":
            self.tempUnitStructArray = unitRecord.resistance()
        case "energy":
            self.tempUnitStructArray = unitRecord.energy()
        case "frequency":
            self.tempUnitStructArray = unitRecord.frequency()
        case "power":
            self.tempUnitStructArray = unitRecord.power()
        case "pressure":
            self.tempUnitStructArray = unitRecord.pressure()
        case "speed":
            self.tempUnitStructArray = unitRecord.speed()
        case "temperature":
            self.tempUnitStructArray = unitRecord.temperature()
            
        default:
            break
        }
        leftTableView.reloadData()
        rightTableView.reloadData()
    }
    
}


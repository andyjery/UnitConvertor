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
    
    var selectedIndexPath:IndexPath!
    var displayCalculation:String!
    var displayCalculationArray:[String] = []
    var getAnswer:String!
    
    var viewHightFlag:Bool = false
    
    let numbersCharSet:NSCharacterSet = NSCharacterSet(charactersIn: "0123456789")
    let operatorsCharSet:NSCharacterSet = NSCharacterSet(charactersIn: "÷x-+()")
    let pointCharSet:NSCharacterSet = NSCharacterSet(charactersIn: ".")
    var allowAddPoint = true
    var allowMultiZero = false
    var isSingleZero = false
    var numberSigne = true
    
    let tempObjectArray = UnitRecord().distance(inputValue: "0")
    
    lazy var imageArray:[String] =
    {
        var array:[String] = []
        for i in 1...20
        {
            array.append("\(i)-2")
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        calculationCollectionView.backgroundColor = UIColor.black
       
        calculationCollectionView.delegate = self
        calculationCollectionView.dataSource = self
        
        selectedIndexPath = IndexPath(row: 0, section: 0)
        
        leftTableView.estimatedRowHeight = 44
        leftTableView.contentInset = UIEdgeInsets(top: (leftTableView.frame.height/2 - leftTableView.estimatedRowHeight/2), left: 0, bottom: (leftTableView.frame.height/2 - leftTableView.estimatedRowHeight/2), right: 0)

        leftTableView.dataSource = self
        leftTableView.delegate = self
        
        rightTableView.estimatedRowHeight = 44
        rightTableView.contentInset = UIEdgeInsets(top: (rightTableView.frame.height/2 - rightTableView.estimatedRowHeight/2), left: 0, bottom: (rightTableView.frame.height/2 - rightTableView.estimatedRowHeight/2), right: 0)
        
        rightTableView.dataSource = self
        rightTableView.delegate = self
        
        self.view.addSubview(calculationCollectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count

    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath ) as! CollectionViewCell
        cell.cellImageView.image = UIImage(named: imageArray[indexPath.row])
        
        cell.cellImageView.layer.borderColor = UIColor.white.cgColor;
        cell.cellImageView.layer.borderWidth = 3;
        cell.cellImageView.layer.cornerRadius = 3;
        cell.cellImageView.clipsToBounds = true;
        cell.backgroundColor = UIColor.black

        return cell
    }
    
    @IBAction func testButton(_ sender: UIButton) {
        
        if viewHightFlag
        {
            
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 1) {
                self.calculationCollectionViewHeightConstraint.constant = 50

                self.calculationCollectionView.setNeedsUpdateConstraints()
                self.calculationCollectionView.updateConstraintsIfNeeded()
                self.view.layoutIfNeeded()
            }
            viewHightFlag = false
        }else{
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 1, animations: {
                self.calculationCollectionViewHeightConstraint.constant = 120
                self.calculationCollectionView.setNeedsUpdateConstraints()
                self.calculationCollectionView.updateConstraintsIfNeeded()
                self.view.layoutIfNeeded()
            })
            viewHightFlag = true
        }
    }
    
//MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempObjectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        if tableView == leftTableView
        {
            let cellLeft = tableView.dequeueReusableCell(withIdentifier: "LeftCell", for: indexPath) as! LeftTableViewCell
            cellLeft.unitNameLabel.text = tempObjectArray[indexPath.row].name
            cellLeft.unitValueLabel.text = self.getAnswer ?? "0"

            cell = cellLeft
        }else if tableView == rightTableView{
            let cellRight = tableView.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath) as! RightTableViewCell
            cellRight.unitNameLabel.text = tempObjectArray[indexPath.row].name
            cellRight.unitValueLabel.text = self.getAnswer ?? "0"
            cell = cellRight
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: true)
//        let cell = leftTableView.cellForRow(at: indexPath) as! TableViewCell
//        
//        cell.unitValueLabel.text = displayCalculation == nil || displayCalculation.isEmpty ? "0" : Calculator(infix: displayCalculationArray).getAnswer()
//        self.selectedIndexPath = indexPath
        
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
    
}


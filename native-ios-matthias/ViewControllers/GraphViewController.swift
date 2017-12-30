//
//  GraphViewController.swift
//  native-ios-matthias
//
//  Created by M Vanooteghem on 23/12/17.
//  Copyright © 2017 M Vanooteghem. All rights reserved.
//

import UIKit
import Charts


// Based on: Charts Demos: https://github.com/danielgindi/Charts/tree/master/ChartsDemo/Swift
class GraphViewController: ChartBaseViewController{

    @IBOutlet weak var sliderTextX: UITextField!
    @IBOutlet weak var sliderTextY: UITextField!
    @IBOutlet weak var sliderX: UISlider!
    @IBOutlet weak var sliderY: UISlider!
    @IBOutlet weak var chartView: LineChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartView.delegate = self
        
        chartView.backgroundColor = .white
        chartView.gridBackgroundColor = .lightGray
        
        // Set options for chart
        chartView.drawGridBackgroundEnabled = true
        chartView.drawBordersEnabled = true
        chartView.chartDescription?.enabled = false
        chartView.pinchZoomEnabled = true
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.legend.enabled = false
        chartView.xAxis.enabled = false
        
        // Axis's/axises(??) of charts
        let leftAxis = chartView.leftAxis
        leftAxis.axisMaximum = 150
        leftAxis.axisMinimum = 0
        leftAxis.drawAxisLineEnabled = false
        
        chartView.rightAxis.enabled = false
        
        // Our slider values
        sliderX.value = 100
        sliderY.value = 60
        slidersValueChanged(nil)
        
        updateChartData()
    }
    
    override func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        self.setDataCount(Int(sliderX.value), range: UInt32(sliderY.value))
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        
        // Source: https://github.com/danielgindi/Charts/blob/master/ChartsDemo/Swift/Demos/LineChart2ViewController.swift
        let yVals1 = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 50)
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set1 = LineChartDataSet(values: yVals1, label: "Coin Price Data")
        set1.axisDependency = .left
        
        //
        set1.setColor(.blue)
        set1.drawCirclesEnabled = false
        set1.lineWidth = 1
        set1.circleRadius = 2
        set1.fillAlpha = 1
        set1.drawFilledEnabled = true
        set1.fillColor = .blue
        set1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set1.drawCircleHoleEnabled = false
        set1.fillFormatter = DefaultFillFormatter { _,_  -> CGFloat in
            return CGFloat(self.chartView.leftAxis.axisMinimum)
        }
        
        let data = LineChartData(dataSets: [set1])
        data.setDrawValues(false)
        
        chartView.data = data
    }
    
    @IBAction func slidersValueChanged(_ sender: Any?) {
        sliderTextX.text = "\(Int(sliderX.value))"
        sliderTextY.text = "\(Int(sliderY.value))"
        
        self.updateChartData()
    }
    

}

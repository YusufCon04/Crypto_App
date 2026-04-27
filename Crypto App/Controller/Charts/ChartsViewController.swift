import Charts
import UIKit
import DGCharts


class ChartsViewController: UIViewController, ChartViewDelegate {
    var crypto: Crypto?
    
    var lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = CGRect(x: 0, y: 0,
                                 width: self.view.frame.size.width,
                                 height: self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        var entries = [ChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x),
                                          y: Double(x)))
        }
        
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        lineChart.data = data

        applyTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "power.circle"), style: .plain, target: self, action: #selector(signoutButtonTapped))]
    }
    
    private func applyTheme() {
        // Use dynamic system colors to adapt to light/dark mode
        view.backgroundColor = .systemBackground
        lineChart.backgroundColor = .systemBackground
        
        let labelColor = UIColor.label
        lineChart.legend.textColor = labelColor
        lineChart.xAxis.labelTextColor = labelColor
        lineChart.leftAxis.labelTextColor = labelColor
        lineChart.rightAxis.labelTextColor = labelColor
        
        // Also color values on points if data exists
        if let dataSets = lineChart.data?.dataSets {
            dataSets.forEach { $0.valueTextColor = labelColor }
        }
        
        lineChart.setNeedsDisplay()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.userInterfaceStyle != traitCollection.userInterfaceStyle {
            applyTheme()
        }
    }
    
    @objc private func signoutButtonTapped() {
        let vc: MenuViewController = MenuViewController()
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    
    
    
}

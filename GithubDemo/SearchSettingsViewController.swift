//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Suraj Upreti on 3/3/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}

class SearchSettingsViewController: UITableViewController {
    var setting: GithubRepoSearchSettings
    
    var oldSetting: GithubRepoSearchSettings
    
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var minStarValue: UISlider!
    weak var delegate: SettingsPresentingViewControllerDelegate?

    override func viewDidLoad() {
        setting.minStars = 0
        oldSetting = setting
        super.viewDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        setting = GithubRepoSearchSettings()
        oldSetting = GithubRepoSearchSettings()
        super.init(coder: aDecoder)
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        //self.setting.minStars = Int(starLabel.text!)!
        setting.searchString = ""
        self.delegate?.didSaveSettings(settings: setting)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        setting = oldSetting
        self.delegate?.didCancelSettings()
        
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        let value = Int(sender.value)
        //print(value)
        starLabel.text = String(value)
        setting.minStars = Int(value)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

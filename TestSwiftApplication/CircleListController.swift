//
//  CircleListController.swift
//  TestSwiftApplication
//
//  Created by 随风流年 on 2021/6/20.
//

import UIKit
import Dispatch

class CircleListController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @objc dynamic var currendIndex: NSInteger = 0
    var escapingCallback:(()-> () )?
    var tableView: UITableView = UITableView()
    static var kDataSourceCount: Int = 80
    var funcNamesArray:[String]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //设置标题
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        //设置导航栏
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(),for: UIBarMetrics.default)
        //设置导航栏暗影透明
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //设置状态栏样式
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        //设置状态栏隐藏
        UIApplication.shared.isStatusBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: kHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.sf_registerCell(cell: SFVideoListCell.self)
        if #available(iOS 11.0, *) {
          tableView.contentInsetAdjustmentBehavior  = UIScrollView.ContentInsetAdjustmentBehavior.never
        } else {
          self.automaticallyAdjustsScrollViewInsets = false;
        }


        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          self.tableView.reloadData()
          let curIndexPath: NSIndexPath = NSIndexPath.init(row:self.currendIndex, section: 0)
          self.tableView.scrollToRow(at: curIndexPath as IndexPath, at: UITableView.ScrollPosition.middle, animated: false)
          self.addObserver(self, forKeyPath:"currendIndex", options: [NSKeyValueObservingOptions.new,NSKeyValueObservingOptions.initial], context: nil)

        }
              
        NotificationCenter.default.addObserver(self, selector: #selector(statusBarTouchBegin),
                                         name: NSNotification.Name(rawValue: "StatusBarTouchBeginNotification"),
                                         object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationBecomeAction),
                                         name: UIApplication.willEnterForegroundNotification,
                                         object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationEnterBackground),
                                         name: UIApplication.didEnterBackgroundNotification,
                                         object: nil)
        funcNamesArray = ["可选模式","RxSwift","RxSwiftTableView的使用"]
        navigationItem.rightBarButtonItem  = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(rightBtnClick))
              
    }
    
    @objc func rightBtnClick()  {
        print("rightBtnClick")
    }
    @objc  func statusBarTouchBegin() {
        
        
    }
    @objc func applicationBecomeAction() {
        
    }
    @objc func applicationEnterBackground() {
        
    }
   
    deinit {
        tableView.layer.removeAllAnimations()
        NotificationCenter.default.removeObserver(self)
        //currendIndex  currentIndex
        self.removeObserver(self, forKeyPath: "currendIndex")
        
    }
    
}


extension CircleListController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kHeight
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ViewController.kDataSourceCount
        return funcNamesArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.sf_dequeueReusableCell(indexPath: indexPath) as SFVideoListCell
        cell.currentIndex = indexPath.row
        cell.funcNameString = funcNamesArray?[indexPath.row] ?? "default"
        cell.backgroundColor = randomColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("当前点击的是\(indexPath.row)行")
        switch indexPath.row {
        case 0:
            let optionalModeVC = OptionalModeController()
            self.navigationController?.pushViewController(optionalModeVC, animated: true)
            break
            
        case 1:
            let rxVC = RxSwiftController()
            self.navigationController?.pushViewController(rxVC, animated: true)
            break
        case 2:
            let rxTableViewVC = RxSwiftTableViewUseController()
            self.navigationController?.pushViewController(rxTableViewVC, animated: true)
            break

        default:
            print("default")
        }
      
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        DispatchQueue.main.async {
            let translatedPoint = scrollView.panGestureRecognizer.translation(in: scrollView)
            //UITableView禁止响应其他滑动手势
            scrollView.panGestureRecognizer.isEnabled = false
            if translatedPoint.y < -50 && self.currendIndex < (CircleListController.kDataSourceCount - 1) {
                self.currendIndex = self.currendIndex + 1 //    //向上滑动  索引递增
            }
            if translatedPoint.y > 50   &&  self.currendIndex > 0 {
                self.currendIndex = self.currendIndex  - 1 //    //向下滑动  索引递减
            }
            
//            UIView.animate(withDuration: 0.15, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut) {
//                //UItableView 滑动到其他指定cell
//                self.tableView?.scrollToRow(at: NSIndexPath.init(row: self.currendIndex, section: 0) as IndexPath, at: UITableView.ScrollPosition.top, animated: false)
//            } completion: { _ in
//                //UITableView 可以响应其他滑动手势
//                scrollView.panGestureRecognizer.isEnabled = true
//            }
            UIView.animate(withDuration: 0.15, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.tableView.scrollToRow(at: NSIndexPath.init(row: self.currendIndex, section: 0) as IndexPath, at: UITableView.ScrollPosition.top, animated: false)
            }) { _  in
                scrollView.panGestureRecognizer.isEnabled = true
            }
        }
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currendIndex" {
            //获取当前显示的cell
            let indexPath = NSIndexPath(row:self.currendIndex , section: 0)
            guard let cell : SFVideoListCell = (tableView.cellForRow(at: indexPath as IndexPath) as! SFVideoListCell) else {
                return
            }
//            __weak typeof (cell) wcell = cell;
//            __weak typeof (self) wself = self;
            //用cell控制相关视频播放
            print("indexPath",self.currendIndex,cell)
            
        }else{
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    func randomColor() -> UIColor {
        let hue: CGFloat = CGFloat(((arc4random() % 2) / 256))
        let saturation: CGFloat = CGFloat(((arc4random() % 128) / 256)) + 0.5  //  0.5 to 1.0, away from white
        let brightness: CGFloat = CGFloat(((arc4random() % 128) / 256)) + 0.5 //  0.5 to 1.0, away from black
        
        return UIColor.init(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}

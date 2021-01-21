//
//  MainViewController.swift
//  SLABEL
//
//  Created by 김태훈 on 2021/01/19.
//

import UIKit

class MainViewController: BaseViewController {
    
    var timer: Timer = Timer()
    var imageIdx: Int = 0
    var isAdmin:Bool = false
    var headerIndex: Int = 0
    var headerText: [String] = ["정석학술정보관","하이테크센터","60주년기념관","학교 교내"]
    var bodyText: [[String]] = [["일반열람실", "그룹스터디룸", "정석라운지"],["공대도서관", "해동라운지", "IT카페"],["월천라운지", "인현재"],["1113호"]]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainImage: UIImageView!
    
    init(_ isAdmin:Bool) {
        self.isAdmin = isAdmin
        super.init(nibName: "MainViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.mainColor
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(imageChange), userInfo: nil, repeats: true)
        
        if isAdmin {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(staticButton))
            self.navigationItem.rightBarButtonItem?.tintColor = .white
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
        if isAdmin {
            self.navigationItem.title = "관리자 모드"
        } else {
            self.navigationItem.title = "사용자 모드"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = false
    }
    
    @objc func staticButton() {
        //의심 좌석 비율 / 평균 좌석 이용시간 / 평균 사용 좌석 비율 / 평균 혼잡도
        let alert = UIAlertController(title: "통계치", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "의심 좌석 비율", style: .default, handler: { _ in
            let vc = StaticViewController(0)
            self.navigationController?.pushViewController(vc, animated: true)
        })
        let action2 = UIAlertAction(title: "평균 좌석 이용시간", style: .default, handler: { _ in
            let vc = StaticViewController(1)
            self.navigationController?.pushViewController(vc, animated: true)
        })
        let action3 = UIAlertAction(title: "평균 사용 좌석 비율", style: .default, handler: { _ in
            let vc = StaticViewController(2)
            self.navigationController?.pushViewController(vc, animated: true)
        })
        let action4 = UIAlertAction(title: "평균 혼잡도", style: .default, handler: { _ in
            let vc = StaticViewController(3)
            self.navigationController?.pushViewController(vc, animated: true)
        })
        let action5 = UIAlertAction(title: "개인 정보", style: .default, handler: { _ in
            let vc = InfoViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        })
        let action6 = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(action4)
        alert.addAction(action5)
        alert.addAction(action6)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func imageChange() {
        mainImage.image = UIImage(named: "mainPage\(imageIdx)")
        UIView.animate(withDuration: 2, animations: {
            self.mainImage.alpha = 0.3
        })
        self.mainImage.alpha = 1
        imageIdx += 1
        if imageIdx == 3 {
            imageIdx = 0
        }
    }

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bodyText[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.backgroundColor = UIColor.menuColor
        cell.label.text = bodyText[indexPath.section][indexPath.row]
        if bodyText[indexPath.section].count - 1 == indexPath.row {
            cell.border.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        header.configure(headerText[indexPath.section])
        if headerIndex == indexPath.section {
            header.buttonConfigure("chevron.up")
        } else {
            header.buttonConfigure("chevron.down")
        }
        header.label.textColor = .white
        header.button.tag = indexPath.section
        header.button.tintColor = UIColor.menuColor
        header.backgroundColor = UIColor.mainColor
        header.button.isHidden = true
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section <= 2 {
            let vc = ShowViewController(indexPath.section, indexPath.row)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = RealViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
}

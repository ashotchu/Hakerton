

import UIKit

class StaticViewController: BaseViewController {

    var idx: Int = 0
    let headerTitle:[String] = ["의심 좌석 비율", "평균 좌석 이용시간", "평균 사용 좌석 비율", "평균 혼잡도"]
    let imageName:[String] = ["5","2","3","4"]
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    init(_ idx:Int) {
        self.idx = idx
        super.init(nibName: "StaticViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = headerTitle[idx]
        label.font = UIFont.NanumSquare(.extraBold, size: 20)
        label.textColor = .white
        label.sizeToFit()
        image.image = UIImage(named: imageName[idx])
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "통계량"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(staticButton))
        self.navigationItem.rightBarButtonItem?.tintColor = .white
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
        let action5 = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(action4)
        alert.addAction(action5)
        present(alert, animated: true, completion: nil)
    }

}

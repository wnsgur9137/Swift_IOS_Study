//
//  ViewController.swift
//  Map
//
//  Created by 이준혁 on 2022/06/19.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self // 상수 locationManager의 델리게이트를 self로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 추적하기 위해 사용자에게 승인을 요구
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        myMap.showsUserLocation = true  // 위치 보기 값을 true로 설정.
    }
    
    // 위도, 경도, 범위값을 받아온다.
    func goLocation(latitudeValue: CLLocationDegrees,
                    longitudeValue: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        
        //위도 값과 경도 값을 매개변수로 하여 아래 함수를 호출하고, 리턴 값을 pLocation으로 한다.
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        
        // 범위 값을 매개변수로 하여 아래 함수를 호출하고 리턴 값을 spanValue로 받는다.
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        
        //
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees,
                       longitudeValue : CLLocationDegrees, delta span:Double, title strTitle:String, subtitle strSubtitle:String) {
        
        let annotation = MKPointAnnotation() // 핀을 설치하기 위한 함수
        
        annotation.coordinate = goLocation(latitudeValue: latitudeValue,
                                           longitudeValue: longitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 위치가 업데이트 되면 먼저 마지막 위치 값을 찾아낸다.
        let pLocation = locations.last
        
        // 마지막 위치의 위도와 경도 값을 가지고 앞에서 만든 goLocation 함수를 호출.
        // delta 값은 지도의 크기를 정하는데, 값이 작을수록 확대되는 효과가 있다.
        // delta를 0.01로 하였으니 1의 값보다 지도를 100배 확대한다는 소리이다.
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                   longitudeValue: (pLocation?.coordinate.longitude)!,
                   delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // 현재 위치 표시
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            // 플리텍대학 표시
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000003, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            // 이지스퍼블리싱 표시
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        }
    }
    
}


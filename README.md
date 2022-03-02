# 제목 
코로나19 예방접종 센터 조회 앱 


## 기능 상세

- 지자체별로 예방접종센터를 표시해줍니다. 
-  해당 지자체별 접종센터 리스트를 볼 수 있습니다. 
-  지도를 통해 위치를 확인 할 수 있습니다. 

## 활용기술 
- Combine
- swiftUI


## DEMO
![ezgif com-gif-maker](https://user-images.githubusercontent.com/51107183/156392999-d26a6c96-2746-4c5b-91aa-a7f7ba700d51.gif)

## 배운 내용

### Combine 
> Customize handling of asynchronous evnets by combining event-processing operators 
> Combine declares pulishers to expose values that can change over time, and subscriber to receive those values from the publishers.
> By adopting Combine, you'll make your code easier to read and mainatin,
> by centralizing your event-processing code
> and eliminating thoublesome thchniques like nested closures and convention-based callbacks.

##### 비동기적인 인터페이스
- IBTarget / IBAction 
- Notification Center
- URLSession 
- KVO
- Ad-hoc callbacks

### Combine 핵심 요소 
1. Pulishers 
2. Subscribers 
3. Operators

### Combin VS RxSwift 
![스크린샷 2022-03-02 오후 9 55 15](https://user-images.githubusercontent.com/51107183/156365650-8248341b-97be-46aa-8d0e-3f964262f7d9.png)

#### Publiser vs. Observable 

![스크린샷 2022-03-02 오후 9 57 29](https://user-images.githubusercontent.com/51107183/156365898-28c176af-e16b-4304-89ec-69644c1d3f8b.png)

![스크린샷 2022-03-02 오후 9 57 38](https://user-images.githubusercontent.com/51107183/156365932-074c015c-8bb6-4838-8a22-fba8735f3e1f.png)

![스크린샷 2022-03-02 오후 9 57 50](https://user-images.githubusercontent.com/51107183/156365957-4135cf58-1012-4a5a-82d8-a87ba5fc585f.png)

![스크린샷 2022-03-02 오후 9 58 08](https://user-images.githubusercontent.com/51107183/156366005-e034089b-599e-422e-8f6d-8703dd9c17e3.png)


#### Operators, Rxswift Only 

![스크린샷 2022-03-02 오후 9 59 01](https://user-images.githubusercontent.com/51107183/156366126-f870213f-ff7e-47d7-8281-ee83010e1295.png)

#### Opersators, Combin Only 
![스크린샷 2022-03-02 오후 9 59 33](https://user-images.githubusercontent.com/51107183/156366217-69556cbe-4043-4384-ae52-abfdc2db8ba7.png)

##### map vs. tryMap 
![스크린샷 2022-03-02 오후 10 00 00](https://user-images.githubusercontent.com/51107183/156366291-9776eefe-c98f-4bf1-bd60-6a3425044061.png)

#### Combining Operators
![스크린샷 2022-03-02 오후 10 00 32](https://user-images.githubusercontent.com/51107183/156366429-4437ce59-9fa2-43cb-bd83-5bb051a095d1.png)

#### Subject 

|Combine|Rxswift
|----|----
|PassthroughSubject|PublishSubject
|X| ReplaySubject
|CurrentValueSubject| BehaviorSubject 

#### Cancellable vs. Disposable 
|Combine|Rxswift
|----|----
|Cancellable|Disposable
|AnyCancellable|DisposeBag


#### Thread Handing 
- RxSwift 
### ![스크린샷 2022-03-02 오후 10 07 01](https://user-images.githubusercontent.com/51107183/156367305-7f580790-2cea-4a80-bb97-45a0e1157ec1.png)

- Combine
```
Just(1)
  .subscribe(on: DispatchQueue.main)
  .map { _ in 
      implements()
  }
  .sink{ ... } 
```
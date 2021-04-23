
![2주차 과제 표지](https://tva1.sinaimg.cn/large/008i3skNgy1gptmt7lukfj31hc0u0jwp.jpg)

------



## 1주차 과제 - View, Autolayout, ScrollView

### 과제 1 - Autolayout 구현

![2주차 과제 형식_1](https://tva1.sinaimg.cn/large/008eGmZEgy1gpibh0os7nj31hc0u0qd1.jpg)

### 결과 화면

- 11 pro max

  ![2주차 과제 결과화면_11promax](https://tva1.sinaimg.cn/large/008eGmZEgy1gpic0m1iuuj315l0u0td3.jpg)

- 12 mini![2주차 과제 결과화면_ 12mini](https://tva1.sinaimg.cn/large/008eGmZEgy1gpic0vv3huj315k0u042l.jpg)

- se2

  ![2주차 과제 결과화면_se2](https://tva1.sinaimg.cn/large/008eGmZEgy1gpic18abumj31em0u0ac8.jpg)

#### 설명


<로그인, 회원가입 뷰>

- 로그인과 회원가입의 Autolayout 은 위에서부터 모든 간격이 일정하도록 배열했어요.
- 빈 area 도 없고 모든 컴포넌트들이 일정 간격을 유지하면서 화면에 출력되도록 말이져
- '카카오톡을 시작합니다' 와 그 밑에 subtitle 라벨은 centerX를 뷰와 일치하게 하는 형식으로 Horizontal Autolayout 을 설정해 주었구요,
  TextField 들과 버튼들은 하나에만 leading과 centerX를 맞추고 그 한 개와 나머지의 leading을 맞춰주었고 각각 height와 width를 주었어요.
- 두 번째 회원가입 뷰도 로그인 뷰와 마찬가지로 비슷하게 설정해주었어요.

<프로필 뷰>

- 마지막 뷰는 x 버튼은 상단으로부터의 거리를 기준으로 Vertical Autolayout 을 설정해 주었고, 나머지 뷰는 View 의 하단으로부터의 거리를 기준으로 Vertical Autolayout 을 설정해 주었어요.
- 위와 같이 한 이유는 상단으로부터의 거리를 기준으로 Vertical Autolayout 을 제플린에 나와있는 간격대로 설정해 준다면, 아래 공간이 심각하게 남기 때문이죠,,,!! 굉장히 애매한 뷰가 탄생한답니다,,,
- 따라서, x 버튼을 제외한 나머지 뷰들은 모두 아래쪽부터 순서대로 Autolayout 을 잡았다는 거!
- 맨 아래에 '나와의 채팅', '프로필 편집', '카카오스토리' 버튼들은 StackView 안에 넣어서 구현했어요.

------



### 과제 2 - Tabbar 을 이용한 홈 구성

![2주차 과제 형식_3](https://tva1.sinaimg.cn/large/008eGmZEgy1gpicfpx6b6j31hc0u07d0.jpg)

![2주차 과제 형식_5](https://tva1.sinaimg.cn/large/008eGmZEgy1gpicpjbho1j31hc0u00yk.jpg)



#### 결과 화면

![2주차 과제 결과화면_과제2](https://tva1.sinaimg.cn/large/008eGmZEgy1gpiclbd7dyj31g80u0n0c.jpg)

<img src="https://tva1.sinaimg.cn/large/008eGmZEgy1gpid1i2cs0g309o0i011n.gif" alt="Apr-13-2021 20-51-58" style="zoom:50%;" />

#### 설명

- 탭바들은 각 ViewController 마다 스토리보드를 하나씩 대응하여 연결을 해주었어요.

- 각 아이콘들은 취향 껏 대충 골라봤구요, tabbar 의 tintColor 를 .black으로 설정해줌으로써 선택되었을 때 색상이 검정색으로 변하는 조건을 만족시킬 수 있었어요!
  ![스크린샷 2021-04-13 오후 8.39.43](https://tva1.sinaimg.cn/large/008eGmZEgy1gpicohqrchj30jo07gjsj.jpg)
  
- tabbar 의 title 은 제가 없는 걸 좋아하기 때문에 넣지 않았구요 뷰 또한 정말 연결만 시켜두었습니다.

- x 버튼을 눌렀을 때 dismiss 되는 것은 selector 를 사용하여 objc method 를 구현해서 연결시킨 뒤 objc 메소드 안에 dismiss 를 구현했어요!
  
  ![스크린샷 2021-04-23 오후 3.32.57](https://tva1.sinaimg.cn/large/008i3skNgy1gpto0fxlqlj30ym03qjt3.jpg)
  
  ![스크린샷 2021-04-23 오후 3.32.29](https://tva1.sinaimg.cn/large/008i3skNgy1gptnzxnulaj30k8030q3i.jpg)

------

### 도전과제 - SwipeGesture

![2주차 과제 형식_6](https://tva1.sinaimg.cn/large/008eGmZEgy1gpics557spj31hc0u0q9v.jpg)

#### 결과 화면

<img src="https://tva1.sinaimg.cn/large/008eGmZEgy1gpid07y8cvg309o0i0k52.gif" alt="Apr-13-2021 20-50-12" style="zoom:50%;" />

#### 설명

- ~~저는 UISwipeGestureRecognizer 를 사용해서 구현했어요~~

- ~~이는 말 그대로 View 에 Swipe 하는 Gesture 를 기억하게 하고 유저가 그 제스쳐를 했을 때 특정 액션(함수)을 수행할 수 있게 하는 기능이에요.~~

- ~~아래로 swipe 했을 때 dismiss 가 실행되어야 함으로 swipeAction 의 방향은 당연히 .down 되어야겠져~~

- ~~마지막에 꼭 view에 이 gestureRecognizer 를 추가해줘야 합니다!!~~

- 세상에 마상에,,, 다른 파트원분들의 리드미를 읽다가 UIPanGestureRecognizer 를 발견했지 뭐에여,,,

- 역시 다른분들의 코드를 볼 떄마다 많은 것을 배웁니다,,,

- 그래서 저도 바꿔봤어요 이렇게 말이져!

  ![스크린샷 2021-04-23 오후 3.49.05](https://tva1.sinaimg.cn/large/008i3skNgy1gptoh73ttvj30zm04omym.jpg)

  ![스크린샷 2021-04-23 오후 3.50.37](https://tva1.sinaimg.cn/large/008i3skNgy1gptoitq40lj314o0rutgq.jpg)

- 우선 코드가 상당히 더럽네요 제출 당일이기에 급해서 말이져,,, 조만간 수정할게여,,,
- 헷갈린 부분에 대한 이유나 한 번 듣고 가봅시다.
- Swipe vs Pan
  - Swipe : 즉각적인 Gesture 인식이 이루어지는 방식.
  - Pan : 보통 drag라고 하는 방식으로 연속적인 Gesture의 인식이 이루어지며 시간에 따른 위치와 움직임에 대한 인식이 이루어지는 방식.
  - 뭐,,, 헷갈릴만 했네요 번역하느라 힘들었어요^ㅡ^
- 제가 느낀 가장 큰 차이점은 Pan에는 velocity와 translation이 있고 상태(state)가 있다는 거에요.
- velocity
  - velocity는 말 그대로 panning의 속도입니다.
  - 속도를 어떻게 수치로 나타내는가? 1초당 움직인 포인트입니다. 예를 들면, 300이면 1초에 300포인트를 움직이는 속도라는 거죠! 단위로 쓰자면,,, point/sec 가 되겠네요.
  - 저는 flicker와 일반 panning을 구분하기 위해서 사용했는데요, 저희가 보통 핸드폰을 사용할 때 빠르게 드래그를 하게 되면 창이 닫히거나 없어지는 액션들을 많이 보게 되는데 바로 이것이 flicker 입니다.
  - 일반 아이폰은 보통 flicker를 판단하는 기준이 300-400 정도 된다고 해요. 하지만 전 시뮬레이터에서 돌려서 300으로 설정하면 무조건 flicker라고 판단하더라구요.(SE2 기준) 그래서 좀 높여봤습니다.
  - velocity.x 는 수평으로 움직인 속도, velocity.y는 수직으로 움직인 속도에요. .magnitude는 절대값을 나타내구요. 우리는 수직으로 패닝을 하기 때문에, 따라서, 수직으로 움직인 속도의 절댓값이 2000보다 크면 flicker 라고 인식을 하겠다!! 입니다.
  - 절댓값이 있다는 건 부호가 존재하고 그 말은 곧 방향 또한 존재한다는 거겠죠 ㅎㅎ 너무 길어지니깐 이건 패스
- translation
  - translation은 패닝을 하기 위해 클릭하고 있는 지점을 CGFloat 형식으로 반환합니다. 
  - 따라서 view의 가장 위 부분과 손가락이 누르고 있는 지점과의 거리(interval)를 계산할 수 있어요.
  - 그 동작은 state에 따라 달리 하도록 선언했는데 그건 밑에서 보시죠.
- state
  - 우선 상태는 .changed, .ended, .cancelled, .began, .possible 등등 있는데 우선 제가 쓴 .ended와 .changed 만 살펴볼게요.
  - .changed : 계속 변할 때의 동작을 의미해요. 저는 변할 때 손가락이 누르는 포인트만큼 뷰가 내려가도록 했습니다. CGRect의 y값으로 뷰의 상단이 보여지는 높이를 정할 수 있어요.
  - .ended : 패닝이 끝났을 때, 즉, 손가락을 뗐을 때의 동작을 의미해요. 저는 동작이 끝나면 위에서 정의한 interval이 view의 높이의 반을 넘었을 때, 즉, 손가락이 화면의 절반 밑으로 내려왔을 때 뷰가 dismiss 되도록 했어요.

------



#### 새로 사용한 것, 새로 알게된 것, 힘들었던 점

1. ##### UIButton.showsTouchWhenHighlighted

   - 이번 과제 조건 중에 프로필 뷰 아래에 StackView 부분에서 터치영역을 이미지가 아닌 한 뷰 전체 영역이 되도록 하는 조건이 있었죠
   - 어떻게 하면 터치가 되었음을 직관적으로 보여줄 수 있을까? 해서 찾아보다가 위의 함수를 발견하게 됐어요.
- 문자 그대로 터치가 되었을 때 반짝!✨ 하고 하이라이트 되는 기능입니다!
   - 많이 사용할 것 같지는 않지만 직관적 표현을 위해 한 번 넣어봤어요^ㅡ^

##### -끝😄-


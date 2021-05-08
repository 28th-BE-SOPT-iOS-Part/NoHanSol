# 3주차 세미나 과제

![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wsi3xooj31hc0u0jwq.jpg)

---

# 3주차 과제 - 데이터 전달, TableView, CollectionView

---

## 과제 1 - TableView를 활용하여 친구목록 만들기

![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wspbk2uj31hc0u0wsp.jpg)

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gq8wstdevlj30u01szwv3.jpg" alt="3%E1%84%8C%E1%85%AE%E1%84%8E%E1%85%A1%20%E1%84%89%E1%85%A6%E1%84%86%E1%85%B5%E1%84%82%E1%85%A1%20%E1%84%80%E1%85%AA%E1%84%8C%E1%85%A6%20d369f1c8aa814c27bf375527d52e850a/Simulator_Screen_Shot_-_iPhone_11_Pro_-_2021-05-06_at_18.23.43.png" width="300" height="550"/><img src="https://tva1.sinaimg.cn/large/008i3skNgy1gq8wtrvfj5g309i0j47wh.gif" alt="3%E1%84%8C%E1%85%AE%E1%84%8E%E1%85%A1%20%E1%84%89%E1%85%A6%E1%84%86%E1%85%B5%E1%84%82%E1%85%A1%20%E1%84%80%E1%85%AA%E1%84%8C%E1%85%A6%20d369f1c8aa814c27bf375527d52e850a/May-06-2021_18-26-06.gif" width="300" height="550" />

### 설명

- 코드를 사용해서 구현을 했고, 상단 View와 하단 TableView를 나눠서 구현했어여
- 크게 분류하면 최상단 titleView, 그 아래 MyProfile(profileContainerView), 그 아래 separatorView, 마지막으로 friendTableView로 나누었고, 각 영역 아래에 뷰들이 존재하는 구조에요.
- friendTableView는 아래 코드를 보면서 얘기해보져!!

    ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wu9ac1dj30yw0cctct.jpg)

    ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wubaz4oj31340u0ndu.jpg)

    - viewDidLoad 에는
        1. layout() - 모든 view의 layout 구현
        2. putInFriendList() - tableView에 data를 넣어줄 수 있도록 friendList에 데이터 배열을 구현
        3. registerCell() - 코드로 tableView를 구현할 경우 tableView 에 cell을 등록

        이런 함수들이 구현되어 있어요.

    - tableView의 delegate, dataSource를 이 ViewController에서 위임받았구여
    - estimatedRowHeight은 tableView가 처음에 그려질 높이를 정해줘요. 저는 tableView내에 컴포넌트들에 레이아웃에 맞게 높이를 설정했기 때문에 사용했어요.
    - rowHeight = UITableView.automaticDimension
    을 설정함으로써 Cell에 요소들의 레이아웃에 따라 Cell 높이가 결정됩니다.
    - 카카오톡에 tableView 구분선이 없기 때문에 separatorStyle 을 .none으로 주었어요.

    ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wuhcqjdj31bc0rwao3.jpg)

- tableView Delegate와 DataSource 구요 세미나때 배운 내용과 크게 다른점은 없습니다!

---

## 과제2 - 셀 클릭 시, 각 셀의 프로필 ViewController로 present

![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wukzgsmj31hc0u07cf.jpg)

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gq8wuneuimg309i0j4kiv.gif" alt="3%E1%84%8C%E1%85%AE%E1%84%8E%E1%85%A1%20%E1%84%89%E1%85%A6%E1%84%86%E1%85%B5%E1%84%82%E1%85%A1%20%E1%84%80%E1%85%AA%E1%84%8C%E1%85%A6%20d369f1c8aa814c27bf375527d52e850a/May-06-2021_18-53-51.gif" style="zoom: 50%;" />

- 위 과제는 didSelectRowAt 함수를 사용해서 구현했어요.

    ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wv0a078j31b607kn1n.jpg)

- 물론 Cell 내에서 setSelected()로 구현을 할 수도 있지만 어차피 ViewController에서 cell의 데이터를 넣기 때문에 여기서 하는게 뭔가 좀 더 편하더라구요,,,
- modalPresentationStyle 을 그냥 .fullScreen으로 두면 패닝해서 내려갈 때 뒷 배경이 까만 배경으로 나와여!!
- 따라서, 저번 과제처럼 뒷 배경으로 ViewController가 보이게 하려면 꼭 .overFullScreen을 써 주셔야 합니다.

---

## 과제3 - CollectionView로 더보기 탭 구현

![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wvaeuzcj31hc0u0jyy.jpg)

<<<<<<< HEAD
<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gq8xhuj2e5j30u01szjyt.jpg" alt="Simulator Screen Shot - iPhone 11 Pro - 2021-05-06 at 18.58.36" style="zoom:33%;" />
=======
<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gq8xhuj2e5j30u01szjyt.jpg" alt="Simulator Screen Shot - iPhone 11 Pro - 2021-05-06 at 18.58.36" width="300" height="550" />
>>>>>>> ac9cd6cfb883ad9d1fe591a7b99a60e1fc27c183

- 3번째 과제는 collectionView를 사용해서 더보기 탭을 구현하는 건데요, 아까 홈탭을 구현했을 때와 마찬가지로 위 사진처럼 큰 뷰를 나눴어요!

- 저는 이렇게 큰 뷰들을 나누고 네이밍할 때 보통 ContainerView라는 이름을 붙이는데요, 먼저 큰 뷰들을 나눠놓고 안에 하위 뷰들을 구현하면 좀 더 체계적(?)으로 헷갈리지 않으면서 구현할 수 있는 장점이 있는 것 같아요!

    ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wvot87dj30sk0ag76u.jpg)

    ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wvt2pg6j313c0sen7a.jpg)

    ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wvwf6iyj316j0u04d0.jpg)

- 전체적인 코드의 구성은 다음과 같아요!

- 이번 탭에서는 함수들을 모두 extension에서 선언했어요,,, 딱히 뭐 이유가 있다라기 보다는 좀 더 깔끔한 너낌,,,?

- 그리고 collectionView를 코드로 짤 때, register도 물론 해야 하지만 한 가지 더 고려해주어야 하는 게 있어요.

    ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8ww00kr4j310s07o0v4.jpg)

- 위와 같이 layout과 크기를 먼저 잡아주지 않으면 런타임 에러가 발생합니다,,,!!

- 이번 과제에서는 scroll이 필요하지 않기 때문에 scroll을 꺼주었어요! ( 근데 scrollDirection은 왜 설정했을까요,,,? 크흠;;)

- 셀과 셀 사이의 거리(minimumInterItemSpacing)는 19, 
한 줄과 줄 사이의 거리(minimumLineSpacing)는 3으로 주었고
셀 내부 코드는 아래와 같습니다!

<<<<<<< HEAD
    ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8ww2ejrij30t010agvi.jpg)
=======
   ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8ww2ejrij30t010agvi.jpg)
>>>>>>> ac9cd6cfb883ad9d1fe591a7b99a60e1fc27c183

  ---

   ## 도전과제 1 - AlertController - ActionSheet

   ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8ww5a6r5j31hc0u011t.jpg)

   ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8ww8pgq3g309i0j41kx.gif)

<<<<<<< HEAD
    ![스크린샷 2021-05-06 오후 8.21.30](https://tva1.sinaimg.cn/large/008i3skNgy1gq8xemkwsoj318i06ujvd.jpg)

  ![스크린샷 2021-05-06 오후 8.21.47](https://tva1.sinaimg.cn/large/008i3skNgy1gq8xews6e2j30v004m0ui.jpg)
=======
   ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8xemkwsoj318i06ujvd.jpg)

   ![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8xews6e2j30v004m0ui.jpg)
>>>>>>> ac9cd6cfb883ad9d1fe591a7b99a60e1fc27c183

- actionSheet 스타일의 UIAlertController를 만들고 그 안에 UIAlertAction을 추가하는 방식이에요.

- style에는 .actionSheet와 .alert가 있는데
    1. .actionSheet 는 아래에서 올라오는 팝업 형태를 취하고
    2. .alert 는 뷰 중앙에 띄워지는 팝업 형태를 취해요
    
- 원래 UIAlertAction에 handler를 선언해서 눌렀을 때 어떤 Action을 수행하기 위해 쓰이지만 이번 과제에서 Action 추가는 없었으므로 handler에 nil 값을 주었어요!

- 마지막에 꼭 선언한 UIAlertController로 present를 해주셔야 밑에 팝업이 나와요!

- 버튼 클릭시 UIAlertController 가 나와야 하기 때문에 addTarget을 해주었고 selector를 사용하여 구현하였습니다.

---

## 도전과제 2 - tableViewSwipeAction

<<<<<<< HEAD
![3__9](https://tva1.sinaimg.cn/large/008i3skNgy1gq8xdr31j6j31hc0u0tge.jpg)
=======
![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8xdr31j6j31hc0u0tge.jpg)

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gq8wwf61taj31b60beaf4.jpg" alt="3%E1%84%8C%E1%85%AE%E1%84%8E%E1%85%A1%20%E1%84%89%E1%85%A6%E1%84%86%E1%85%B5%E1%84%82%E1%85%A1%20%E1%84%80%E1%85%AA%E1%84%8C%E1%85%A6%20d369f1c8aa814c27bf375527d52e850a/May-06-2021_19-30-52.gif" style="zoom:67%;" />
>>>>>>> ac9cd6cfb883ad9d1fe591a7b99a60e1fc27c183

![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wwf61taj31b60beaf4.jpg)

- 이번 과제때문에 저도 처음 써봤는데요 나중에 프로젝트나 앱잼할 때 굉장히 유용하게 사용할 것 같은 tableViewSwipeAction 입니다!
- tableView 내에 함수가 구현되어있구요 두 가지의 함수가 있어요!
    1. leadingSwipeActionConfiguration
    - 앞에서 뒤로 스와이프 할 때 앞쪽에서 Action이 나오는 함수
    2. trailingSwipeActionConfiguration
    - 뒤쪽에서 앞으로 스와이프 할 때 뒤쪽에서 Action이 나오는 함수
- UISwipeActionConfiguration에 UIContextualAction을 추가하는 방식이에요.
- style은 .destructive 와 .normal 이 있구요 공식 문서에는 다음과 같이 정의하네요.
    1. destructive - 데이터를 삭제하거나 부수거나 파괴하는 유형의 행위를 수행
    2. normal - 평범한 액션(,,,)
- 이것 또한 마찬가지로 각 액션에 해당하는 영역을 클릭했을 때 특정 액션이 수행되는 것이 목적이지만 이번 과제 요구사항에 없기 때문에 skip~
- 각 action에 backgroundColor 를 지정해줄 수 있습니다!
- 마지막에 Action들을 추가할 때는 순서가 조금 헷갈릴 수 있어요. 
[a,b]를 추가했다면, trailing 쪽에 a가 나옵니다!
즉, b,a 의 형태로 나온다는 거죠!

---

## 도전과제 3 - Contextual Menu

![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wwibtz8j31hc0u0qc3.jpg)

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gq8wwlp4eag309i0j47wh.gif" alt="3%E1%84%8C%E1%85%AE%E1%84%8E%E1%85%A1%20%E1%84%89%E1%85%A6%E1%84%86%E1%85%B5%E1%84%82%E1%85%A1%20%E1%84%80%E1%85%AA%E1%84%8C%E1%85%A6%20d369f1c8aa814c27bf375527d52e850a/May-06-2021_19-41-24.gif" style="zoom:67%;" />

![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wwr886fj319i0doafl.jpg)

![](https://tva1.sinaimg.cn/large/008i3skNgy1gq8wwuxgpij30vm072tb0.jpg)

- 이것도 이번 과제 덕분에 처음 써보게 되었어요,,,^^7
- tableView 내에 contextMenuConfigurationForRowAt 함수를 사용해서 tableView 셀을 꾹 클릭하고 있으면 UIContextMenuConfiguration이 호출되는 방식입니다.
- UIContextMenuConfiguration을 초기화할 때 identifier, previewProvider, actionProvider를 입력하게 됩니다.
    1. identifier: NSCopying 타입으로 Configuration 객체에 id를 부여할 수 있어요. 만약 초기화시 부여하지 않는다면(nil) UUID 값이 자동으로 들어간다구 하네영
    2. previewProvider: 미리보기에 해당되는 뷰로 커스텀 viewController를 지정해줄 수 있어요. 이번 과제에서 프로필보기 viewController가 해당되겠져! optional 타입으로 넣어주지 않아도 괜찮아여
    3. actionProvider: 미리보기 뷰와 함께 제공되는 UIMenu에요! 이것도 또한 optional 타입으로 넣어주지 않아도 좋습니다^ㅡ^
- 저는 previewProvider에 제가 구현한 프로필 뷰를 넣어줬는데 클로저를 써서 해당 셀의 이름, 이미지 데이터가 먼저 넘어가도록 구현했어요.
- actionProvider에는 UIView를 구현하는 함수를 선언해서 과제 요구사항에 맞는 네 가지의 액션을 포함한 UIVIew를 반환하도록 했습니다!!

-  끝😎 -

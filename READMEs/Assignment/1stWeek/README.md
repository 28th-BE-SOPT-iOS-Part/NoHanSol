![1주차 과제 표지](https://tva1.sinaimg.cn/large/008eGmZEgy1gp9xc64g2rj31hc0u0jtk.jpg)

![1주차 과제 형식](https://tva1.sinaimg.cn/large/008eGmZEgy1gp9xd8bv1mj31hc0u00zj.jpg)




## 1주차 과제 - 기본 UI요소, 화면 전환



#### 결과 화면

![merge_from_ofoct](https://tva1.sinaimg.cn/large/008eGmZEgy1gp9z3j84gvj315l0u0wjj.jpg)

<img src="https://tva1.sinaimg.cn/large/008eGmZEgy1gp9zf2v3u2g309i0j8x6q.gif" alt="Apr-06-2021 14-56-04" style="zoom:67%;" />



#### 새로 사용한 것, 새로 알게된 것, 힘들었던 점

1. ##### TextFieldEffects - Hoshi

   : 저번에 블로그에 iOS 라이브러리들을 정리하다가 알게 된 TextFieldEffects 를 이번에 한 번 써봐야겠다! 라는 생각이 들었어요.
   TextFieldEffects 는 UITextField에 각종 애니메이션과 커스텀화된 레이아웃을 제공하는 라이브러리입니다.

   [](https://github.com/raulriera/TextFieldEffects)

   깃 레포에 가보시면 여러 스타일의 텍스트필드를 확인하실 수 있을 거에요!
   사용법 또한 코드로 UITextField를 생성하듯이 생성할 수 있어요. 제가 작성한 코드는 아래와 같습니다.

   ![스크린샷 2021-04-06 오후 2.01.17](https://tva1.sinaimg.cn/large/008eGmZEgy1gp9xttb7o5j310u0audjl.jpg)

   placeholder 사이즈를 조절하기 위해 NSAttributedString을 사용했구요 
   텍스트 필드 아래에 선만 노출시키기 위해 borderStyle과 borderInactiveColor를 정해주었어요. borderInactiveColor는 TextFieldEffects의 내장 함수입니다!!
   HoshiTextField의 특징은 TextField에 입력을 위해 클릭을 하면 placeholder가 위로 올라가는 애니메이션을 제공해준다는 점이에요! 이렇게 말이죠 ⬇️

   ![Apr-06-2021 14-06-41](https://tva1.sinaimg.cn/large/008eGmZEgy1gp9xzheo9tg308m0661bl.gif)

2. ##### UIAlertController, UIAlertAction

   : 이번 과제 중 요구사항에 텍스트필드에 텍스트가 없을 때는 버튼을 눌러도 넘어가지 않는다! 라는 부분이 있었어요.
   그냥 안넘어가면 좀 심심해보여서 경고팝업이 뜨도록 하면 어떨까? 해서 써봤습니다.
   바로 아래처럼요! ⬇️
   
   <img src="https://tva1.sinaimg.cn/large/008eGmZEgy1gp9y31oez1g309i0ie1kx.gif" alt="Apr-06-2021 14-10-07" style="zoom:50%;" />
   
   
   
   구현한 코드는 아래와 같아요!
   
   ![스크린샷 2021-04-06 오후 2.13.06](https://tva1.sinaimg.cn/large/008eGmZEgy1gp9zbyy22vj30uq08k0u8.jpg)
   
   		1. UIAlertController 를 만든다.
   		2. UIAlertAction을 만든다.
   		3. UIAlertController에 UIAlertAction에 대한 액션을 추가해준다.
   		4. 마지막으로, UIAlertController로 present를 통해 modal로 화면전환을 한다.



3. ##### completion의 사용

   : modal로 화면전환을 할 때 우리는 

   ```
   present(UIViewController, animated: bool, completion: closure) 
   ```

   이렇게 보통 사용을 하는데요. 
   completion은 이 함수를 수행한 후에 시스템이 할 행동을 정해줄 수 있습니다.
   예륻 들어,

   ```
    present(UIViewController, animated: true, completion: { 
   Print("행동")}
   ```

   라고 쓴다면 화면전환 후에 "행동" 이라는 텍스트가 콘솔에 출력되겠죠.

   저는 이를 사용하여 이번 과제에서 두 가지의 액션들을 처리했어요.

   

   첫 번째로, 회원가입하고 확인 뷰가 나오면 확인 버튼 클릭시 로그인뷰로 돌아가는 액션이에요.

   회원가입 뷰에서 modal로 화면전환 할 때 popViewController() 라는 함수를 사용함으로써 ConfirmViewController에서 dismiss하는 것만으로 LoginViewController로 넘어갈 수 있게 했습니다.

   코드는 아래와 같아요!

   ![스크린샷 2021-04-06 오후 2.23.19](https://tva1.sinaimg.cn/large/008eGmZEgy1gp9yguc5t8j30zo086ac8.jpg)

   

   두 번째로는, 마찬가지로 A에서 B로 화면전환할 때 A의 텍스트필드에 입력한 텍스트들을 지울 때 사용했어요.

   굳이 필요한 기능은 아니었지만 좀 남아있는게 마음에 들지 않았어요,,,

   이 떄도 completion을 사용해서 텍스트필드의 텍스트를 모두 비워줬습니다. 

   코드는 아래와 같아요!

   ![스크린샷 2021-04-06 오후 2.26.15](https://tva1.sinaimg.cn/large/008eGmZEgy1gp9yjomi8rj30yy0a2q6q.jpg)



##### -끝😄-


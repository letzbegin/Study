출처 : https://codelabs.developers.google.com/codelabs/webrtc-web/#4

5 . RTCPeerConnection을 사용하여 비디오 스트리밍

배우게 될 것
이 단계에서는 다음과 같은 방법을 찾을 수 있습니다.

WebRTC shim, adapter.js 와의 브라우저 차이점을 추상화합니다 .
RTCPeerConnection API를 사용하여 비디오를 스트리밍하십시오.
미디어 캡처 및 스트리밍을 제어합니다.
이 단계의 전체 버전은 2 단계 폴더에 있습니다.

RTCPeerConnection이란 무엇입니까?
RTCPeerConnection은 비디오 및 오디오를 스트리밍하고 데이터를 교환하기 위해 WebRTC 호출을 수행하기위한 API입니다.

이 예제는 동일한 페이지에서 두 개의 RTCPeerConnection 객체 (피어라고도 함) 사이의 연결을 설정합니다.

실용적이지는 않지만 RTCPeerConnection의 작동 방식을 이해하는 데 좋습니다.

비디오 요소 및 컨트롤 버튼 추가
에서는 index.html을 두 개의 비디오 요소와 세 개의 버튼으로 단일 비디오 요소를 대체 :

<video id="localVideo" autoplay playsinline></video>
<video id="remoteVideo" autoplay playsinline></video>


<div>
  <button id="startButton">Start</button>
  <button id="callButton">Call</button>
  <button id="hangupButton">Hang Up</button>
</div>
한 동영상 요소는 스트림을 표시하고 getUserMedia()다른 동영상 요소는 RTCPeerconnection을 통해 스트리밍 된 동일한 동영상을 표시합니다. 실제 응용 프로그램에서는 한 비디오 요소가 로컬 스트림과 다른 원격 스트림을 표시합니다.

adapter.js 심 추가
main.js 링크 위 의 adapter.js 의 현재 버전에 대한 링크를 추가하십시오 .

<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
adapter.js 는 사양 변경 및 접두사 차이로부터 앱을 보호하기위한 심입니다. 실제로 WebRTC 구현에 사용되는 표준 및 프로토콜은 매우 안정적이며 몇 가지 접두사가 붙은 이름 만 있습니다.

이 단계에서는 codelab에는 적합하지만 프로덕션 응용 프로그램에는 적합하지 않을 수도있는 adapter.js의 최신 버전에 연결 했습니다 . adapter.js GitHub의의의 repo는 앱이 항상 최신 버전에 액세스해야합니다 만들기위한 방법을 설명합니다.

WebRTC interop에 대한 자세한 내용은 webrtc.org/web-apis/interop을 참조하십시오 .

Index.html 은 이제 다음과 같아야합니다.

<!DOCTYPE html>
<html>

<head>
  <title>Realtime communication with WebRTC</title>
  <link rel="stylesheet" href="css/main.css" />
</head>

<body>
  <h1>Realtime communication with WebRTC</h1>

  <video id="localVideo" autoplay playsinline></video>
  <video id="remoteVideo" autoplay playsinline></video>

  <div>
    <button id="startButton">Start</button>
    <button id="callButton">Call</button>
    <button id="hangupButton">Hang Up</button>
  </div>

  <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
  <script src="js/main.js"></script>
</body>
</html>
RTCPeerConnection 코드를 설치하십시오.
main - js 를 step-02 폴더 의 버전으로 바꿉니다 .

codelab에 많은 코드 덩어리를 잘라 붙이기를하는 것은 이상적이지는 않지만, RTCPeerConnection을 실행하기 위해서는 전체적인 방법 밖에있을 수 없습니다.

코드가 어떻게 작동 하는지를 배우게됩니다.

전화 걸기
index.html을 열고 시작 버튼을 클릭 하여 웹캠에서 비디오를 가져오고 통화 를 클릭 하여 피어 연결을 만듭니다. 두 비디오 요소 모두에서 동일한 비디오 (웹캠의)가 표시되어야합니다. WebRTC 로깅을 보려면 브라우저 콘솔을보십시오.

작동 원리
이 단계는 많이 ...

아래 설명을 건너 뛰고 싶다면 괜찮습니다.

codelab을 계속 사용할 수 있습니다!

WebRTC는 RTCPeerConnection API를 사용하여 피어 (peer )라고하는 WebRTC 클라이언트간에 비디오를 스트리밍하기위한 연결을 설정합니다 .

이 예에서, 두 RTCPeerConnection 객체가 동일한 페이지에 : pc1와 pc2. 별로 실용적이지는 않지만 API가 어떻게 작동하는지 보여주기에 좋습니다.

WebRTC 피어간에 호출을 설정하는 작업에는 다음 세 가지 작업이 포함됩니다.

호출의 끝마다 RTCPeerConnection을 만들고, 각 끝에서 로컬 스트림을 추가합니다 getUserMedia().
네트워크 정보를 얻고 공유하십시오 : 잠재적 인 연결 엔드 포인트는 ICE 후보 로 알려져 있습니다.
로컬 및 원격 설명 가져 오기 및 공유 : SDP 형식의 로컬 미디어에 대한 메타 데이터 .
Alice와 Bob이 RTCPeerConnection을 사용하여 화상 채팅을 설정하려고한다고 가정 해보십시오.

먼저 Alice와 Bob이 네트워크 정보를 교환합니다. '후보자 찾기'라는 표현은 ICE 프레임 워크를 사용하여 네트워크 인터페이스 및 포트를 찾는 프로세스를 나타냅니다 .

Alice는 onicecandidate (addEventListener('icecandidate'))핸들러를 사용하여 RTCPeerConnection 객체를 만듭니다 . main.js 의 다음 코드에 해당합니다 .
let localPeerConnection;
localPeerConnection = new RTCPeerConnection(servers);
localPeerConnection.addEventListener('icecandidate', handleConnection);
localPeerConnection.addEventListener(
    'iceconnectionstatechange', handleConnectionChange);
servers이 예제에서는 RTCPeerConnection에 대한 인수가 사용되지 않습니다.

여기서 STUN 및 TURN 서버를 지정할 수 있습니다.

WebRTC는 P2P (peer-to-peer) 방식으로 작동하도록 설계되었으므로 사용자는 가능한 가장 직접적인 경로로 연결할 수 있습니다. 그러나 WebRTC는 실제 네트워킹에 대처할 수 있도록 제작되었습니다. 클라이언트 응용 프로그램은 NAT 게이트웨이 및 방화벽 을 통과해야하며 직접 연결에 실패 할 경우를 대비해 피어 투 피어 네트워킹 요구 사항을 대체해야합니다.

이 프로세스의 일부로 WebRTC API는 STUN 서버를 사용하여 컴퓨터의 IP 주소를 가져 오며, TURN 서버는 피어 투 피어 통신이 실패 할 경우 릴레이 서버로 작동합니다. 실제 세계의 WebRTC가 자세히 설명합니다.

Alice는 다음 getUserMedia()과 같이 전달 된 스트림을 호출 하고 추가합니다.
navigator.mediaDevices.getUserMedia(mediaStreamConstraints).
  then(gotLocalMediaStream).
  catch(handleLocalMediaStreamError);
function gotLocalMediaStream(mediaStream) {
  localVideo.srcObject = mediaStream;
  localStream = mediaStream;
  trace('Received local stream.');
  callButton.disabled = false;  // Enable call button.
}
localPeerConnection.addStream(localStream);
trace('Added local stream to localPeerConnection.');
onicecandidate네트워크 후보가 사용 가능 해지면 1 단계 의 핸들러가 호출됩니다.
Alice는 직렬화 된 후보 데이터를 Bob에게 보냅니다. 실제 응용 프로그램에서이 프로세스 ( 시그널링 이라고도 함 )는 메시징 서비스를 통해 이루어지며 이후 단계에서이를 수행하는 방법을 배우게됩니다. 물론이 단계에서는 두 개의 RTCPeerConnection 객체가 같은 페이지에 있으며 외부 메시징이 필요없이 직접 통신 할 수 있습니다.
Bob은 Alice로부터 후보 메시지를 받으면 addIceCandidate()원격 피어 설명에 후보를 추가하기 위해 호출합니다 .
function handleConnection(event) {
  const peerConnection = event.target;
  const iceCandidate = event.candidate;

  if (iceCandidate) {
    const newIceCandidate = new RTCIceCandidate(iceCandidate);
    const otherPeer = getOtherPeer(peerConnection);

    otherPeer.addIceCandidate(newIceCandidate)
      .then(() => {
        handleConnectionSuccess(peerConnection);
      }).catch((error) => {
        handleConnectionFailure(peerConnection, error);
      });

    trace(`${getPeerName(peerConnection)} ICE candidate:\n` +
          `${event.candidate.candidate}.`);
  }
}
또한 WebRTC 피어는 해상도 및 코덱 기능과 같은 로컬 및 원격 오디오 및 비디오 미디어 정보를 찾아 교환해야합니다. 미디어 구성 정보를 교환하기위한 시그널링은 제안 및 응답 이라고하는 SDP 라고하는 세션 설명 프로토콜 형식을 사용하여 메타 데이터 묶음을 교환함으로써 진행됩니다 .

Alice는 RTCPeerConnection createOffer()메서드를 실행합니다 . 반환 된 약속은 RTCSessionDescription을 제공합니다. Alice의 로컬 세션 설명 :
trace('localPeerConnection createOffer start.');
localPeerConnection.createOffer(offerOptions)
  .then(createdOffer).catch(setSessionDescriptionError);
성공하면 Alice는 로컬 설명을 사용하여 설정 setLocalDescription()한 다음이 세션 설명을 신호 채널을 통해 Bob에게 보냅니다.
Bob은 Alice가 원격 설명으로 보낸 설명을 설정합니다 setRemoteDescription().
Bob은 RTCPeerConnection createAnswer()메소드를 실행하여 앨리스에서 가져온 원격 설명을 전달하여 로컬 세션을 생성 할 수 있습니다. createAnswer()약속은 RTCSessionDescription 뚫고 : Bob은 로컬 설명 앨리스에게 전송하는 설정한다.
Alice가 Bob의 세션 설명을 가져 오면 원격 설명으로 설정합니다 setRemoteDescription().

// Logs offer creation and sets peer connection session descriptions.
function createdOffer(description) {
  trace(`Offer from localPeerConnection:\n${description.sdp}`);

  trace('localPeerConnection setLocalDescription start.');
  localPeerConnection.setLocalDescription(description)
    .then(() => {
      setLocalDescriptionSuccess(localPeerConnection);
    }).catch(setSessionDescriptionError);

  trace('remotePeerConnection setRemoteDescription start.');
  remotePeerConnection.setRemoteDescription(description)
    .then(() => {
      setRemoteDescriptionSuccess(remotePeerConnection);
    }).catch(setSessionDescriptionError);

  trace('remotePeerConnection createAnswer start.');
  remotePeerConnection.createAnswer()
    .then(createdAnswer)
    .catch(setSessionDescriptionError);
}

// Logs answer to offer creation and sets peer connection session descriptions.
function createdAnswer(description) {
  trace(`Answer from remotePeerConnection:\n${description.sdp}.`);

  trace('remotePeerConnection setLocalDescription start.');
  remotePeerConnection.setLocalDescription(description)
    .then(() => {
      setLocalDescriptionSuccess(remotePeerConnection);
    }).catch(setSessionDescriptionError);

  trace('localPeerConnection setRemoteDescription start.');
  localPeerConnection.setRemoteDescription(description)
    .then(() => {
      setRemoteDescriptionSuccess(localPeerConnection);
    }).catch(setSessionDescriptionError);
}
핑!
보너스 포인트
chrome : // webrtc-internals를 살펴보십시오 . WebRTC 통계 및 디버깅 데이터를 제공합니다. Chrome URL의 전체 목록은 chrome : // about 입니다.
CSS로 페이지 스타일 지정 :
동영상을 나란히 놓습니다.
더 큰 텍스트와 함께 버튼을 동일한 너비로 만듭니다.
모바일에서 레이아웃이 작동하는지 확인하십시오.
크롬 개발 도구 콘솔에서 보면 localStream, localPeerConnection와 remotePeerConnection.
콘솔에서보세요 localPeerConnectionpc1.localDescription. SDP 형식은 어떤 모습입니까?
배운 내용
이 단계에서는 다음을 수행하는 방법을 배웠습니다.

WebRTC shim, adapter.js 와의 브라우저 차이점을 추상화합니다 .
RTCPeerConnection API를 사용하여 비디오를 스트리밍하십시오.
미디어 캡처 및 스트리밍을 제어합니다.
동료들간에 미디어 및 네트워크 정보를 공유하여 WebRTC 호출을 활성화합니다.
이 단계의 전체 버전은 2 단계 폴더에 있습니다.

팁
이 단계에서 배울 점이 많습니다! RTCPeerConnection을 자세히 설명하는 다른 리소스를 찾으려면 webrtc.org/start를 살펴 보십시오 . 이 페이지에는 JavaScript 프레임 워크에 대한 제안이 포함되어 있습니다. WebRTC를 사용하고 싶지만 API를 논쟁하고 싶지 않은 경우
adapter.js GitHub 레포 에서 adapter.js 심에 대해 자세히 알아보십시오 .
세계 최고의 비디오 채팅 앱이 어떻게 생겼는지보고 싶으십니까? AppRTC, WebRTC 프로젝트의 WebRTC 호출을위한 표준 애플리케이션 : app , code를 살펴보십시오 . 통화 설정 시간이 500ms 미만입니다.
우수 사례
코드를 미래 보장하려면 새로운 Promise 기반 API를 사용하고 adapter.js 를 사용하여 지원하지 않는 브라우저와의 호환성을 활성화하십시오 .
다음
이 단계에서는 WebRTC를 사용하여 피어간에 비디오를 스트리밍하는 방법을 보여줍니다. 그러나이 코드 랩은 데이터에 관한 것입니다!

다음 단계에서는 RTCDataChannel을 사용하여 임의의 데이터를 스트리밍하는 방법을 찾습니다.

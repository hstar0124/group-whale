/* 알림 소스 */
	// 알림 권한 허용여부
    var Notification = window.Notification || window.mozNotification || window.webkitNotification;

    Notification.requestPermission(function (permission) {

        // console.log(permission);

    });

    window.onload = function () {
        if (window.Notification) {
            Notification.requestPermission();
        }
    }
   
    function show() {

        var instance = new Notification(
        	'Whale', {
    		icon: '/gw/resources/images/menubar/logoMark.png',
    		body: '알림 테스트입니다.',}

        );

        // 알림 클릭시 이동할 url
        instance.onclick = function () {
        	window.open('http://google.com');

        };

        instance.onerror = function () {

            // Something to do

        };

        instance.onshow = function () {

            // Something to do

        };

        instance.onclose = function () {

            // Something to do

        };

 

        return false;

    }
    
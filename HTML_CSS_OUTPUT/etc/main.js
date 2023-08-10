
// 目次とページ位置の連動
window.addEventListener('scroll', function () {
    var scroll = window.scrollY; //スクロール量を取得
    if(179>scroll){
        document.getElementById("marker").style.top="-14px";
    }else if(180<scroll && scroll<300){
        document.getElementById("marker").style.top="30px";
    }else if(600<scroll && scroll<700){
        document.getElementById("marker").style.top="63px";
    }
});

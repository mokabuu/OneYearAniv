<!DOCTYPE html>
<html lang="ja">
    <head>
    	<link href="https://fonts.googleapis.com/earlyaccess/mplus1p.css" rel="stylesheet" />
        <meta charset="utf-8">
        <style>
        body { font-family: "Mplus 1p"; }
        @media screen and (min-width: 0px) and (max-device-width: 420px) {
			#qr{
				display: none;
			}
			video, h1 {
				display: none;
			}
		}
		@media screen and (min-width: 450px) {
			#form{
				display: none;
			}
			.csd{
				display: none;
			}
			video{
				width: 100%;
			}
			h1{
				font-size: 120px;
			}
		}
        </style>
        <title>一周年記念</title>
        <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes" />
        <script type="text/javascript" src="/webjars/jquery/1.10.2/jquery.min.js"></script>
        <script type="text/javascript">
            $(function(){
                var ws = new WebSocket("ws://192.168.10.112:8080/echo");
                ws.onopen = function(){
                };
                ws.onclose = function(){
                };
                ws.onmessage = function(message){
                    $("#result").append(message.data).append('<span class="csd">テレビにちゅうもーく！</span><video src="http://192.168.10.112:8080/kao_fin.mp4" autoplay></video>');
                    $("#anivmes").html('Happy 1st Anniversary!!');
                };
                ws.onerror = function(event){
                    alert("接続に失敗しました。");
                };
                $("#form").submit(function(){
                    ws.send($("#message").val());
                    $("#message").val("")
                    return false;
                });
            });
        </script>
    </head>
    <body>
    	<center>
        <div id="result"></div>
        <div>
        	<span class="csd">今日は２人の大事な記念日だよ‹‹\(´ω` )/››</span>
        	<form id="form" action="#">
        	    <input type="text" id="message" style="display:none;">
        	    <input type="submit" value="メッセージを読む">
       	 	</form>
       	 	<div>
       	 	<h1 id="anivmes">スマホをかざして<br>QRコードを読み取ろう！</h1>
       	 	<img id="qr" style="width: 480px;" src="http://192.168.10.112:8080/QR_Code.png" />
       	 </div>
       	 </center>
    </body>
</html>
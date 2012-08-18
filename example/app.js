var window = Ti.UI.createWindow({
  backgroundColor:'white'
});
 
var wb = require('jp.king3.webview.plus').createWebViewPlus({
  url: "http://google.co.jp/"
});

wb.schemaHandles = ['platform://'];
wb.addEventListener('platform://', function(e){ alert(e.url); setTimeout(function(){ Ti.Platform.openURL(e.url.replace(/^platform/, 'http')); }, 3000); });
wb.addEventListener('load', function(){ wb.evalJS('var a=document.createElement("a");a.href="platform://yahoo.co.jp";a.innerHTML="yahoo";document.body.appendChild(a);'); });

window.add(wb);
window.open();
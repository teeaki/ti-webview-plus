## Handle own url schemas;
```javascript
var wb = require('jp.king3.webview.plus').createWebViewPlus({
  url: "http://your-site.com/"
});

wb.schemaHandles = ['platform://']; // your own schema
wb.addEventListener('platform://', function(e){
  alert(e.url); // alert 'platform://google.co.jp/' without changing url;
  setTimeout(function(){ Ti.Platform.openURL(e.url.replace(/^platform/, 'http')); }, 3000);
});
```

```html
<html>
<body>
  <a href="platform://google.co.jp/">click me!</a>
</body>
</html>
```

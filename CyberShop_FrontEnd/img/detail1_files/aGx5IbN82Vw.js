if (self.CavalryLogger) { CavalryLogger.start_js(["K1Z0j"]); }

__d("PixelRatioConst",[],(function(a,b,c,d,e,f){e.exports={cookieName:"dpr"}}),null);
__d("camelize",[],(function(a,b,c,d,e,f){var g=/-(.)/g;function a(a){return a.replace(g,function(a,b){return b.toUpperCase()})}e.exports=a}),null);
__d("getOpacityStyleName",[],(function(a,b,c,d,e,f){__p&&__p();var g=!1,h=null;function a(){__p&&__p();if(!g){if(document.body&&"opacity"in document.body.style)h="opacity";else{var a=document.createElement("div");a.style.filter="alpha(opacity=100)";a.style.filter&&(h="filter")}g=!0}return h}e.exports=a}),null);
__d("hyphenate",[],(function(a,b,c,d,e,f){var g=/([A-Z])/g;function a(a){return a.replace(g,"-$1").toLowerCase()}e.exports=a}),null);
__d("getStyleProperty",["camelize","hyphenate"],(function(a,b,c,d,e,f){__p&&__p();function g(a){return a==null?a:String(a)}function a(a,c){__p&&__p();var d;if(window.getComputedStyle){d=window.getComputedStyle(a,null);if(d)return g(d.getPropertyValue(b("hyphenate")(c)))}if(document.defaultView&&document.defaultView.getComputedStyle){d=document.defaultView.getComputedStyle(a,null);if(d)return g(d.getPropertyValue(b("hyphenate")(c)));if(c==="display")return"none"}return a.currentStyle?c==="float"?g(a.currentStyle.cssFloat||a.currentStyle.styleFloat):g(a.currentStyle[b("camelize")(c)]):g(a.style&&a.style[b("camelize")(c)])}e.exports=a}),null);
__d("StyleCore",["invariant","camelize","containsNode","ex","getOpacityStyleName","getStyleProperty","hyphenate"],(function(a,b,c,d,e,f,g){__p&&__p();function h(a,b){a=n.get(a,b);return a==="auto"||a==="scroll"}var i=new RegExp("\\s*([^\\s:]+)\\s*:\\s*([^;('\"]*(?:(?:\\([^)]*\\)|\"[^\"]*\"|'[^']*')[^;(?:'\"]*)*)(?:;|$)","g");function j(a){var b={};a.replace(i,function(a,c,d){b[c]=d;return d});return b}function k(a){var b="";for(var c in a)a[c]&&(b+=c+":"+a[c]+";");return b}function l(a){return a!==""?"alpha(opacity="+a*100+")":""}function m(a,c,d){switch(b("hyphenate")(c)){case"font-weight":case"line-height":case"opacity":case"z-index":case"animation-iteration-count":case"-webkit-animation-iteration-count":break;case"width":case"height":var e=parseInt(d,10)<0;e&&g(0,826,a,c,d);default:isNaN(d)||!d||d==="0"||g(0,827,a,c,d,d+"px");break}}var n={set:function(a,c,d){__p&&__p();m("Style.set",c,d);a=a.style;switch(c){case"opacity":b("getOpacityStyleName")()==="filter"?a.filter=l(d):a.opacity=d;break;case"float":a.cssFloat=a.styleFloat=d||"";break;default:try{a[b("camelize")(c)]=d}catch(a){throw new Error(b("ex")('Style.set: "%s" argument is invalid: %s',c,d))}}},apply:function(a,c){__p&&__p();var d;for(d in c)m("Style.apply",d,c[d]);"opacity"in c&&b("getOpacityStyleName")()==="filter"&&(c.filter=l(c.opacity),delete c.opacity);var e=j(a.style.cssText);for(d in c){var f=c[d];delete c[d];var g=b("hyphenate")(d);for(var h in e)(h===g||h.indexOf(g+"-")===0)&&delete e[h];c[g]=f}Object.assign(e,c);a.style.cssText=k(e)},get:b("getStyleProperty"),getFloat:function(a,b){return parseFloat(n.get(a,b),10)},getOpacity:function(a){if(b("getOpacityStyleName")()==="filter"){var c=n.get(a,"filter");if(c){c=/(\d+(?:\.\d+)?)/.exec(c);if(c)return parseFloat(c.pop())/100}}return n.getFloat(a,"opacity")||1},isFixed:function(a){while(b("containsNode")(document.body,a)){if(n.get(a,"position")==="fixed")return!0;a=a.parentNode}return!1},getScrollParent:function(a){if(!a)return null;while(a&&a!==document.body){if(h(a,"overflow")||h(a,"overflowY")||h(a,"overflowX"))return a;a=a.parentNode}return window}};e.exports=n}),null);
__d("Style",["StyleCore","$"],(function(a,b,c,d,e,f){a=babelHelpers["extends"]({},b("StyleCore"),{get:function(a,c){typeof a==="string"&&(!1,a=b("$")(a));return b("StyleCore").get(a,c)},getFloat:function(a,c){typeof a==="string"&&(!1,a=b("$")(a));return b("StyleCore").getFloat(a,c)}});e.exports=a}),null);
__d("FbtResultBase",["FBLogger","killswitch"],(function(a,b,c,d,e,f){"use strict";__p&&__p();function g(a){b("FBLogger")("fbt").blameToPreviousFile().mustfix("Error using fbt string. Used method %s on Fbt string. Fbt string is designed to be immutable and should not be manipulated.",a)}function h(a){this.$1=a,this.$2=null}h.prototype.flattenToArray=function(){return h.flattenToArray(this.$1)};h.prototype.getContents=function(){return this.$1};h.prototype.toString=function(){__p&&__p();if(this.$2!=null)return this.$2;var a="",c=this.flattenToArray();for(var d=0;d<c.length;++d){var e=c[d];if(typeof e==="string"||e instanceof h)a+=e.toString();else{var f="Context not logged.";if(!b("killswitch")("JS_RELIABILITY_FBT_LOGGING"))try{f=JSON.stringify(e).substr(0,250)}catch(a){f=a.message}b("FBLogger")("fbt").blameToPreviousFile().mustfix("Converting to a string will drop content data. %s",f)}}Object.isFrozen(this)||(this.$2=a);return a};h.prototype.toJSON=function(){return this.toString()};h.flattenToArray=function(a){var b=[];for(var c=0;c<a.length;++c){var d=a[c];Array.isArray(d)?b.push.apply(b,h.flattenToArray(d)):d instanceof h?b.push.apply(b,d.flattenToArray()):b.push(d)}return b};["anchor","big","blink","bold","charAt","charCodeAt","codePointAt","contains","endsWith","fixed","fontcolor","fontsize","includes","indexOf","italics","lastIndexOf","link","localeCompare","match","normalize","repeat","replace","search","slice","small","split","startsWith","strike","sub","substr","substring","sup","toLocaleLowerCase","toLocaleUpperCase","toLowerCase","toUpperCase","trim","trimLeft","trimRight"].forEach(function(a){h.prototype[a]=function(){g(a);return this.toString()[a].apply(this,arguments)}}.bind(this));e.exports=h}),null);
__d("UserAgent_DEPRECATED",[],(function(a,b,c,d,e,f){__p&&__p();var g=!1,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v;function w(){__p&&__p();if(g)return;g=!0;var a=navigator.userAgent,b=/(?:MSIE.(\d+\.\d+))|(?:(?:Firefox|GranParadiso|Iceweasel).(\d+\.\d+))|(?:Opera(?:.+Version.|.)(\d+\.\d+))|(?:AppleWebKit.(\d+(?:\.\d+)?))|(?:Trident\/\d+\.\d+.*rv:(\d+\.\d+))/.exec(a),c=/(Mac OS X)|(Windows)|(Linux)/.exec(a);s=/\b(iPhone|iP[ao]d)/.exec(a);t=/\b(iP[ao]d)/.exec(a);q=/Android/i.exec(a);u=/FBAN\/\w+;/i.exec(a);v=/Mobile/i.exec(a);r=!!/Win64/.exec(a);if(b){h=b[1]?parseFloat(b[1]):b[5]?parseFloat(b[5]):NaN;h&&document&&document.documentMode&&(h=document.documentMode);var d=/(?:Trident\/(\d+.\d+))/.exec(a);m=d?parseFloat(d[1])+4:h;i=b[2]?parseFloat(b[2]):NaN;j=b[3]?parseFloat(b[3]):NaN;k=b[4]?parseFloat(b[4]):NaN;k?(b=/(?:Chrome\/(\d+\.\d+))/.exec(a),l=b&&b[1]?parseFloat(b[1]):NaN):l=NaN}else h=i=j=l=k=NaN;if(c){if(c[1]){d=/(?:Mac OS X (\d+(?:[._]\d+)?))/.exec(a);n=d?parseFloat(d[1].replace("_",".")):!0}else n=!1;o=!!c[2];p=!!c[3]}else n=o=p=!1}var x={ie:function(){return w()||h},ieCompatibilityMode:function(){return w()||m>h},ie64:function(){return x.ie()&&r},firefox:function(){return w()||i},opera:function(){return w()||j},webkit:function(){return w()||k},safari:function(){return x.webkit()},chrome:function(){return w()||l},windows:function(){return w()||o},osx:function(){return w()||n},linux:function(){return w()||p},iphone:function(){return w()||s},mobile:function(){return w()||s||t||q||v},nativeApp:function(){return w()||u},android:function(){return w()||q},ipad:function(){return w()||t}};e.exports=x}),null);
__d("isScalar",[],(function(a,b,c,d,e,f){function a(a){return/string|number|boolean/.test(typeof a)}e.exports=a}),null);
__d("DOM",["DOMQuery","Event","FBLogger","FbtResultBase","HTML","TAAL","UserAgent_DEPRECATED","$","createArrayFromMixed","isNode","isScalar","isTextNode"],(function(a,b,c,d,e,f){__p&&__p();var g=babelHelpers["extends"]({},b("DOMQuery"),{create:function(a,b,c){a=document.createElement(a);b&&g.setAttributes(a,b);c!=null&&g.setContent(a,c);return a},setAttributes:function(a,c){c.type&&(a.type=c.type);for(var d in c){var e=c[d],f=/^on/i.test(d);f&&typeof e!=="function"&&b("FBLogger")("dom").warn("Handlers passed to DOM.setAttributes must be functions. Handler passed for %s was %s",d,typeof e);if(d=="type")continue;else d=="style"?typeof e==="string"?a.style.cssText=e:Object.assign(a.style,e):f?b("Event").listen(a,d.substr(2),e):d in a?a[d]=e:a.setAttribute&&a.setAttribute(d,e)}},prependContent:function(a,c){if(!a)throw new Error(b("TAAL").blameToPreviousFile("reference element is not a node"));return i(c,a,function(b){a.firstChild?a.insertBefore(b,a.firstChild):a.appendChild(b)})},insertAfter:function(a,c){if(!a||!a.parentNode)throw new Error(b("TAAL").blameToPreviousFile("reference element does not have a parent"));var d=a.parentNode;return i(c,d,function(b){a.nextSibling?d.insertBefore(b,a.nextSibling):d.appendChild(b)})},insertBefore:function(a,c){if(!a||!a.parentNode)throw new Error(b("TAAL").blameToPreviousFile("reference element does not have a parent"));var d=a.parentNode;return i(c,d,function(b){d.insertBefore(b,a)})},setContent:function(a,c){if(!a)throw new Error(b("TAAL").blameToPreviousFile("reference element is not a node"));while(a.firstChild)h(a.firstChild);return g.appendContent(a,c)},appendContent:function(a,c){if(!a)throw new Error(b("TAAL").blameToPreviousFile("reference element is not a node"));return i(c,a,function(b){a.appendChild(b)})},replace:function(a,c){if(!a||!a.parentNode)throw new Error(b("TAAL").blameToPreviousFile("reference element does not have a parent"));var d=a.parentNode;return i(c,d,function(b){d.replaceChild(b,a)})},remove:function(a){h(typeof a==="string"?b("$")(a):a)},empty:function(a){a=typeof a==="string"?b("$")(a):a;while(a.firstChild)h(a.firstChild)}});Object.assign(g,b("DOMQuery"));function h(a){a.parentNode&&a.parentNode.removeChild(a)}function i(a,c,d){__p&&__p();a=b("HTML").replaceJSONWrapper(a);if(a instanceof b("HTML")&&c.firstChild===null&&-1===a.toString().indexOf("<script")){var e=b("UserAgent_DEPRECATED").ie();if(!e||e>7&&!b("DOMQuery").isNodeOfType(c,["table","tbody","thead","tfoot","tr","select","fieldset"])){var f=e?'<em style="display:none;">&nbsp;</em>':"";c.innerHTML=f+a;e&&c.removeChild(c.firstChild);return Array.from(c.childNodes)}}else if(b("isTextNode")(c)){c.data=a;return[a]}f=document.createDocumentFragment();var g;e=[];c=[];a=b("createArrayFromMixed")(a);a.length===1&&a[0]instanceof b("FbtResultBase")&&(a=a[0].getContents());for(var h=0;h<a.length;h++){g=b("HTML").replaceJSONWrapper(a[h]);if(g instanceof b("HTML")){c.push(g.getAction());var i=g.getNodes();for(var j=0;j<i.length;j++)e.push(i[j]),f.appendChild(i[j])}else if(b("isScalar")(g)||g instanceof b("FbtResultBase")){j=document.createTextNode(g);e.push(j);f.appendChild(j)}else b("isNode")(g)?(e.push(g),f.appendChild(g)):(Array.isArray(g)&&b("FBLogger")("dom").warn("Nest arrays not supported"),g!==null&&b("FBLogger")("dom").warn("No way to set content %s",g))}d(f);c.forEach(function(a){a()});return e}e.exports=g}),null);
__d("DOMDimensions",["Style","getDocumentScrollElement"],(function(a,b,c,d,e,f){__p&&__p();a={getElementDimensions:function(a){return{width:a.offsetWidth||0,height:a.offsetHeight||0}},getDocumentDimensions:function(a){a=b("getDocumentScrollElement")(a);var c=a.scrollWidth||0;a=a.scrollHeight||0;return{width:c,height:a}},measureElementBox:function(a,c,d,e,f){__p&&__p();var g;switch(c){case"left":case"right":case"top":case"bottom":g=[c];break;case"width":g=["left","right"];break;case"height":g=["top","bottom"];break;default:throw Error("Invalid plane: "+c)}c=function(c,d){var e=0;for(var f=0;f<g.length;f++)e+=parseFloat(b("Style").get(a,c+"-"+g[f]+d))||0;return e};return(d?c("padding",""):0)+(e?c("border","-width"):0)+(f?c("margin",""):0)}};e.exports=a}),null);
__d("WebPixelRatio",["Cookie","DOMEventListener","PixelRatioConst","Run"],(function(a,b,c,d,e,f){__p&&__p();var g=b("PixelRatioConst").cookieName,h,i=!1,j=!1,k=!1;function l(){return window.devicePixelRatio||1}function m(){b("Cookie").set(g,String(l()))}function n(){b("Cookie").clear(g)}function o(){if(j)return;j=!0;k&&n();l()!==1?m():n()}a={startDetecting:function(a,c){h=a||1;c&&(k=!0);if(i)return;i=!0;"onpagehide"in window&&b("DOMEventListener").add(window,"pagehide",o);b("Run").onBeforeUnload(o,!1)},get:function(){return h||l()}};e.exports=a}),null);
__d("Log",[],(function(a,b,c,d,e,f){"use strict";__p&&__p();a={DEBUG:3,INFO:2,WARNING:1,ERROR:0};b=function(a,b,c){for(var d=arguments.length,e=new Array(d>3?d-3:0),f=3;f<d;f++)e[f-3]=arguments[f];var h=0,i=c.replace(/%s/g,function(){return String(e[h++])}),j=window.console;j&&g.level>=b&&j[a in j?a:"log"](i)};var g={level:-1,Level:a,debug:b.bind(null,"debug",a.DEBUG),info:b.bind(null,"info",a.INFO),warn:b.bind(null,"warn",a.WARNING),error:b.bind(null,"error",a.ERROR),log:b};e.exports=g}),null);
__d("Queue",[],(function(a,b,c,d,e,f){__p&&__p();var g={};function h(a){"use strict";this._opts=babelHelpers["extends"]({interval:0,processor:null},a),this._queue=[],this._stopped=!0}h.prototype._dispatch=function(a){"use strict";__p&&__p();if(this._stopped||this._queue.length===0)return;if(!this._opts.processor){this._stopped=!0;throw new Error("No processor available")}if(this._opts.interval)this._opts.processor.call(this,this._queue.shift()),this._timeout=setTimeout(this._dispatch.bind(this),this._opts.interval);else while(this._queue.length)this._opts.processor.call(this,this._queue.shift())};h.prototype.enqueue=function(a){"use strict";this._opts.processor&&!this._stopped?this._opts.processor.call(this,a):this._queue.push(a);return this};h.prototype.start=function(a){"use strict";a&&(this._opts.processor=a);this._stopped=!1;this._dispatch();return this};h.prototype.isStarted=function(){"use strict";return!this._stopped};h.prototype.dispatch=function(){"use strict";this._dispatch(!0)};h.prototype.stop=function(a){"use strict";this._stopped=!0;a&&clearTimeout(this._timeout);return this};h.prototype.merge=function(a,b){"use strict";this._queue[b?"unshift":"push"].apply(this._queue,a._queue);a._queue=[];this._dispatch();return this};h.prototype.getLength=function(){"use strict";return this._queue.length};h.get=function(a,b){"use strict";var c;a in g?c=g[a]:c=g[a]=new h(b);return c};h.exists=function(a){"use strict";return a in g};h.remove=function(a){"use strict";return delete g[a]};e.exports=h}),null);
__d("resolveWindow",[],(function(a,b,c,d,e,f){__p&&__p();function a(a){__p&&__p();var b=window;a=a.split(".");try{for(var c=0;c<a.length;c++){var d=a[c],e=/^frames\[[\'\"]?([a-zA-Z0-9\-_]+)[\'\"]?\]$/.exec(d);if(e)b=b.frames[e[1]];else if(d==="opener"||d==="parent"||d==="top")b=b[d];else return null}}catch(a){return null}return b}e.exports=a}),null);
__d("XD",["Arbiter","DOM","DOMDimensions","Log","PHPQuerySerializer","Queue","URI","isFacebookURI","isInIframe","resolveWindow"],(function(a,b,c,d,e,f){__p&&__p();var g="fb_xdm_frame_"+location.protocol.replace(":",""),h={_callbacks:[],_opts:{autoResize:!1,allowShrink:!0,channelUrl:null,hideOverflow:!1,resizeTimeout:1e3,resizeWidth:!1,expectResizeAck:!1,resizeAckTimeout:6e3},_lastResizeAckId:0,_resizeCount:0,_resizeTimestamp:0,_shrinker:null,init:function(a){this._opts=babelHelpers["extends"]({},this._opts,a),this._opts.autoResize&&this._startResizeMonitor(),b("Arbiter").subscribe("Connect.Unsafe.resize.ack",function(a,b){b.id||(b.id=this._resizeCount),b.id>this._lastResizeAckId&&(this._lastResizeAckId=b.id)}.bind(this))},getQueue:function(){this._queue||(this._queue=new(b("Queue"))());return this._queue},setChannelUrl:function(a){this.getQueue().start(function(b){return this.send(b,a)}.bind(this))},send:function(a,c){__p&&__p();c=c||this._opts.channelUrl;if(!c){this.getQueue().enqueue(a);return}var d={};c=new(b("URI"))(c);Object.assign(d,a,b("PHPQuerySerializer").deserialize(c.getFragment()));var e=new(b("URI"))(d.origin).getOrigin(),f=b("resolveWindow")(d.relation.replace(/^parent\./,"")),h=50;a=function a(){var c=f.frames[g];try{c.proxyMessage(b("PHPQuerySerializer").serialize(d),e)}catch(c){--h?setTimeout(a,100):b("Log").warn('No such frame "'+g+'" to proxyMessage to')}};a()},_computeSize:function(){__p&&__p();var a=b("DOMDimensions").getDocumentDimensions(),c=0;if(this._opts.resizeWidth){var d=document.body;if(d.clientWidth<d.scrollWidth)c=a.width;else{d=d.childNodes;for(var e=0;e<d.length;e++){var f=d[e];f=f.offsetLeft+f.offsetWidth;f>c&&(c=f)}}c=Math.max(c,h.forced_min_width)}a.width=c;this._opts.allowShrink&&(this._shrinker||(this._shrinker=b("DOM").create("div")),b("DOM").appendContent(document.body,this._shrinker),a.height=Math.max(this._shrinker.offsetTop,0));return a},_startResizeMonitor:function(){__p&&__p();var a,c=document.documentElement;this._opts.hideOverflow&&(c.style.overflow="hidden",document.body.style.overflow="hidden");c=function(){__p&&__p();var c=this._computeSize(),d=Date.now(),e=this._lastResizeAckId<this._resizeCount&&d-this._resizeTimestamp>this._opts.resizeAckTimeout;if(!a||this._opts.expectResizeAck&&e||this._opts.allowShrink&&a.width!=c.width||!this._opts.allowShrink&&a.width<c.width||this._opts.allowShrink&&a.height!=c.height||!this._opts.allowShrink&&a.height<c.height){a=c;this._resizeCount++;this._resizeTimestamp=d;e={type:"resize",height:c.height,ackData:{id:this._resizeCount}};c.width&&c.width!=0&&(e.width=c.width);try{if(b("isFacebookURI")(new(b("URI"))(document.referrer))&&b("isInIframe")()&&window.name&&window.parent.location&&window.parent.location.toString&&b("isFacebookURI")(new(b("URI"))(window.parent.location))){d=window.parent.document.getElementsByTagName("iframe");for(var c=0;c<d.length;c=c+1)d[c].name==window.name&&(this._opts.resizeWidth&&(d[c].style.width=e.width+"px"),d[c].style.height=e.height+"px")}this.send(e)}catch(a){this.send(e)}}}.bind(this);c();setInterval(c,this._opts.resizeTimeout)}};c=babelHelpers["extends"]({},h);e.exports.UnverifiedXD=c;e.exports.XD=h;a.UnverifiedXD=c;a.XD=h}),null);
__d("Locale",["ExecutionEnvironment","SiteData"],(function(a,b,c,d,e,f){function a(){if(!b("ExecutionEnvironment").canUseDOM)return!1;else return b("SiteData").is_rtl}e.exports={isRTL:a}}),null);
__d("UnverifiedXD",["XD"],(function(a,b,c,d,e,f){a=b("XD").UnverifiedXD;e.exports=a}),null);
__d("getOffsetParent",["Style"],(function(a,b,c,d,e,f){function g(a){a=a.parentNode;if(!a||a===document.documentElement)return document.documentElement;return b("Style").get(a,"position")!=="static"?a:a===document.body?document.documentElement:g(a)}e.exports=g}),null);
__d("PluginResize",["Locale","Log","UnverifiedXD","getOffsetParent","getStyleProperty"],(function(a,b,c,d,e,f){__p&&__p();function g(a){a=a||document.body;var c=0,d=b("getOffsetParent")(a);b("Locale").isRTL()&&d?c=d.offsetWidth-a.offsetLeft-a.offsetWidth:b("Locale").isRTL()||(c=a.offsetLeft);return h(a)+c}function h(a){return Math.ceil(parseFloat(b("getStyleProperty")(a,"width")))||a.offsetWidth}function i(a){a=a||document.body;return a.offsetHeight+a.offsetTop}function j(a,b,event){this.calcWidth=a||g,this.calcHeight=b||i,this.width=undefined,this.height=undefined,this.event=event||"resize"}Object.assign(j.prototype,{resize:function(){var a=this.calcWidth(),c=this.calcHeight();(a!==this.width||c!==this.height)&&(b("Log").debug("Resizing Plugin: (%s, %s, %s, %s)",a,c,this.event),this.width=a,this.height=c,b("UnverifiedXD").send({type:this.event,width:a,height:c}));return this},auto:function(a){setInterval(this.resize.bind(this),a||250);return this}});j.auto=function(a,event,b){return new j(g.bind(null,a),i.bind(null,a),event).resize().auto(b)};j.autoHeight=function(a,b,event,c){return new j(function(){return a},i.bind(null,b),event).resize().auto(c)};j.getElementWidth=h;e.exports=j}),null);
__d("Banzai",["requireCond","cr:682513"],(function(a,b,c,d,e,f){e.exports=(a=b("cr:682513"))==null?void 0:a.v}),null);
__d("BanzaiODS",["invariant","Banzai","Random"],(function(a,b,c,d,e,f,g){__p&&__p();function h(){"use strict";this.$1={},this.$2={}}h.prototype.setEntitySample=function(a,c){"use strict";this.$2[a]=b("Random").random()<c?c:0};h.prototype.bumpEntityKey=function(a,b,c){c===void 0&&(c=1),this.$3(a,b,c)};h.prototype.bumpFraction=function(a,b,c,d){c===void 0&&(c=1),d===void 0&&(d=1),this.$3(a,b,c,d)};h.prototype.flush=function(a){"use strict";for(var c in this.$1)b("Banzai").post("ods:"+c,this.$1[c],a);this.$1={}};h.prototype.create=function(){"use strict";return new h()};h.prototype.$3=function(a,b,c,d){__p&&__p();c===void 0&&(c=1);d===void 0&&(d=1);if(a in this.$2){if(this.$2[a]<=0)return;c/=this.$2[a]}var e=this.$1[a]||(this.$1[a]={}),f=e[b]||(e[b]=[0]);c=Number(c);d=Number(d);if(!isFinite(c)||!isFinite(d))return;f[0]+=c;arguments.length>=4&&(f[1]||(f[1]=0),f[1]+=d)};var i=new h();b("Banzai").subscribe(b("Banzai").SEND,function(){return i.flush()});e.exports=i}),null);
__d("QueryString",[],(function(a,b,c,d,e,f){__p&&__p();function a(a){__p&&__p();var b=[];Object.keys(a).sort().forEach(function(c){var d=a[c];if(d===undefined)return;if(d===null){b.push(c);return}b.push(encodeURIComponent(c)+"="+encodeURIComponent(d))});return b.join("&")}function b(a,b){__p&&__p();b===void 0&&(b=!1);var c={};if(a==="")return c;a=a.split("&");for(var d=0;d<a.length;d++){var e=a[d].split("=",2),f=decodeURIComponent(e[0]);if(b&&Object.prototype.hasOwnProperty.call(c,f))throw new URIError("Duplicate key: "+f);c[f]=e.length===2?decodeURIComponent(e[1]):null}return c}function c(a,b){return a+(a.indexOf("?")!==-1?"&":"?")+(typeof b==="string"?b:g.encode(b))}var g={encode:a,decode:b,appendToUrl:c};e.exports=g}),null);
__d("SessionName",["SessionNameConfig","isInIframe"],(function(a,b,c,d,e,f){var g="_e_",h;function i(){h=(window.name||"").toString(),h.length==7&&h.substr(0,3)==g?h=h.substr(3):(h=b("SessionNameConfig").seed||"",b("isInIframe")()||(window.name=g+h))}e.exports={TOKEN:g,getName:function(){h===undefined&&i();return h}}}),null);
__d("StrSet",[],(function(a,b,c,d,e,f){__p&&__p();function g(a){"use strict";this.$2={},this.$1=0,a&&this.addAll(a)}g.prototype.add=function(a){"use strict";Object.prototype.hasOwnProperty.call(this.$2,a)||(this.$2[a]=!0,this.$1++);return this};g.prototype.addAll=function(a){"use strict";a.forEach(this.add,this);return this};g.prototype.remove=function(a){"use strict";Object.prototype.hasOwnProperty.call(this.$2,a)&&(delete this.$2[a],this.$1--);return this};g.prototype.removeAll=function(a){"use strict";a.forEach(this.remove,this);return this};g.prototype.toArray=function(){"use strict";return Object.keys(this.$2)};g.prototype.toMap=function(a){"use strict";var b={};Object.keys(this.$2).forEach(function(c){b[c]=typeof a==="function"?a(c):a||!0});return b};g.prototype.contains=function(a){"use strict";return Object.prototype.hasOwnProperty.call(this.$2,a)};g.prototype.count=function(){"use strict";return this.$1};g.prototype.clear=function(){"use strict";this.$2={};this.$1=0;return this};g.prototype.clone=function(){"use strict";return new g(this)};g.prototype.forEach=function(a,b){"use strict";Object.keys(this.$2).forEach(a,b)};g.prototype.map=function(a,b){"use strict";return Object.keys(this.$2).map(a,b)};g.prototype.some=function(a,b){"use strict";return Object.keys(this.$2).some(a,b)};g.prototype.every=function(a,b){"use strict";return Object.keys(this.$2).every(a,b)};g.prototype.filter=function(a,b){"use strict";return new g(Object.keys(this.$2).filter(a,b))};g.prototype.union=function(a){"use strict";return this.clone().addAll(a)};g.prototype.intersect=function(a){"use strict";return this.filter(function(b){return a.contains(b)})};g.prototype.difference=function(a){"use strict";return a.filter(function(a){return!this.contains(a)}.bind(this))};g.prototype.equals=function(a){"use strict";__p&&__p();var b=function(a,b){return a===b?0:a<b?-1:1},c=this.toArray();a=a.toArray();if(c.length!==a.length)return!1;var d=c.length;c=c.sort(b);a=a.sort(b);while(d--)if(c[d]!==a[d])return!1;return!0};e.exports=g}),null);
__d("isBonfireURI",[],(function(a,b,c,d,e,f){var g=new RegExp("(^|\\.)(get|my)bonfire\\.com$","i"),h=["https"];function a(a){if(a.isEmpty()&&a.toString()!=="#")return!1;return!a.getDomain()&&!a.getProtocol()?!1:h.indexOf(a.getProtocol())!==-1&&g.test(a.getDomain())}e.exports=a}),null);
__d("isMessengerDotComURI",[],(function(a,b,c,d,e,f){var g=new RegExp("(^|\\.)messenger\\.com$","i"),h=["https"];function a(a){if(a.isEmpty()&&a.toString()!=="#")return!1;return!a.getDomain()&&!a.getProtocol()?!1:h.indexOf(a.getProtocol())!==-1&&g.test(a.getDomain())}e.exports=a}),null);
__d("forEachObject",[],(function(a,b,c,d,e,f){"use strict";var g=Object.prototype.hasOwnProperty;function a(a,b,c){for(var d in a){var e=d;g.call(a,e)&&b.call(c,a[e],e,a)}}e.exports=a}),null);
__d("PlatformBaseVersioning",["invariant","PlatformVersions","StrSet","getObjectValues"],(function(a,b,c,d,e,f,g){__p&&__p();var h=new(b("StrSet"))(b("getObjectValues")(b("PlatformVersions").versions));c=location.pathname;d=c.substring(1,c.indexOf("/",1));var i=h.contains(d)?d:b("PlatformVersions").versions.UNVERSIONED;function j(a,c){if(c==b("PlatformVersions").versions.UNVERSIONED)return a;h.contains(c)||g(0,3769);a.indexOf("/")!==0&&(a="/"+a);return"/"+c+a}function a(a){return h.contains(a.substring(1,a.indexOf("/",1)))?a.substring(a.indexOf("/",1)):a}f={addVersionToPath:j,getLatestVersion:function(){return b("PlatformVersions").LATEST},versionAwareURI:function(a){return a.setPath(j(a.getPath(),i))},versionAwarePath:function(a){return j(a,i)},getUnversionedPath:a};e.exports=f}),null);
__d("PlatformWidgetEndpoint",["PlatformBaseVersioning"],(function(a,b,c,d,e,f){__p&&__p();function a(a,c){return b("PlatformBaseVersioning").versionAwarePath("/dialog/"+a+(c?"/"+c:""))}function c(a,c){return b("PlatformBaseVersioning").versionAwarePath("/plugins/"+a+(c?"/"+c:""))}function d(a){return/^\/plugins\//.test(b("PlatformBaseVersioning").getUnversionedPath(a))}function f(a){return/^\/dialog\//.test(b("PlatformBaseVersioning").getUnversionedPath(a))}a={dialog:a,plugins:c,isPluginEndpoint:d,isDialogEndpoint:f};e.exports=a}),null);
__d("getCrossOriginTransport",["invariant","ex"],(function(a,b,c,d,e,f,g){__p&&__p();function h(){try{var a=new XMLHttpRequest();!("withCredentials"in a)&&typeof XDomainRequest!=="undefined"&&(a=new XDomainRequest());return a}catch(a){throw new Error(b("ex")("getCrossOriginTransport: %s",a.message))}}h.withCredentials=function(){var a=h();"withCredentials"in a||g(0,5150);var b=a.open;a.open=function(){b.apply(this,arguments),this.withCredentials=!0};return a};e.exports=h}),null);
__d("ZeroRewrites",["URI","ZeroRewriteRules","getCrossOriginTransport","getSameOriginTransport","isFacebookURI"],(function(a,b,c,d,e,f){__p&&__p();var g={rewriteURI:function(a){if(!b("isFacebookURI")(a)||g._isWhitelisted(a))return a;var c=g._getRewrittenSubdomain(a);c!==null&&c!==undefined&&(a=a.setSubdomain(c));return a},getTransportBuilderForURI:function(a){return g._isRewritten(a)?b("getCrossOriginTransport").withCredentials:b("getSameOriginTransport")},isRewriteSafe:function(a){if(Object.keys(b("ZeroRewriteRules").rewrite_rules).length===0||!b("isFacebookURI")(a))return!1;var c=g._getCurrentURI().getDomain(),d=new(b("URI"))(a).qualify().getDomain();return c===d||g._isRewritten(a)},_isWhitelisted:function(a){a=a.getPath();a.endsWith("/")||(a+="/");return b("ZeroRewriteRules").whitelist&&b("ZeroRewriteRules").whitelist[a]==1},_getRewrittenSubdomain:function(a){a=new(b("URI"))(a).qualify().getSubdomain();return b("ZeroRewriteRules").rewrite_rules[a]},_isRewritten:function(a){a=new(b("URI"))(a).qualify();if(Object.keys(b("ZeroRewriteRules").rewrite_rules).length===0||!b("isFacebookURI")(a)||g._isWhitelisted(a))return!1;var c=a.getSubdomain(),d=g._getCurrentURI(),e=g._getRewrittenSubdomain(d);return a.getDomain()!==d.getDomain()&&c===e},_getCurrentURI:function(){return new(b("URI"))("/").qualify()}};e.exports=g}),null);
__d("DataAttributeUtils",["DataStore","Parent"],(function(a,b,c,d,e,f){__p&&__p();var g=[],h={LEGACY_CLICK_TRACKING_ATTRIBUTE:"data-ft",CLICK_TRACKING_DATASTORE_KEY:"data-ft",ENABLE_STORE_CLICK_TRACKING:"data-fte",IMPRESSION_TRACKING_CONFIG_ATTRIBUTE:"data-xt-vimp",IMPRESSION_TRACKING_CONFIG_DATASTORE_KEY:"data-xt-vimp",REMOVE_LEGACY_TRACKING:"data-ftr",getDataAttribute:function(a,b){return i[b]?i[b](a):a.getAttribute(b)},setDataAttribute:function(a,b,c){return j[b]?j[b](a,c):a.setAttribute(b,c)},getDataFt:function(a){if(a.getAttribute(h.ENABLE_STORE_CLICK_TRACKING)){var c=b("DataStore").get(a,h.CLICK_TRACKING_DATASTORE_KEY);c||(c=h.moveClickTrackingToDataStore(a,a.getAttribute(h.REMOVE_LEGACY_TRACKING)));return c}return a.getAttribute(h.LEGACY_CLICK_TRACKING_ATTRIBUTE)},setDataFt:function(a,c){if(a.getAttribute(h.ENABLE_STORE_CLICK_TRACKING)){b("DataStore").set(a,h.CLICK_TRACKING_DATASTORE_KEY,c);return}a.setAttribute(h.LEGACY_CLICK_TRACKING_ATTRIBUTE,c)},moveXTVimp:function(a){h.moveAttributeToDataStore(a,h.IMPRESSION_TRACKING_CONFIG_ATTRIBUTE,h.IMPRESSION_TRACKING_CONFIG_DATASTORE_KEY),g.push(a.id)},getXTrackableElements:function(){var a=g.map(function(a){return document.getElementById(a)}).filter(function(a){return!!a}),b=document.querySelectorAll("[data-xt-vimp]");for(var c=0;c<b.length;c++)a.push(b[c]);return a},getDataAttributeGeneric:function(a,c,d){d=b("DataStore").get(a,d);return d!==undefined?d:a.getAttribute(c)},moveAttributeToDataStore:function(a,c,d){var e=a.getAttribute(c);e&&(b("DataStore").set(a,d,e),a.removeAttribute(c))},moveClickTrackingToDataStore:function(a,c){var d=a.getAttribute(h.LEGACY_CLICK_TRACKING_ATTRIBUTE);d&&(b("DataStore").set(a,h.CLICK_TRACKING_DATASTORE_KEY,d),c&&a.removeAttribute(h.LEGACY_CLICK_TRACKING_ATTRIBUTE));return d},getClickTrackingParent:function(a){a=b("Parent").byAttribute(a,h.LEGACY_CLICK_TRACKING_ATTRIBUTE)||b("Parent").byAttribute(a,h.ENABLE_STORE_CLICK_TRACKING);return a},getClickTrackingElements:function(a){return a.querySelectorAll("["+h.LEGACY_CLICK_TRACKING_ATTRIBUTE+"], ["+h.ENABLE_STORE_CLICK_TRACKING+"]")},getParentByAttributeOrDataStoreKey:function(a,c,d){while(a&&(!a.getAttribute||!a.getAttribute(c))&&b("DataStore").get(a,d)===undefined)a=a.parentNode;return a}},i={"data-ft":h.getDataFt,"data-xt-vimp":function(a){return h.getDataAttributeGeneric(a,"data-xt-vimp","data-xt-vimp")},"data-ad":function(a){return h.getDataAttributeGeneric(a,"data-ad","data-ad")},"data-xt":function(a){return h.getDataAttributeGeneric(a,"data-xt","data-xt")}},j={"data-ft":h.setDataFt,"data-xt":function(a,c){b("DataStore").set(a,"data-xt",c)}};e.exports=h}),null);
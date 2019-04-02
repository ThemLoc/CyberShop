if (self.CavalryLogger) { CavalryLogger.start_js(["KvpZf"]); }

__d("ServerTime",["InitialServerTime"],(function(a,b,c,d,e,f){d(b("InitialServerTime").serverTime);var g;function a(){return Date.now()-g}function c(){return g}function d(a){g=Date.now()-a}e.exports={getMillis:a,getOffsetMillis:c,update:d,get:a,getSkew:c}}),null);
__d("LiveTimer",["csx","cx","fbt","CSS","DOM","ServerTime","TimeSlice","clearTimeout","setTimeoutAcrossTransitions"],(function(a,b,c,d,e,f,g,h,i){__p&&__p();var j=1e3,k=60,l=3600;a=43200;var m=86400,n=60,o=24,p=7,q=365,r=6e4,s=function(a){a.text===""&&(a.text=null);return a},t={restart:function(a){b("ServerTime").update(a*1e3),this.updateTimeStamps()},getApproximateServerTime:function(){return b("ServerTime").get()},getServerTimeOffset:function(){return-1*b("ServerTime").getSkew()},updateTimeStamps:function(){this.timestamps=b("DOM").scry(document.body,"abbr.livetimestamp"),this.startLoop(r)},addTimeStamps:function(a){__p&&__p();if(!a)return;this.timestamps=this.timestamps||[];if(b("DOM").isNodeOfType(a,"abbr")&&b("CSS").hasClass(a,"livetimestamp"))this.timestamps.push(a);else{a=b("DOM").scry(a,"abbr.livetimestamp");for(var c=0;c<a.length;++c)this.timestamps.push(a[c])}this.startLoop(0)},removeTimestamp:function(a){if(!this.timestamps||!a)return;a=this.timestamps.indexOf(a);a>-1&&this.timestamps.splice(a,1)},startLoop:function(a){this.stop(),this.createTimeout(a)},createTimeout:function(a){this.timeout=b("setTimeoutAcrossTransitions")(b("TimeSlice").guard(function(){this.loop()}.bind(this),"LiveTimer.loop",{propagationType:b("TimeSlice").PropagationType.EXECUTION}),a)},stop:function(){b("clearTimeout")(this.timeout)},loop:function(a){__p&&__p();a&&this.updateTimeStamps();var c=Math.floor(b("ServerTime").get()/j),d=-1;this.timestamps&&this.timestamps.forEach(function(a){__p&&__p();var e=a.getAttribute("data-utime"),f=a.getAttribute("data-shorten"),g=a.getAttribute("data-minimize");e=this.renderRelativeTime(c,e,f,g);if(e.text){f={"class":"timestampContent"};g=b("DOM").scry(a,".timestampContent")[0];g=g&&g.getAttribute("id");g&&(f.id=g);b("DOM").setContent(a,b("DOM").create("span",f,e.text))}e.next!=-1&&(e.next<d||d==-1)&&(d=e.next)}.bind(this));if(d!=-1){a=Math.max(r,d*j);this.createTimeout(a)}},renderRelativeTime:function(a,b,c,d,e){__p&&__p();var f={text:"",next:-1};if(a-b>m&&!e)return f;e=a-b;a=Math.floor(e/k);b=Math.floor(a/n);var g=Math.floor(b/o),h=Math.floor(g/p),j=Math.floor(g/q);if(a<1){d?(f.text=i._("1 ph\u00fat"),f.next=20-e%20):c?(f.text=i._("V\u1eeba xong"),f.next=20-e%20):(f.text=i._("v\u00e0i gi\u00e2y tr\u01b0\u1edbc"),f.next=k-e%k);return f}if(b<1){d?f.text=i._({"*":"{number} ph\u00fat"},[i._param("number",a,[0])]):c&&a==1?f.text=i._("1 ph\u00fat"):c?f.text=i._({"*":"{number} ph\u00fat"},[i._param("number",a,[0])]):f.text=i._({"*":"{number} ph\u00fat tr\u01b0\u1edbc","_1":"kho\u1ea3ng m\u1ed9t ph\u00fat tr\u01b0\u1edbc"},[i._plural(a,"number")]);f.next=k-e%k;return f}b<11&&(f.next=l-e%l);if(b<24){d?f.text=i._({"*":"{number} gi\u1edd"},[i._param("number",b,[0])]):c&&b==1?f.text=i._("1 gi\u1edd"):c?f.text=i._({"*":"{number} gi\u1edd"},[i._param("number",b,[0])]):f.text=i._({"*":"{number} gi\u1edd tr\u01b0\u1edbc","_1":"kho\u1ea3ng m\u1ed9t gi\u1edd tr\u01b0\u1edbc"},[i._plural(b,"number")]);return f}if(g<7){d?f.text=i._({"*":"{number} ng\u00e0y"},[i._param("number",g,[0])]):f.text=g===1?i._("m\u1ed9t ng\u00e0y tr\u01b0\u1edbc"):i._({"*":"{number} ng\u00e0y tr\u01b0\u1edbc"},[i._param("number",g,[0])]);return f}if(g>=7&&g<365){d?f.text=i._({"*":"{number} tu\u1ea7n"},[i._param("number",h,[0])]):f.text=h===1?i._("a week ago"):i._({"*":"{number} weeks ago"},[i._param("number",h,[0])]);return f}d?f.text=i._({"*":"{number} n\u0103m"},[i._param("number",j,[0])]):f.text=j===1?i._("a year ago"):i._({"*":"{number} years ago"},[i._param("number",j,[0])]);return f},renderRelativeTimeToServer:function(a,c,d,e){return this.renderRelativeTime(Math.floor(b("ServerTime").get()/j),a,c,d,e)},render:function(a,b,c,d){d===void 0&&(d=!1);return s(t.renderRelativeTime(a,b,c==="short",c==="minimal",d))},renderNow:function(a,b,c){c===void 0&&(c=!1);return s(t.renderRelativeTimeToServer(a,b==="short",b==="minimal",c))},CONSTS:{MS_IN_SEC:j,SEC_IN_MIN:k,SEC_IN_HOUR:l,SEC_IN_12_HOUR:a,SEC_IN_24_HOUR:m,MIN_IN_HOUR:n,HEARTBEAT:r}};e.exports=t}),null);
__d("getInlineBoundingRect",["Rect"],(function(a,b,c,d,e,f){__p&&__p();function a(a,c){__p&&__p();var d=a.getClientRects();if(!c||d.length===0)return b("Rect").getElementBounds(a);var e,f=!1;for(var g=0;g<d.length;g++){var h=new(b("Rect"))(Math.round(d[g].top),Math.round(d[g].right),Math.round(d[g].bottom),Math.round(d[g].left),"viewport").convertTo("document"),i=h.getPositionVector(),j=i.add(h.getDimensionVector());if(!e||i.x<=e.l&&i.y>e.t){if(f)break;e=new(b("Rect"))(i.y,j.x,j.y,i.x,"document")}else e.t=Math.min(e.t,i.y),e.b=Math.max(e.b,j.y),e.r=j.x;h.contains(c)&&(f=!0)}e||(e=b("Rect").getElementBounds(a));return e}e.exports=a}),null);
__d("nl2br",["DOM"],(function(a,b,c,d,e,f){var g=/(\r\n|[\r\n])/;function a(a){return a.split(g).map(function(a){return g.test(a)?b("DOM").create("br"):a})}e.exports=a}),null);
__d("Tooltip",["fbt","invariant","Arbiter","AsyncRequest","ContextualLayer","ContextualLayerAutoFlip","CSS","DOM","Event","Style","TooltipData","Vector","emptyFunction","getElementText","getInlineBoundingRect","getOrCreateDOMID","nl2br","setImmediate"],(function(a,b,c,d,e,f,g,h){__p&&__p();var i=null,j=null,k=null,l=null,m=null,n=null,o=null,p=!1,q=[],r=[];function s(){if(!m){n=b("DOM").create("div",{className:"tooltipContent","data-testid":"tooltip_testid"});o=b("getOrCreateDOMID")(n);var a=b("DOM").create("i",{className:"arrow"});a=b("DOM").create("div",{className:"uiTooltipX"},[n,a]);m=new(b("ContextualLayer"))({},a);m.shouldSetARIAProperties(!1);m.enableBehavior(b("ContextualLayerAutoFlip"))}}function t(a,c){v._show(a,g._("\u0110ang t\u1ea3i...")),new(b("AsyncRequest"))(c).setHandler(function(b){v._show(a,b.getPayload()),m&&m.updatePosition()}).setErrorHandler(b("emptyFunction")).send()}var u;b("Event").listen(document.documentElement,"mouseover",function(event){u=event,b("setImmediate")(function(){u=null})});var v=babelHelpers["extends"]({},b("TooltipData"),{isActive:function(a){return a===i},process:function(a,c){if(!b("DOM").contains(a,c))return;if(a!==i){v.fetchIfNecessary(a);c=v._get(a);if(c.suppress)return;c.delay?v._showWithDelay(a,c.delay):v.show(a)}},fetchIfNecessary:function(a){var b=a.getAttribute("data-tooltip-uri");b&&(a.removeAttribute("data-tooltip-uri"),t(a,b))},suspend:function(){p=!0},hide:function(){var a=i,c,d=p;p=!1;try{b("Arbiter").inform("tooltip/requesthide",{context:a}),c=p}finally{p=d}c||v.commitHide(a)},commitHide:function(a){if(!j||a!==j){if(a&&m){m.hide();i=null;while(q.length)q.pop().remove()}b("Arbiter").inform("tooltip/hide",{context:a})}},_show:function(a,b){v._store({context:a,content:b}),v.isActive(a)&&v.show(a)},show:function(a){var c,d=p;p=!1;try{b("Arbiter").inform("tooltip/requestshow",{context:a}),c=p}finally{p=d}c||v.commitShow(a)},commitShow:function(a){__p&&__p();var c=function(){a.removeAttribute("aria-describedby");var c=v._get(a);c.className&&m&&b("CSS").removeClass(m.getRoot(),c.className);v.hide()},d=function(a){b("DOM").contains(i,a.getTarget())||c()};j=a;s();a!==i&&v.commitHide(a);j=null;a!==i&&b("Arbiter").inform("tooltip/beforeshow",{context:a});var e=v._get(a);if(e.suppress||v.allSuppressed)return;var f=e.content;if(e.overflowDisplay){if(a.offsetWidth>=a.scrollWidth)return;f||(f=b("getElementText")(a))}var g=f?function(){a.setAttribute("aria-describedby",o),m&&m.show()}:function(){},k=0,l=e.offsetY?parseInt(e.offsetY,10):0;if(e.position==="left"||e.position==="right")l=(a.offsetHeight-28)/2;else if(e.alignH!=="center"){var p=a.offsetWidth;p<32&&(k=(p-32)/2*(e.alignH==="right"?-1:1))}p=u?b("Vector").getEventPosition(u):b("Vector").getElementPosition(a);m||h(0,4328);m.setContextWithBounds(a,b("getInlineBoundingRect")(a,p)).setOffsetX(k).setOffsetY(l).setPosition(e.position).setAlignment(e.alignH);if(typeof f==="string"){b("CSS").addClass(m.getRoot(),"invisible_elem");p=b("DOM").create("span",{},b("nl2br")(f));k=b("DOM").create("div",{className:"tooltipText"},p);b("DOM").setContent(n,k);g();b("CSS").removeClass(m.getRoot(),"invisible_elem")}else b("DOM").setContent(n,f),g();q.push(b("Event").listen(document.documentElement,"mouseover",d),b("Event").listen(document.documentElement,"focusin",d));l=b("Style").getScrollParent(a);l!==window&&q.push(b("Event").listen(l,"scroll",c));e.persistOnClick||q.push(b("Event").listen(a,"click",c));e.className&&b("CSS").addClass(m.getRoot(),e.className);i=a},_showWithDelay:function(a,c){a!==k&&v._clearDelay();if(!l){var d=function(a){b("DOM").contains(k,a.getTarget())||v._clearDelay()};r.push(b("Event").listen(document.documentElement,"mouseover",d),b("Event").listen(document.documentElement,"focusin",d));k=a;l=setTimeout(function(){v._clearDelay(),v.show(a)},c)}},_clearDelay:function(){clearTimeout(l);k=null;l=null;while(r.length)r.pop().remove()}});b("Event").listen(window,"scroll",v.hide);e.exports=v}),null);
__d("AvailableListState",[],(function(a,b,c,d,e,f){e.exports=Object.freeze({OFFLINE:0,IDLE:1,ACTIVE:2,MOBILE:3})}),null);
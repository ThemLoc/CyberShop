if (self.CavalryLogger) { CavalryLogger.start_js(["dWo6j"]); }

__d("ProfilePhotoPresenceGreenDot.react",["cx","AvailableListState","React","SubscriptionsHandler","requireDeferred"],(function(a,b,c,d,e,f,g){"use strict";__p&&__p();var h,i=b("requireDeferred")("PresenceStatus");c=babelHelpers.inherits(a,b("React").Component);h=c&&c.prototype;function a(){var a,c;for(var d=arguments.length,e=new Array(d),f=0;f<d;f++)e[f]=arguments[f];return c=(a=h.constructor).call.apply(a,[this].concat(e)),this.state={status:b("AvailableListState").OFFLINE},c}a.prototype.componentDidMount=function(){this.$1=new(b("SubscriptionsHandler"))(),this.$1.addSubscriptions(i.onReady(function(a){var b=function(){this.setState({status:a.get(this.props.profileID)})}.bind(this);this.$1.addSubscriptions(a.subscribe("change",b));b()}.bind(this)))};a.prototype.componentWillUnmount=function(){this.$1.release()};a.prototype.render=function(){return this.state.status===b("AvailableListState").ACTIVE?b("React").createElement("div",{className:"_354z"}):null};e.exports=a}),null);
__d("first",[],(function(a,b,c,d,e,f){"use strict";__p&&__p();function a(a){__p&&__p();for(var a=a,b=Array.isArray(a),c=0,a=b?a:a[typeof Symbol==="function"?Symbol.iterator:"@@iterator"]();;){var d;if(b){if(c>=a.length)break;d=a[c++]}else{c=a.next();if(c.done)break;d=c.value}d=d;return d}return null}e.exports=a}),null);
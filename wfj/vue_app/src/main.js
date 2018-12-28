import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'

import'mint-ui/lib/style.css'

import './lib/mui/css/mui.css' 
import './lib/mui/css/icons-extra.css' 


Vue.config.productionTip = false
//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'

//要求axios每次必须携带cookie区服务端
axios.defaults.withCredentials = true;
//跨域保存session值
Vue.prototype.axios = axios;

import { Button,Header,Swipe,SwipeItem  } from "mint-ui";

Vue.component(Button.name,Button);
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);

Vue.filter("dateFilter",function(val){
  if(!(typeof(val) == "string" && val.slice(20)=="000Z")){
    return val;
  }else{
    var date = new Date(val);
    var y = date.getFullYear();
    var m = date.getMonth();
    var d = date.getDate();
    
    m<10&&(m="0"+m);
    d<10&&(d="0"+d);

    var h = date.getHours();
    var M = date.getMinutes()
    var s = date.getSeconds();
    return `${y}-${m}-${d}`;
  }
});

//引入vue-resource  发送ajax
import VueResource from "vue-resource";
//引入vue-resource库的所有组件
Vue.use(VueResource);

//设置VueResource 服务器根目录
Vue.http.options.root = "http://127.0.0.1:3000";

//修改请求头 POST
//Vue.http.options.emulateJSON = true;
new Vue({
  router,     //路由
  store,
  render: h => h(App)   //render 渲染 h 参数相当于document.createElement()
}).$mount('#app')       //将根组件显示到index.html<div id="app">根组件</div>中

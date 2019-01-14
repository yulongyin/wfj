import Vue from 'vue'
import Router from 'vue-router'
import home from "./components/home.vue"
import login from "./components/login.vue"
import member from "./components/member/member.vue"
import perfectInfo from "./components/member/perfectInfo.vue"
import addmoreinfo from "./components/member/addMoreInfo.vue"
import register from "./components/register.vue"
import attract from "./components/attract/attract.vue"
import attrInfo from "./components/attract/attractInfo.vue"
import toBuyAttr from "./components/attract/toBuyAttr.vue"
import subAttr from "./components/attract/subAttr.vue"
import shop from "./components/shop/shop.vue"
import orderManage from "./components/shop/orderManage.vue"
import showProInfo from "./components/shop/showProInfo.vue"

Vue.use(Router)

export default new Router({
  routes: [
    //{path:'/',component:HelloContainer},
    {path:'/',redirect:("/home")},
    {path:'/home',component:home},
    {path:'/login',component:login},
    {path:'/register',component:register},
    {path:'/member',component:member},
    {path:'/perfect',component:perfectInfo},
    {path:'/attract',component:attract},
    {path:'/attrInfo',component:attrInfo},
    {path:'/toBuyAttr',component:toBuyAttr},
    {path:'/subAttr',component:subAttr},
    {path:'/shop',component:shop},
    {path:'/order',component:orderManage},
    {path:'/showProInfo',component:showProInfo},
    {path:"/addinfo",component:addmoreinfo}
  ]
})

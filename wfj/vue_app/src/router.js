import Vue from 'vue'
import Router from 'vue-router'
import home from "./components/home.vue"
import login from "./components/login.vue"
import member from "./components/member/perfectInfo.vue"
import perfectInfo from "./components/member/perfectInfo.vue"
import addmoreinfo from "./components/member/addMoreInfo.vue"

Vue.use(Router)

export default new Router({
  routes: [
    //{path:'/',component:HelloContainer},
    {path:'/',redirect:("/home")},
    {path:'/home',component:home},
    {path:'/login',component:login},
    {path:'/member',component:member},
    {path:'/perfect',component:perfectInfo},
    {path:"/addinfo",component:addmoreinfo}
  ]
})

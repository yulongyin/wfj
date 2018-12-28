<template>
    <div class="app-perfectInfo">
        <header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">个人名片</h1>
		</header>
		<img id="qrcode" src="../../img/huiyuan_01.png" />
        <div class="perfectName">
            <p>{{list[0].uname}}</p>
            <p>会员</p>
        </div>
        
        <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed" v-for="(item,i) of types">
            <li class="mui-table-view-cell">
                <div class="mui-slider-cell">
                    <div class="oa-contact-cell mui-table">
                        <div class="oa-contact-avatar mui-table-cell">
                            <span>{{item.users_info}}</span>
                        </div>
                        <div class="oa-contact-content" v-if="item.users_info=='性别'">
                            <div class="sexs">
                                <label><input type="radio" v-model="adSex" value="1" name="radio1">&nbsp;男</label>
                                <label><input type="radio" v-model="adSex" value="0" name="radio1">&nbsp;女</label>
                                <label><input type="radio" v-model="adSex" value="2" name="radio1">&nbsp;保密</label>
                            </div>
                        </div>
                        <div class="oa-contact-content mui-table-cell" v-else>
                            <div class="mui-clearfix">
                                <input type="text" :placeholder="`请输入${item.users_info}`" v-model="list[0][item.info_type]">
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
		<router-link class="mui-btn mui-btn-primary mui-btn-block" :to="'/addinfo?uid='+this.uid">添加更多信息</router-link>
        <br>
        <mt-button size="large" @click="submits">确认</mt-button>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        //:v-model="item[item.info_type] | dateFilter"
        data(){
            return {
                list:[
                    {
                        uname:""
                    }
                ],
                uid:0,
                types:[],
                types_info:[],
                adSex:1
            }
        },
        methods:{
            getInfo(){
                this.uid = this.$route.query.uid;
                var url = "perfect?uid="+this.uid;
                this.$http.get(url).then(result=>{
                    this.list = result.body;
                    if(this.list[0].sex == 1){
                        this.adSex = 1;
                    }else if(this.list[0].sex == 0){
                        this.adSex = 0;
                    }else{
                        this.adSex = 2;
                    }
                });
            }, 
            
            getType(){
                this.uid = this.$route.query.uid;
                var url = "getType?uid="+this.uid;
                this.$http.get(url).then(result=>{
                    this.types = result.body;
                    //console.log(result)
                });
            }, 

            //提交信息
            submits(){
                this.uid = this.$route.query.uid;
                var url = "update?";
                //console.log(this.types)
                for(var i = 0;i < this.types.length;i++){
                    //console.log(this.list[0][this.types[i].info_type]);
                    this.types_info.push(this.types[i].info_type);
                    if(this.list[0][this.types[i].info_type] == null){
                        console.log(this.list[0][this.types[i].info_type])
                        this.list[0][this.types[i].info_type] = "NULL";
                    }
                    url += `${this.types[i].info_type}=`+ this.list[0][this.types[i].info_type]+"&";
                }
                //console.log("this.types_info：：属性：：")
                //console.log(this.types_info);
                url += "uid="+this.uid;
                console.log(url);
                this.$http.get(url).then(result=>{
                    console.log(result);
                    if(result.body.code == 1){
                        Toast(result.body.msg);
                    }else{
                        Toast(result.body.msg);
                    }
                });
            }
        },
        created() {
            this.getInfo();
            this.getType();
        },
    }
</script>
<style>
    #qrcode{display:block; width:30%;margin:10px auto; }
    .perfectName{width:100%;text-align:center;line-height:24px;}
    .perfectName p:first-child{font-size:18px;font-weight:bold;color:#000;}
    .mui-table-view .mui-table-view-cell .mui-navigate-right{
        line-height:30px;
    }
    .mui-table-view .oa-contact-avatar img{
        width:50px;
        vertical-align: middle;
    }
    .oa-contact-content .mui-clearfix input[type=text]{
        margin-bottom:0;
    }
    #item22{display:none;}
    .mui-clearfix label{margin-right:20px;}
    .mui-clearfix input[type=radio]{margin-right:5px;}
    .sexs{
        line-height:50px;
    }
    .sexs input[type=radio]{
        width:20px;
        height:20px;
        vertical-align:middle;
        margin-left:20px;
    }
</style>
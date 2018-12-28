<template>
    <div class="app-comment">
        <h3>评论区域</h3>
        <hr>
        <!--发表评论区域-->
        <textarea name="" id="" cols="30" rows="5" v-model="msg" placeholder="请吐槽，最多120个字" maxlength="120"></textarea>
        <mt-button size="large" type="primary" @click="postComment">发表评论</mt-button>

        <!--评论区域-->
        <div class="cmt-list">
            <div class="cmt-item" v-for="(item,i) in list" :key="item.id">
                <div class="cmt-info">{{i+1}}楼&nbsp;&nbsp;用户：{{item.user_name}}</div>
                <div class="cmt-body">{{item.content}}</div>
                <div class="cmt-footer">{{item.ctime | dateFilter}}</div>
            </div>
        </div>
        <mt-button size="large" type="primary" @click="getMore()">加载更多</mt-button>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui';
    export default {
        data (){
            return {
                msg:"",
                pageIndex:0,
                pageSize:5,
                pageCount:3,
                list:[]
            }
        },
        props:["id"],
        methods:{
            getMore(){
                /*
                1、页码自增
                2、发送ajax
                3、参数 id pno pageSize
                4、获取返回的数据保存到list属性中
                5、显示在模板中
                */
                //console.log(this.id+"---"+this.pageIndex+"----"+this.pageSize);
                this.pageIndex++;
                var url = "http://127.0.0.1:3000/getComment?id="+this.id+"&pno="+this.pageIndex+"&pageSize="+this.pageSize;
                this.$http.get(url).then(result=>{
                    var rows = this.list.concat(result.body.data);
                    this.list = rows;
                    if(this.pageIndex >  result.body.pageCount)
                        Toast("没有更多了...");

                    
                });
            },
            postComment(){
                //console.log(1111);
                // 获取新闻编号
                var nid = this.id;
                //获取评论内容
                var pmsg = this.msg;
                
                //判断新闻评论内容不能为空
                if(pmsg.trim() == 0){
                    Toast("评论不能为空");
                    return;
                }
                //发送post请求
                var url = "http://127.0.0.1:3000/postconmment";
                this.$http.post(url,{nid:nid,msg:pmsg}).then(result=>{
                    console.log(result);
                    //获取服务器程序的返回结果
                    Toast("发表成功");
                    //提示用户“评论成功”
                    //清空index
                    this.pageIndex = 0;
                    this.list = [];
                    this.getMore();
                });
            }
        },
        created() {
            this.getMore();
        },
    }
</script>
<style>
    .app-comment{margin:20px 10px;}
    .cmt-list .cmt-item{clear:both;}
    .cmt-list .cmt-item>div{margin:20px 0;}
    .cmt-list .cmt-item .cmt-info{line-height:32px;background:#ddd;}
    .cmt-list .cmt-item .cmt-body{text-indent:2em;line-height:30px;}
    .cmt-list .cmt-item .cmt-footer{float:right;}
</style>
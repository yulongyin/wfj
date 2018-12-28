<template>
    <div class="newsInfoContainer">
        <h3>{{title}}</h3>
        <div>{{content}}</div>
        <!--保存评论的子组件-->
        <comment-box :id="this.id"></comment-box>
    </div>
</template>
<script>
    //引入子组件
    import comment from '../sub/comment.vue'
    export default {
        data(){
            return {
                info:{},
                title:"",
                content:"",
                id:this.$route.query.id
            }
        },
        created() {
            this.showInfo();
            console.log(this.$route.query.id)
        },
        methods:{
            showInfo(){
                var url = "http://127.0.0.1:3000/newsInfo";
                this.$http.get(url).then(result=>{
                    console.log(result);
                    var news = result.body;
                    this.title = news.title;
                    this.content = news.content;
                })
            }
        },
        //注册子组件
        components:{
            "comment-box":comment
        }
    }
</script>
<style>
    
</style>
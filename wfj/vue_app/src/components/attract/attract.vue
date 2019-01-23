<template>
    <div class="app-attract">
        <header class="mui-bar mui-bar-nav">
			<h1 id="title" class="mui-title">园区招商</h1>
		</header>
        <div class="mui-card">
            <ul class="mui-table-view">
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right" @click="toAttrInfo">
                        个人加入
                    </a>
                </li>
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right" @click="toAttrInfo">
                        公司加入
                    </a>
                </li>
            </ul>
        </div>
        
    </div>
</template>
<script>
    
	import {Toast} from 'mint-ui'
	export default {
		data(){
			return {
				uid : sessionStorage["uid"],
			}
		},
		methods:{
            toAttrInfo(e){
                sessionStorage["attrName"] = e.target.innerText;
                this.$router.push("attrInfo");
            }
		},
		created() {
			
		},
		components:{
			
		}
	}
</script>
<style>
	
</style>
<template>
<div class="test_item">
  <h3>{{test.test_title}}</h3>
  <span>{{test.test_description}}</span>
  <div>创建时间：{{test.test_create_time}}</div>
  <div>起始时间 {{ test.date_of_start}} --- 截止时间：{{test.deadline}}</div>
  <button @click="$emit('selectedChoice', test.test_id)">查看问卷</button>
  <button @click="$emit('testDelete', test.test_id)">删除问卷</button>
</div>
</template>
<script>
export default {
  data () {
    return {

    }
  },
  props: {
    test: {
      creator_id: Number,
      test_id: Number,
      test_title: String,
      test_description: String,
      date_of_start: String,
      deadline: String,
      test_create_time: String
    }
  },
  created () {
    console.log('问卷项被加载')
  }
}
</script>

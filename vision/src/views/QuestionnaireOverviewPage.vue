<template>
    <div>Questionnaire</div>
    <ti v-for="test in testList" :key="test.id" :test="test" @selectedChoice="Selected">
    </ti>
    <button @click="addTest()">创建新问卷</button>
</template>

<script>
import ti from '../components/TestItem.vue'
export default {
  components: {
    ti
  },
  data () {
    return {
      user_id: null,
      testList: []
    }
  },
  created () {
    this.user_id = this.$route.params.user
    console.log('created')
    this.$http.get(`/api/${this.user_id}/tests`)
      .then((response) => {
        this.testList = response.data
        console.log(this.testList)
        console.log('get all test success')
      })
      .catch(error => {
        console.log(error)
      })
  },
  methods: {
    Selected (id) {
      console.log('Selected')
      this.$router.push(`/${this.user_id}/test/${id}`)
    },
    addTest () {
      this.$router.push(`/${this.user_id}/test/create`)
    }
  }
}
</script>

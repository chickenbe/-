<template>
    <div class="question-page">
        <h1>{{ testData.test_title }}</h1>
        <p>{{ testData.test_description }}</p>
        <div v-for="question in questionList" :key="question.id">
            <h2>{{ question.question_id }}.{{ question.question_content }}</h2>
            <div v-for="choice in question.choices" :key="choice.id">
                <input type="radio" :name="question.question_id" :value="choice.choice_content">{{ choice.choice_content}}
            </div>
        </div>
    </div>
</template>
<script>
export default {
  data () {
    return {
      user_id: null,
      test_id: null,
      testData: {},
      questionList: []
    }
  },
  created () {
    this.test_id = this.$route.params.test
    this.user_id = this.$route.params.user
    this.$http.get(`/api/${this.user_id}/test/get/${this.test_id}`).then((response) => {
      this.testData = response.data
    })
    this.$http.get(`/api/${this.user_id}/test/${this.test_id}/connected`).then((response) => {
      console.log(response.data)
      this.questionList = response.data
    })
  }
}
</script>

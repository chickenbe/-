<template>
  <h1>Questionnaire</h1>
  <ChoiceTypeBar @addQuestion="createQuestion"></ChoiceTypeBar>
  <form action="#">
    <div v-for="question in questionList" :key="question.id">
      <component :is="question.type" :question="question"></component>
      <button type="button" @click="removeQuestion(question)">删除该问题</button>
    </div>
    <button type="submit">完成编辑</button>
  </form>
</template>

<script>
import singleC from '../components/SingleChoice.vue'
import MultipleC from '../components/MultipleChoice.vue'
import MatrixC from '../components/MatrixChoice.vue'
import ChoiceTypeBar from '../components/ChoiceTypeBar.vue'
import SingleF from '../components/SingleFilling.vue'
export default {
  data () {
    return {
      questionCount: 1,
      questionList: []
    }
  },
  components: {
    ChoiceTypeBar,
    singleC,
    MultipleC,
    MatrixC,
    SingleF
  },
  methods: {
    createQuestion (data) {
      let type = ''
      switch (data) {
        case 'singleChoice':
          type = 'singleC'
          break
        case 'multipleChoice':
          type = 'multipleC'
          break
        case 'matrix':
          type = 'matrixC'
          break
        case 'filling':
          type = 'SingleF'
          break
      }
      this.questionList.push({
        id: this.questionCount,
        content: '问题',
        type: type
      })
      console.log(this.questionList)
      this.questionCount++
    },
    removeQuestion (questionToRemove) {
      const index = this.questionList.findIndex(question => question.id === questionToRemove.id)
      if (index !== -1) {
        this.questionList.splice(index, 1)
        this.reassignIds()
        this.questionCount--
      }
    },
    reassignIds () {
      this.questionList.forEach((question, index) => {
        question.id = index + 1
      })
    }
  }
}
</script>

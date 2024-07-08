<template>
<div class="sidenav">
    <div class="overview">
        <ul>
            <li>
                <span class="show" @click="selected('ct')">题型</span>
            </li>
            <li>
                <span class="show" @click="selected('tb')">题库</span>
            </li>
        </ul>
    </div>
    <div class="choices" v-show="showChoiceType">
        <ul class="QuestionType">
            <li>
                <span class="show" @click="choiceOpen = !choiceOpen">选择题</span>
                <ul class="choice" v-show="choiceOpen">
                    <li @click="addQuestion('singleChoice')">单选题</li>
                    <li @click="addQuestion('multipleChoice')">多选题</li>
                    <li @click="addQuestion('matrix')">矩阵单选题</li>
                </ul>
            </li>
            <li>
                <span class="show" @click="fillingOpen = !fillingOpen">填空题</span>
                <ul class="filling" v-show="fillingOpen">
                    <li @click="addQuestion('filling')">填空题</li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="testsBase" v-show="showTestsBase">
        <span>这是未完成的题库</span>
    </div>
</div>
</template>

<script>
export default {
  data () {
    return {
      showChoiceType: true,
      showTestsBase: false,
      choiceOpen: true,
      fillingOpen: true,
      matrixOpen: true
    }
  },
  methods: {
    selected (type) {
      if (type === 'ct') {
        this.showChoiceType = true
        this.showTestsBase = false
      } else if (type === 'tb') {
        this.showChoiceType = false
        this.showTestsBase = true
      }
    },
    addQuestion (type) {
      if (type === 'singleChoice') {
        this.$emit('addQuestion', 'singleChoice')
      } else if (type === 'multipleChoice') {
        this.$emit('addQuestion', 'multipleChoice')
      } else if (type === 'filling') {
        this.$emit('addQuestion', 'filling')
      } else if (type === 'matrix') {
        this.$emit('addQuestion', 'matrix')
      }
    }
  }
}
</script>
<style scoped>

</style>

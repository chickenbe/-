<template>
    <div>{{ content }}</div>
        <div class='choices' v-for="option in options" :key="option.id">
            <input type='radio' name='answer'>
            <input v-model="option.content" required=true :readonly="options[option.id-1].changeable" :placeholder="option.id.toString()">
            <button type="button" @click="changeChoice(option.id-1)">修改</button>
            <button type="button" @click="removeOption(option)">删除该选项</button>
        </div>
        <button type="button" @click="addOption">添加选项</button>
</template>

<script>

export default {
  data () {
    return {
      content: '这是单项选择试题的问题内容',
      count: 1,
      options: []
    }
  },
  methods: {
    addOption () {
      this.options.push({
        id: this.count,
        changeable: false,
        content: '选项' + this.count
      })
      this.count++
    },
    removeOption (optionToRemove) {
      const index = this.options.findIndex(option => option.id === optionToRemove.id)
      if (index !== -1) {
        this.options.splice(index, 1)
        this.reassignIds()
        this.count--
      }
    },
    reassignIds () {
      this.options.forEach((option, index) => {
        option.id = index + 1
      })
    },
    changeChoice (index) {
      this.childProblems[index].changeable = !this.childProblems[index].changeable
    }
  }
}
</script>

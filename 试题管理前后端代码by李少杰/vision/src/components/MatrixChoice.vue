<template>
    <div>{{ content }}</div>
    <div class='choices' v-for="cp in childProblems" :key="cp.id">
        <input type="text" required=true v-model="cp.content" :placeholder="cp.id.toString()" :readonly="childProblems[cp.id-1].changeable">
        <input type="radio" class='Matrix' :name='"cpAnswer"+cp.id.toString()' v-for="degree in degrees" :key="degree.id">
        <button type="button" @click="changeChoice(cp.id-1)">修改</button>
        <button type="button" @click="removeChildProblem(cp)">删除该子问题</button>
    </div>
    <button type="button" @click="addChildProblem">添加新的子问题</button>
</template>

<script>

export default {
  data () {
    return {
      content: '这是矩阵选择试题的说明内容', // 试题内容
      count: 1, // 当前新建子问题计数器
      degreeCount: 6, // 当前度数计数器
      degrees: [// 度数
        { id: 1 },
        { id: 2 },
        { id: 3 },
        { id: 4 },
        { id: 5 }],
      childProblems: []// 子问题表
    }
  },
  methods: {
    // 增加子问题的个数（添加一行）
    addChildProblem () {
      this.childProblems.push({
        id: this.count,
        changeable: false,
        degrees: this.degrees,
        content: '选项'
      })
      this.count++
      console.log(this.childProblems)
    },
    // 删除对应子问题所在行
    removeChildProblem (problemToRemove) {
      const index = this.childProblems.findIndex(childProblem => childProblem.id === problemToRemove.id)
      console.log(index)
      if (index !== -1) {
        this.childProblems.splice(index, 1)
        this.reassignIds()
        this.count--
      }
    },
    // 更新子问题id
    reassignIds () {
      this.childProblems.forEach((childProblem, index) => {
        childProblem.id = index + 1
      })
    },
    // 变更可写性
    changeChoice (index) {
      this.childProblems[index].changeable = !this.childProblems[index].changeable
    }
  }
}
</script>

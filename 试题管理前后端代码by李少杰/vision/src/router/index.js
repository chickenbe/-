import { createRouter, createWebHashHistory } from 'vue-router'
import QuestionnaireCPage from '../views/QuestionnaireCreatePage.vue'
import qop from '../views/QuestionnaireOverviewPage.vue'
import QuestionPage from '../views/QuestionPage.vue'
const routes = [
  {
    path: '/',
    redirect: '/1/tests'
  },
  {
    path: '/:user/test/create',
    name: 'QuestionnaireCreatePage',
    component: QuestionnaireCPage
  },
  {
    path: '/:user/tests',
    name: 'QuestionnaireOverviewPage',
    component: qop
  },
  {
    path: '/:user/test/:test',
    component: QuestionPage
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router

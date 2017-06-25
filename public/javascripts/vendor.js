import Vue from "vue"
import VueResource from "vue-resource"
import {ClientTable, Event} from 'vue-tables-2'
import moment from "moment"

Vue.use(VueResource)
Vue.use(ClientTable)

window.Vue = Vue
window.moment = moment

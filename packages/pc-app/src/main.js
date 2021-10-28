import { createApp } from 'vue'
import App from './App.vue'
import pluginEntry from './init'

const app = createApp(App)

pluginEntry(app)
app.mount('#app')

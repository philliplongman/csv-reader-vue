new Vue({
  el: "main",
  data: {
    filename: "",
    persons: []
  },
  http: {
    root: "/root",
    emulateJSON: true
  },
  filters: {
    downcase: function (value) {
      if (!value) return ""
      return value.toString().toLowerCase()
    }
  },
  methods: {

    changeFile: function (e) {
      this.$http.post("/", this.getFormData(e)).then(this.updateData)
    },

    getFormData: function (e) {
      let file = e.target.files[0]
      let data = new FormData()
      data.append("file", file, file.name)

      return data
    },

    updateData: function (response) {
      this.filename = response.body.filename
      this.persons = response.body.people
      this.updateTableSort()
    },

    updateTableSort: function () {
      // update tablesorter data with the new rows
      // has to be a jQuery object
      let table = $(this.$refs.table)
      table.trigger("update")
      // the update function has a delay of 1 ms, so a timeout of 2 ms
      // must be set before triggering a new sort to prevent a conflict
      setTimeout( function () {
        let sort = [[0, 0]]
        table.trigger("sorton", [sort])
      }, 2)
    }
  },
})

$(".tablesorter").tablesorter()

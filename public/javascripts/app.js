const TableOptions = {
  columns: [
    "last_name", "first_name", "middle_initial", "pet", "birthday", "color"
  ],
  options: {
    filterable: false,
    perPage: 100,
    skin: "",
    sortIcon: {
      base: "",
      down: "active descending",
      up:   "active ascending"
    },
    texts: { noResults:'No records' }
  }
}


new Vue({
  el: "main",
  data: {
    filename: "",
    persons: [],
    tableColumns: TableOptions["columns"],
    tableOptions: TableOptions["options"]
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
    },
  },
})

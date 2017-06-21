CSVReader = function () {
  this.$input     = $("#file")
  this.$table     = $("table")
  this.$tableBody = $("tbody")

  var self = this

  this.submitFile = function () {
    $.ajax({
      method:       "POST",
      url:          "/",
      data:         this.fileData(),
      processData:  false,
      contentType:  false,
      success:      this.updatePage
    })
  }

  this.fileData = function () {
    var file = this.$input[0].files[0]
    var data = new FormData()
    data.append("file", file, file.name)

    return data
  }

  this.updatePage = function (data) {
    this.updateTable(data.people)
    this.updateCount(data.people.length)
    this.updateForm(data.filename)
  }

  this.updateTable = function (people) {
    this.$tableBody.empty()

    $.each(people, function(){
      self.$tableBody.append( self.newRowForPerson(this) )
    })

    this.updateTableSort()
  }

  this.newRowForPerson = function (person) {
    var $newRow = $("<tr>")

    $newRow.append("<td>" + person.last_name + "</td>")
      .append("<td>" + person.first_name + "</td>")
      .append("<td>" + person.middle_initial + "</td>")
      .append("<td class='" + person.pet.toLowerCase() + "'>" + person.pet + "</td>")
      .append("<td>" + person.birthday + "</td>")
      .append("<td>" + person.color + "</td>")

    return $newRow
  }

  this.updateTableSort = function functionName() {
    // update tablesorter data with the new rows
    this.$table.trigger("update")
    // the update function has a delay of 1 ms, so a timeout of 2 ms
    // must be set before triggering a new sort to prevent a conflict
    setTimeout( function(){
      var sort = [[0, 0]]
      self.$table.trigger("sorton", [sort])
    }, 2)
  }

  this.updateCount = function (count) {
    $(".count").text( count + " people")
  }

  this.updateForm = function (filename) {
    $(".filename").text(filename)
  }

  _.bindAll(this, "fileData", "newRowForPerson", "submitFile", "updateCount",
    "updateForm", "updatePage", "updateTable", "updateTableSort")

  this.$input.change(this.submitFile)
  this.$table.tablesorter()
}

$(document).ready( function(){
  new CSVReader
})

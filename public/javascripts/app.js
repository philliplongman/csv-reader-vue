function submitFile() {
  var input = $("#file")[0]
  var file = input.files[0]

  var data = new FormData()
  data.append("file", file, file.name)

  $.ajax({
    method: "POST",
    url: "/",
    data: data,
    processData: false,
    contentType: false,
    success: updateTable
  })
}

function updateTable(data) {
  var $table = $("table")
  var $body = $("tbody", $table)
  var $filename = $(".filename")
  var $count = $(".count")

  $body.empty()

  $.each(data.people, function(){
    var $newRow = $("<tr>")

    $newRow.append("<td>" + this.last_name + "</td>")
     .append("<td>" + this.first_name + "</td>")
     .append("<td>" + this.middle_initial + "</td>")
     .append("<td class='" + this.pet.toLowerCase() + "'>" + this.pet + "</td>")
     .append("<td>" + this.birthday + "</td>")
     .append("<td>" + this.color + "</td>")

    $body.append($newRow)
  })

  $table.trigger("update")
  // the update function sets a timeout of 1 ms,
  // so a timeout of 2 ms must be set here to prevent a conflict
  setTimeout(function(){ $table.trigger("sorton", [[[0, 0]]]) }, 2)

  $count.text( data.people.length + " people")

  $filename.text(data.filename)
}

$(document).ready(function(){ $("table").tablesorter() })

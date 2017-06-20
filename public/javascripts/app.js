function submitFile() {
  var input = $("#upload-file")[0]
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
  var $body = $("table tbody")

  $body.empty()

  $.each(data.people, function(){
    var $newRow = $("<tr>")

    $newRow.append("<td>" + this.last_name + "</td>")
    $newRow.append("<td>" + this.first_name + "</td>")
    $newRow.append("<td>" + this.middle_initial + "</td>")
    $newRow.append("<td>" + this.pet + "</td>")
    $newRow.append("<td>" + this.birthday + "</td>")
    $newRow.append("<td>" + this.color + "</td>")

    $body.append($newRow)
  })
}

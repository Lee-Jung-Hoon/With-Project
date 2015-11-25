google.load("visualization", "1");
google.setOnLoadCallback(draw);
 
 function draw() {
    data = new google.visualization.DataTable();
    data.addColumn('string', 'Label');
    data.addColumn('number', 'Value');
    data.addColumn('string', 'Link');
    data.addRows(4);

    $.ajax({
      url : "/WithProject/studygroup/tagList.json",
      type : "POST"
    })
    .done (function(response) {
      $.each(response, function(index, StudyGroupTagVO){
        data.setValue(index, 0, response[index].tagName);
        data.setValue(index, 1, response[index].tagCnt);
        
      })
      
      var outputDiv = document.getElementById('tcdiv');
      var tc = new TermCloud(outputDiv);
      tc.draw(data, null);
    })
 }
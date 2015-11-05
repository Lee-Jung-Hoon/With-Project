google.load("visualization", "1");
google.setOnLoadCallback(draw);
 
 function draw() {
    data = new google.visualization.DataTable();
    data.addColumn('string', 'Label');
    data.addColumn('number', 'Value');
    data.addColumn('string', 'Link');
    data.addRows(18);
    
    data.setValue(0, 0, '프로그래밍');
    data.setValue(0, 1, 10000);
    
    data.setValue(1, 0, '영어');
    data.setValue(1, 1, 50000);
    data.setValue(1, 2, 'http://www.google.com');
    
    data.setValue(2, 0, '일본어');
    data.setValue(2, 1, 40000);
    
    data.setValue(3, 0, '디자인');
    data.setValue(3, 1, 4000);
    
    data.setValue(4, 0, '창업');
    data.setValue(4, 1, 500);
    
    data.setValue(5, 0, '연애');
    data.setValue(5, 1, 40000);
    
    data.setValue(6, 0, '바리스타');
    data.setValue(6, 1, 30000);
    
    data.setValue(7, 0, '토크');
    data.setValue(7, 1, 80000);
    
    data.setValue(8, 0, '취업');
    data.setValue(8, 1, 90000);
    
    data.setValue(9, 0, '프로그래밍');
    data.setValue(9, 1, 80000);
    
    data.setValue(10, 0, '영어');
    data.setValue(10, 1, 50000);
    data.setValue(10, 2, 'http://www.google.com');
    
    data.setValue(11, 0, '일본어');
    data.setValue(11, 1, 2000);
    
    data.setValue(12, 0, '디자인');
    data.setValue(12, 1, 30000);
    
    data.setValue(13, 0, '창업');
    data.setValue(13, 1, 90000);
    
    data.setValue(14, 0, '연애');
    data.setValue(14, 1, 2000);
    
    data.setValue(15, 0, '바리스타');
    data.setValue(15, 1, 4000);
    
    data.setValue(16, 0, '토크');
    data.setValue(16, 1, 10000);
    
    data.setValue(17, 0, '취업');
    data.setValue(17, 1, 500);
    
    var outputDiv = document.getElementById('tcdiv');
    var tc = new TermCloud(outputDiv);
    tc.draw(data, null);
 }
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>


*,
*:after,
*:before {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

html,
body {
  position: relative;
  min-height: 100%;
  height: 100%;
}
html {
  position: relative;
  overflow-x: hidden;
  margin: 16px;
  padding: 0;
  min-height: 100%;
  font-size: 62.5%;
}
body {
  font-family: 'RobotoDraft', 'Roboto', 'Helvetica Neue, Helvetica, Arial', sans-serif;
  font-style: normal;
  font-weight: 300;
  font-size: 1.4rem;
  line-height: 2rem;
  letter-spacing: 0.01rem;
  color: #212121;
  background-color: #f5f5f5;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
}
.shadow-z-1 {
  -webkit-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.12), 0 1px 2px 0 rgba(0, 0, 0, 0.24);
  -moz-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.12), 0 1px 2px 0 rgba(0, 0, 0, 0.24);
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.12), 0 1px 2px 0 rgba(0, 0, 0, 0.24);
}
/* /* -- Material Design Table style -------------- */
.table {
  width: 100%;
  max-width: 100%;
  margin-bottom: 2rem;
  background-color: #ffffff;
}
.table > thead > tr,
.table > tbody > tr,
.table > tfoot > tr {
  -webkit-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease;
}
.table > thead > tr > th,
.table > tbody > tr > th,
.table > tfoot > tr > th,
.table > thead > tr > td,
.table > tbody > tr > td,
.table > tfoot > tr > td {
  text-align: left;
  padding: 1.6rem;
  vertical-align: top;
  border-top: 0;
  -webkit-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease;
}

.table > thead > tr > th {
  font-weight: 400;
  color: #757575;
  vertical-align: bottom;
  border-bottom: 1px solid rgba(0, 0, 0, 0.12);
}

.table > tbody + tbody {
  border-top: 1px solid rgba(0, 0, 0, 0.12);
}
.table .table {
  background-color: #ffffff;
}


.table-hover > tbody > tr:hover > td,
.table-hover > tbody > tr:hover > th {
  background-color: #d0d9ff;
} */
</style>
<script>
$(document).ready(function() {

  var table = $('#table');

  // Table hover
  $('#table-hover').change(function() {
    var value = $(this).val();
    table.removeClass('table-hover').addClass(value);
	  })
  });
  </script>

<body>
	<div id="demo">
  <!-- Responsive table starts here -->
  <!-- For correct display on small screens you must add 'data-title' to each 'td' in your table -->
  <div class="table-responsive-vertical shadow-z-1">
    <!-- Table starts here -->
    <table id="table" class="table table-hover table-mc-light-blue">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Link</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td data-title="ID">1</td>
          <td data-title="Name">Material Design Color Palette</td>
          <td data-title="Link">
            <a href="https://github.com/zavoloklom/material-design-color-palette" target="_blank">GitHub</a>
          </td>
          <td data-title="Status">Completed</td>
        </tr>
      </tbody>
    </table>
  </div>
 </div>
</body>
</html>
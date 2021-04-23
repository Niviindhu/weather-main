<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>City Temperature</title>
<style>
<style>
#weather {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
body {
  background-image: url("https://assets.wallpapersin4k.org/uploads/2017/04/Wallpaper-Weather-Forecast-23.jpg");
  background-position: center center;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
  font-family: Arial, Helvetica, sans-serif;
}
#weather td, #weather th {
  border:  solid #ddd12;
  padding: 15px;
  text-align:center;
  font-weight:bold;
  color:red;
  font-size: 15pt;
}

#weather tr{background-color: #f2f2f2;}

#weather tr:hover {background-color: #ddd;}

#weather th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: black;
  color: white;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script>
				var result = ${result}; $(document).ready(function() {
				var table =
				$('<br><br><table id="weather" align="center" style="margin-top:10px"><tr><th>Country</th><th>City</th><th>Longitute</th><th>Lattitude</th><th>Temperature</th><th>Humidity</th><th>Windspeed</th><th>Condition</th></tr>').appendTo($('#somediv'));
				$(result).each(function(i, person) {
				$('<tr/>').appendTo(table)
				.append($('<td/>').text(person.sys.country))
				.append($('<td/>').text(person.name))
				.append($('<td/>').text(person.coord.lon))
				.append($('<td/>').text(person.coord.lat))
				.append($('<td/>').text(Math.round(person.main.temp/11.5057692308)+"°C"))
				.append($('<td/>').text(person.main.humidity+"%"))
				.append($('<td/>').text(person.wind.speed+"m/s"))
				.append($('<td/>').text(person.weather[0].main+" , "+person.weather[0].description)); });
				});
				
					
			</script>
</head>
	
		<body>
		
			<form method="get" action="temp" align="center">
				<h1 style="color:red;margin-top:90px"><mark style="background-color:blue">Check Weather in your city</mark></h1>
				<input type="text" name="city" id="city" style="font-size: 18pt; height: 25px; width:280px;
					class="form-control" required="required"
					placeholder="Enter the city">
				<input type="submit" style="font-size: 15pt; background:#4CAF50;height: 25px;" value="search">
			</form>
			<div id="somediv"></div>
			<div id="somediv2"><h1 style="color:red;margin-top:90px" align="center"><mark style="background-color:red">${error}</mark></h1>
				</div>
</body></html>

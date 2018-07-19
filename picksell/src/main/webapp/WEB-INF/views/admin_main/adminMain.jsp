<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>


<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL", "KH00905", "oracle");
	Statement statement = connection.createStatement();
	String xVal, yVal;
	
	ResultSet resultSet = statement.executeQuery("select to_char(step4_date, 'mmdd') AS x, sum(total_price) AS y from ps_order WHERE to_char(step4_date, 'mmdd') IS NOT NULL group by to_char(step4_date, 'mmdd')  ORDER BY to_char(step4_date, 'mmdd')");
	
	while(resultSet.next()){
		xVal = resultSet.getString("x");
		yVal = resultSet.getString("y");
		
		map = new HashMap<Object,Object>(); 
		map.put("x", Integer.parseInt(xVal)); 
		map.put("y", Integer.parseInt(yVal)); 
		list.add(map);
		dataPoints = gsonObj.toJson(list);
	}
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Database has not been connected yet.</div>");
	dataPoints = null;
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.main{
	margin-left: 230px; 
	 min-width : 1024px;
}
.subject{
  border-bottom: 2px solid #7151fc;


}

</style>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['일자', '회원'],
      ['일주일전',  ${countlist[7]}, ],
      ['${daylist[6]}',  ${countlist[6]}, ],
      ['${daylist[5]}', ${countlist[5]}, ],
      ['${daylist[4]}',  ${countlist[4]}, ],
      ['${daylist[3]}',  ${countlist[3]}, ],
      ['${daylist[2]}',  ${countlist[2]}, ],
      ['${daylist[1]}',  ${countlist[1]},  ],
      [  '오늘' ,  ${countlist[0]}, ]
    ]);

    var options = {
      title: 'PICKSELL 신규 회원 가입 추이',
      hAxis: {title: 'Day',  titleTextStyle: {color: '#333'}},
      vAxis: {minValue: 0 , maxValue: 30}
    };

    var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
 </script> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main">



<div class="subject" style="padding:50px;">
<h1 style="display:inline;text-shadow:5px 10px 1px #eee;">오늘의 PICKSELL</h1>

<jsp:useBean id="toDay" class="java.util.Date" />
<h2 style="display:inline;float:right">날짜 : <font style="color:red;"><fmt:formatDate value="${toDay }" pattern="YYYY"/></font>년  
<font style="color:red;"><fmt:formatDate value="${toDay }" pattern="MM"/></font>월 
<font style="color:red;"><fmt:formatDate value="${toDay }" pattern="dd"/></font>일</h2>
</div>

 <div id="chart_div" style="border: 2px solid #eee;
    width: 95%;
    margin-top: 27px;
    height: 400px;
    margin-left: 20px;"></div>


<div id="chartContainer" style="height: 500px; width: 95%;border:2px solid #eee;margin-left: 20px;margin-top: 27px;"></div>


<%-- <canvas id="myChart" width="400" height="300"></canvas>  <br/> --%>
<%-- <canvas id="bar-chart" width="800" height="450"></canvas><br/> --%>
<%-- <canvas id="line-chart" width="800" height="450"></canvas><br/> --%>
<!-- <br/><br/><br/><br/><br/><br/> -->
<%-- <canvas id="pie-chart" width="800" height="450"></canvas><br/> --%>
<%-- <canvas id="radar-chart" width="800" height="600"></canvas><br/> --%>
<%-- <canvas id="polar-chart" width="800" height="450"></canvas><br/> --%>
<%-- <canvas id="doughnut-chart" width="800" height="450"></canvas><br/> --%>
<%-- <canvas id="bar-chart-horizontal" width="800" height="450"></canvas><br/> --%>
<%-- <canvas id="bar-chart-grouped" width="800" height="450"></canvas><br/> --%>
<%-- <canvas id="mixed-chart" width="800" height="450"></canvas><br/> --%>
<%-- <canvas id="bubble-chart" width="800" height="800"></canvas> --%>

<script type="text/javascript">


window.onload = function() { 
	 
	<% if(dataPoints != null) { %>
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		exportEnabled: true,
		title: {
			text: " PICKSELL 날짜 별 거래량 "
		},
		axisX: {
			title: "날짜"
		},
		axisY: {
			title: "총 거래량 "
		},

		data: [{
			type: "column", //change type to bar, line, area, pie, etc
			dataPoints: <%out.print(dataPoints);%>
		}]
	});
	chart.render();
	<% } %> 
	 
}






// //Bar chart
// new Chart(document.getElementById("bar-chart"), {
//     type: 'bar',
//     data: {
//       labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
//       datasets: [
//         {
//           label: "Population (millions)",
//           backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
//           data: [2478,5267,734,784,433]
//         }
//       ]
//     },
//     options: {
//       legend: { display: false },
//       title: {
//         display: true,
//         text: 'Predicted world population (millions) in 2050'
//       }
//     }
// });

// //line chart
// new Chart(document.getElementById("line-chart"), {
// 	  type: 'line',
// 	  data: {
// 	    labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
// 	    datasets: [{ 
// 	        data: [86,114,106,106,107,111,133,221,783,2478],
// 	        label: "Africa",
// 	        borderColor: "#3e95cd",
// 	        fill: false
// 	      }, { 
// 	        data: [282,350,411,502,635,809,947,1402,3700,5267],
// 	        label: "Asia",
// 	        borderColor: "#8e5ea2",
// 	        fill: false
// 	      }, { 
// 	        data: [168,170,178,190,203,276,408,547,675,734],
// 	        label: "Europe",
// 	        borderColor: "#3cba9f",
// 	        fill: false
// 	      }, { 
// 	        data: [40,20,10,16,24,38,74,167,508,784],
// 	        label: "Latin America",
// 	        borderColor: "#e8c3b9",
// 	        fill: false
// 	      }, { 
// 	        data: [6,3,2,2,7,26,82,172,312,433],
// 	        label: "North America",
// 	        borderColor: "#c45850",
// 	        fill: false
// 	      }
// 	    ]
// 	  },
// 	  options: {
// 	    title: {
// 	      display: true,
// 	      text: 'World population per region (in millions)'
// 	    }
// 	  }
// 	});

// //pie chart
// new Chart(document.getElementById("pie-chart"), {
//     type: 'pie',
//     data: {
//       labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
//       datasets: [{
//         label: "Population (millions)",
//         backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
//         data: [2478,5267,734,784,433]
//       }]
//     },
//     options: {
//       title: {
//         display: true,
//         text: 'Predicted world population (millions) in 2050'
//       }
//     }
// });

// //radar chart
// new Chart(document.getElementById("radar-chart"), {
//     type: 'radar',
//     data: {
//       labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
//       datasets: [
//         {
//           label: "1950",
//           fill: true,
//           backgroundColor: "rgba(179,181,198,0.2)",
//           borderColor: "rgba(179,181,198,1)",
//           pointBorderColor: "#fff",
//           pointBackgroundColor: "rgba(179,181,198,1)",
//           data: [8.77,55.61,21.69,6.62,6.82]
//         }, {
//           label: "2050",
//           fill: true,
//           backgroundColor: "rgba(255,99,132,0.2)",
//           borderColor: "rgba(255,99,132,1)",
//           pointBorderColor: "#fff",
//           pointBackgroundColor: "rgba(255,99,132,1)",
//           pointBorderColor: "#fff",
//           data: [25.48,54.16,7.61,8.06,4.45]
//         }
//       ]
//     },
//     options: {
//       title: {
//         display: true,
//         text: 'Distribution in % of world population'
//       }
//     }
// });

// //polar area chart
// new Chart(document.getElementById("polar-chart"), {
//     type: 'polarArea',
//     data: {
//       labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
//       datasets: [
//         {
//           label: "Population (millions)",
//           backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
//           data: [2478,5267,734,784,433]
//         }
//       ]
//     },
//     options: {
//       title: {
//         display: true,
//         text: 'Predicted world population (millions) in 2050'
//       }
//     }
// });

// //doughnut chart
// new Chart(document.getElementById("doughnut-chart"), {
//     type: 'doughnut',
//     data: {
//       labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
//       datasets: [
//         {
//           label: "Population (millions)",
//           backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
//           data: [2478,5267,734,784,433]
//         }
//       ]
//     },
//     options: {
//       title: {
//         display: true,
//         text: 'Predicted world population (millions) in 2050'
//       }
//     }
// });

// //horizontal chart
// new Chart(document.getElementById("bar-chart-horizontal"), {
//     type: 'horizontalBar',
//     data: {
//       labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
//       datasets: [
//         {
//           label: "Population (millions)",
//           backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
//           data: [2478,5267,734,784,433]
//         }
//       ]
//     },
//     options: {
//       legend: { display: false },
//       title: {
//         display: true,
//         text: 'Predicted world population (millions) in 2050'
//       }
//     }
// });

// //grouped bar chart
// new Chart(document.getElementById("bar-chart-grouped"), {
//     type: 'bar',
//     data: {
//       labels: ["1900", "1950", "1999", "2050"],
//       datasets: [
//         {
//           label: "Africa",
//           backgroundColor: "#3e95cd",
//           data: [133,221,783,2478]
//         }, {
//           label: "Europe",
//           backgroundColor: "#8e5ea2",
//           data: [408,547,675,734]
//         }
//       ]
//     },
//     options: {
//       title: {
//         display: true,
//         text: 'Population growth (millions)'
//       }
//     }
// });

// //mixed chart
// new Chart(document.getElementById("mixed-chart"), {
//     type: 'bar',
//     data: {
//       labels: ["1900", "1950", "1999", "2050"],
//       datasets: [{
//           label: "Europe",
//           type: "line",
//           borderColor: "#8e5ea2",
//           data: [408,547,675,734],
//           fill: false
//         }, {
//           label: "Africa",
//           type: "line",
//           borderColor: "#3e95cd",
//           data: [133,221,783,2478],
//           fill: false
//         }, {
//           label: "Europe",
//           type: "bar",
//           backgroundColor: "rgba(0,0,0,0.2)",
//           data: [408,547,675,734],
//         }, {
//           label: "Africa",
//           type: "bar",
//           backgroundColor: "rgba(0,0,0,0.2)",
//           backgroundColorHover: "#3e95cd",
//           data: [133,221,783,2478]
//         }
//       ]
//     },
//     options: {
//       title: {
//         display: true,
//         text: 'Population growth (millions): Europe & Africa'
//       },
//       legend: { display: false }
//     }
// });

// //bubble chart
// new Chart(document.getElementById("bubble-chart"), {
//     type: 'bubble',
//     data: {
//       labels: "Africa",
//       datasets: [
//         {
//           label: ["China"],
//           backgroundColor: "rgba(255,221,50,0.2)",
//           borderColor: "rgba(255,221,50,1)",
//           data: [{
//             x: 21269017,
//             y: 5.245,
//             r: 15
//           }]
//         }, {
//           label: ["Denmark"],
//           backgroundColor: "rgba(60,186,159,0.2)",
//           borderColor: "rgba(60,186,159,1)",
//           data: [{
//             x: 258702,
//             y: 7.526,
//             r: 10
//           }]
//         }, {
//           label: ["Germany"],
//           backgroundColor: "rgba(0,0,0,0.2)",
//           borderColor: "#000",
//           data: [{
//             x: 3979083,
//             y: 6.994,
//             r: 15
//           }]
//         }, {
//           label: ["Japan"],
//           backgroundColor: "rgba(193,46,12,0.2)",
//           borderColor: "rgba(193,46,12,1)",
//           data: [{
//             x: 4931877,
//             y: 5.921,
//             r: 15
//           }]
//         }
//       ]
//     },
//     options: {
//       title: {
//         display: true,
//         text: 'Predicted world population (millions) in 2050'
//       }, scales: {
//         yAxes: [{ 
//           scaleLabel: {
//             display: true,
//             labelString: "Happiness"
//           }
//         }],
//         xAxes: [{ 
//           scaleLabel: {
//             display: true,
//             labelString: "GDP (PPP)"
//           }
//         }]
//       }
//     }
// })

</script>

</div>
</body>
</html>
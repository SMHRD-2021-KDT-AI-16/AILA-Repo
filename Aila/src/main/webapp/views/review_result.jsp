<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>리뷰분석|분석결과</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../resource/assets/vendors/feather/feather.css">
  <link rel="stylesheet" href="../resource/assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../resource/assets/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../resource/assets/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="../resource/assets/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="../resource/assets/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../resource/assets/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../resource/assets/images/favicon.png" />
     <style>
	   	.image-with-space {
		margin-right: 13px; /* 그림의 오른쪽에 20px의 공백 추가 */
		}
   	</style>
</head>

<body>
<% ArrayList<String> pos_cnt_word = (ArrayList<String>) request.getAttribute("pos_cnt_word") ;
 ArrayList<String> neg_cnt_word = (ArrayList<String>) request.getAttribute("neg_cnt_word") ;
%>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
        <div class="me-3">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
            <span class="icon-menu"></span>
          </button>
        </div>
        <div>
          <a class="navbar-brand brand-logo" href="Trend.do">
            <img src="../resource/assets/images/logo_h.png" alt="logo" />
          </a>
          <a class="navbar-brand brand-logo-mini" href="Trend.do">
            <img src="../resource/assets/images/logo_mini.png" alt="logo" />
          </a>
        </div>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-top border-bottom">
        <ul class="navbar-nav">
          <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
            <h1 class="welcome-text"><span class="text-black fw-bold">리뷰 분석</span></h1>
          </li>
        </ul>
        <ul class="navbar-nav ms-auto">
          <!-- 품목 선택 -->
          <li class="nav-item dropdown d-none d-lg-block">
            <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown" href="#"
              data-bs-toggle="dropdown" aria-expanded="false"> 품목 선택 </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
              aria-labelledby="messageDropdown">
              <a href="Review.do?food_name=고구마&review_source=${review_source }" class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">고구마</h6>
                </div>
              </a>
              <a href="Review.do?food_name=김치&review_source=${review_source }" class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">김치</h6>
                </div>
              </a>
            </div>
          </li>
          <!-- 분석 종류 -->
          <li class="nav-item dropdown d-none d-lg-block">
            <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown" href="#"
              data-bs-toggle="dropdown" aria-expanded="false"> 채널 선택 </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
              aria-labelledby="messageDropdown">
              <a href="Review.do?food_name=${food_name }&review_source=${member.company_name }" class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">자사몰</h6>
                </div>
              </a>
              <a href="Review.do?food_name=${food_name }&review_source=네이버" class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">네이버</h6>
                </div>
              </a>
              <a href="Review.do?food_name=${food_name }&review_source=쿠팡" class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">쿠팡</h6>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item d-none d-lg-block">
            <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
              <span class="input-group-addon input-group-prepend border-right">
                <span class="icon-calendar input-group-text calendar-icon"></span>
              </span>
              <input type="text" class="form-control">
            </div>
          </li>
          <li class="nav-item dropdown d-none d-lg-block user-dropdown">
            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
              <img class="img-xs" src="../resource/assets/images/mggoon_logo.png" alt="Company logo"> </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
              <div class="dropdown-header text-center">
                <img class="img-md" src="../resource/assets/images/mggoon_logo.png" alt="Company logo">
                <p class="mb-1 mt-3 font-weight-semibold">맛꾼푸드</p>
              </div>
              <a href="Logout.do" class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>로그아웃</a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme">
            <div class="img-ss rounded-circle bg-light border me-3"></div>Light
          </div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme">
            <div class="img-ss rounded-circle bg-dark border me-3"></div>Dark
          </div>
          <p class="settings-heading mt-2">HEADER SKINS</p>a
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      <!-- partial -->
      <!-- partial:../../partials/_sidebar.html -->
                  <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Trend.do">
                            <i class="mdi mdi-chart-line menu-icon"></i>
                            <span class="menu-title">트렌드</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Goreview_products.do">
                            <img class="image-with-space" src="../resource/assets/images/review.png">
                            <span class="menu-title">리뷰 분석</span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="Gonews.do">
                            <img class="image-with-space" src="../resource/assets/images/news.png">
                            <span class="menu-title">뉴스</span>
                        </a>
                    </li>

                </ul>
            </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
        <div style="max-width: 80%;">
        
          <div class="row">
            <div class="col-sm-12">
              <div class="home-tab">
                <div class="statistics-details d-flex align-items-center">
                  <div style="margin-left: 1.5rem;"><h3 class="rate-percentage">
                  ${review_source}
                  </h3></div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-lg-6 grid-margin stretch-card" style="width: 35%;">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">긍정/부정 비율</h4>
                  <canvas id="eRateChart"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card" style="width: 65%;">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">리뷰 추이</h4>
                  <canvas id="linechart-multi"></canvas>
                </div>
              </div>
            </div>
            
          </div>
          
          <div class="row">
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                
                  <h4 class="card-title d-flex justify-content-between">키워드 Top10
                  <span>
                  <button id="pos-t" type="button" class="btn btn-info btn-rounded btn-fw btn-sm">긍정</button>
                  <button id="neg-t" type="button" class="btn btn-danger btn-rounded btn-fw btn-sm">부정</button>
                  </span>
                  </h4>
                  
                  <canvas id="posTopicChart"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title d-flex justify-content-between">워드 클라우드
                  <span><button type="button" class="btn btn-info btn-rounded btn-fw btn-sm">긍정</button>
                  <button type="button" class="btn btn-danger btn-rounded btn-fw btn-sm">부정</button>
                  </span></h4>
                  <canvas id="barChart2-c"></canvas>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a
                href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
            <span class="float-none float-sm-end d-block mt-1 mt-sm-0 text-center">Copyright © 2021. All rights
              reserved.</span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../resource/assets/vendors/js/vendor.bundle.base.js"></script>
  <script src="../resource/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="../resource/assets/vendors/chart.js/Chart.min.js"></script>
  <script src="../resource/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../resource/assets/js/off-canvas.js"></script>
  <script src="../resource/assets/js/hoverable-collapse.js"></script>
  <script src="../resource/assets/js/template.js"></script>
  <script src="../resource/assets/js/settings.js"></script>
  <script src="../resource/assets/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="../resource/assets/js/chart.js"></script>
  <!-- End custom js for this page-->
</body>
<script>

var options = {
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true
	        }
	      }]
	    },
	    legend: {
	      display: false
	    },
	    elements: {
	      point: {
	        radius: 0
	      }
	    }

	  };
	// 감정 도넛 차트
	var eRateData = {
			labels: ['부정', '긍정'],
			datasets: [{
				data: [${review_emotion_cnt.neg}, ${review_emotion_cnt.pos}],
				backgroundColor: [
			        'rgba(255, 99, 132, 0.5)',
			        'rgba(54, 162, 235, 0.5)'
			        
			      ],
			      borderColor: [
			        'rgba(255,99,132,1)',
			        'rgba(54, 162, 235, 1)'
			        
			      ],
			}],
			options: {
				responsive: true,
			    animation: {
			      animateScale: true,
			      animateRotate: true
			    }
			}
	}
	if ($("#eRateChart").length) {
	    var doughnutChartCanvas = $("#eRateChart").get(0).getContext("2d");
	    var doughnutChart = new Chart(doughnutChartCanvas, {
	      type: 'doughnut',
	      data: eRateData
	    });
	  }
	
	// 리뷰 추이 차트
	var yData = ${year}
	var mData = ${month}
	var pData = ${pos_m}
	var nData = ${neg_m}
	
	var labelList = new Array();
	var pList = new Array();
	var nList = new Array();
	
	for(var i = 0; i<pData.length; i++) {
		labelList.push(yData[i]+" "+mData[i].toString());
		pList.push(pData[i]);		
		nList.push(nData[i]);
	}

	var multiLineData = {
		    labels: labelList,
		    datasets: [{
		        label: '긍정 리뷰',
		        data: pList,
		        borderColor: [
		          '#587ce4'
		        ],
		        borderWidth: 2,
		        fill: false
		      },
		      
		      {
		        label: '부정 리뷰',
		        data: nList,
		        borderColor: [
		          '#f44252'
		        ],
		        borderWidth: 2,
		        fill: false
		      }
		    ]
		  };
	if ($("#linechart-multi").length) {
	    var multiLineCanvas = $("#linechart-multi").get(0).getContext("2d");
	    var lineChart = new Chart(multiLineCanvas, {
	      type: 'line',
	      data: multiLineData,
	      options: options
	    });
	  }
	
	// 키워드 차트
	var pos_word='<%=pos_cnt_word%>'
    var pos_cnt_word=[]
    pos_cnt_word=pos_word.trim().replace("[","").replace("]","").split(",")
	console.log(pos_cnt_word)
	var pos_cnt = ${pos_cnt}
	console.log(pos_cnt)
	var neg_word = '<%=neg_cnt_word%>'
	var neg_cnt_word=[]
	neg_cnt_word=neg_word.trim().replace("[","").replace("]","").split(",")
	console.log(neg_cnt_word)
	var neg_cnt = ${neg_cnt}
	console.log(neg_cnt)
	
	var posWordList = new Array()
	var posCntList = new Array()
	var negWordList = new Array()
	var negCntList = new Array()
	var posColor = new Array()
	var posColorBorder = new Array()
	var negColor = new Array()
	var negColorBorder = new Array()
	
	
	for(var i = 0; i<10; i++){
		posWordList.push(pos_cnt_word[i])
		posCntList.push(pos_cnt[i])
		negWordList.push(neg_cnt_word[i])
		negCntList.push(neg_cnt[i])
		posColor.push('rgba(54, 162, 235, 0.2)')
		posColorBorder.push('rgba(54, 162, 235, 1)')
		negColor.push('rgba(255, 99, 132, 0.2)')
		negColorBorder.push('rgba(255,99,132,1)')
	}
	
$('#neg-t').on('click', function(){
	$('#posTopicChart').attr('id', 'negTopicChart')
	drawNegTopicChart()
})

$('#pos-t').on('click', function(){
	$('#negTopicChart').attr('id', 'posTopicChart')
	
	// 기존에 남아있는 차트 제거
	let chartStatus = Chart.getChart('posTopicChart');
	if (chartStatus !== undefined) {
		chartStatus.destroy();
	}
	drawPosTopicChart();
})

	// 긍정 키워드 차트 데이터
	var posTopicData = {
		    labels: posWordList,
		    datasets: [{
		      label: '긍정 키워드',
		      data: posCntList,
		      backgroundColor: posColor,
		      borderColor: posColorBorder,
		      borderWidth: 1,
		      fill: false
		    }]
		  };
		  
		  // 긍정 키워드 차트 그리기
	 if ($("#posTopicChart").length) {
		 drawPosTopicChart();
	}
		  
	function drawPosTopicChart(){
		var posTopicCanvas = $("#posTopicChart").get(0).getContext("2d");
	    
	    var posTopicChart = new Chart(posTopicCanvas, {
	      type: 'bar',
	      data: posTopicData,
	      options: {
	    	    scales: {
	    	        yAxes: [{
	    	          ticks: {
	    	            beginAtZero: true
	    	          }
	    	        }]
	    	      },
	    	      legend: {
	    	        display: false
	    	      },
	    	      elements: {
	    	        point: {
	    	          radius: 0
	    	        }
	    	      }

	    	    }
	    });
	}
			// 부정 키워드 차트 데이터
			var negTopicData = {
				    labels: negWordList,
				    datasets: [{
				      label: '부정 키워드',
				      data: negCntList,
				      backgroundColor: negColor,
				      borderColor: negColorBorder,
				      borderWidth: 1,
				      fill: false
				    }]
				  };
			
			// 부정 키워드 차트 그리기
	 function drawNegTopicChart(){
			if ($("#negTopicChart").length) {
			    // 기존에 남아있는 차트 제거
			    let chartStatus = Chart.getChart('negTopicChart');
			    if (chartStatus !== undefined) {
			      chartStatus.destroy();
			    }
			    var negTopicCanvas = $("#negTopicChart").get(0).getContext("2d");
			    
			    var negTopicChart = new Chart(negTopicCanvas, {
			      type: 'bar',
			      data: negTopicData,
			      options: {
			    	    scales: {
			    	        yAxes: [{
			    	          ticks: {
			    	            beginAtZero: true
			    	          }
			    	        }]
			    	      },
			    	      legend: {
			    	        display: false
			    	      },
			    	      elements: {
			    	        point: {
			    	          radius: 0
			    	        }
			    	      }

			    	    }
			    });
			  }
	 }
	
</script>
</html>

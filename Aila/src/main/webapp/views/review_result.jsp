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
		
		.review-list{
			/* max-height : 80px; */
			white-space: normal; /* 줄바꿈 */
			
			word-wrap : break-word; 
			display: -webkit-box;
			-webkit-line-clamp:12; 
			-webkit-box-orient:vertical;
		}
		.review-list p{
			margin-top: 0.5rem;
		}
   	</style>
</head>

<body>
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
              data-bs-toggle="dropdown" aria-expanded="false"> ${food_name} </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
              aria-labelledby="messageDropdown">
              <a href="Review.do?food_idx=1&review_source=${review_source }" class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">고구마</h6>
                </div>
              </a>
              <a href="Review.do?food_idx=2&review_source=${review_source }" class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">김치</h6>
                </div>
              </a>
              
              <% String[] foodList = {"망고", "구운란", "감자탕", "오렌지", "새꼬막", "오징어", "토마토", "참외"};
              	pageContext.setAttribute("foodList", foodList);%>
              	<c:forEach var="food" items="${foodList }">
              		<a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">${food }</h6>
                </div>
              </a>
              	</c:forEach>
              
            </div>
          </li>
          <!-- 분석 종류 -->
          <li class="nav-item dropdown d-none d-lg-block">
            <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown" href="#"
              data-bs-toggle="dropdown" aria-expanded="false"> ${review_source} </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
              aria-labelledby="messageDropdown">
              <a href="Review.do?food_idx=${food_idx }&review_source=${member.company_name }" class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">${member.company_name }</h6>
                </div>
              </a>
              <a href="Review.do?food_idx=${food_idx }&review_source=네이버" class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <h6 style="margin: 0.2rem;">네이버</h6>
                </div>
              </a>
              <a href="Review.do?food_idx=${food_idx }&review_source=쿠팡" class="dropdown-item preview-item">
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
                        <a class="nav-link" href="Logout.do">
                            <i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>로그아웃
                            </a>
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
          <p class="settings-heading mt-2">HEADER SKINS</p>
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
                            <i class="ti-stats-up menu-icon"></i>
                            <span class="menu-title">트렌드</span>
                        </a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="Goreview_products.do">
                            <i class="ti-bar-chart-alt menu-icon"></i>
                            <span class="menu-title">리뷰 분석</span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="News.do">
                            <i class="mdi mdi-card-text-outline menu-icon"></i>
                            <span class="menu-title">뉴스</span>
                        </a>
                    </li>

                </ul>
            </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
        <div style="max-width: 80%; margin: auto;">
          
          <div class="row">
            <div class="col-lg-6 grid-margin stretch-card" style="width: 35%;">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">긍정/부정 비율</h4>
                  <div style="width: 90%; padding: 1rem; margin: auto;">
                  <canvas id="eRateChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card" style="width: 65%;">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">리뷰 추이</h4>
                  <div style="width: 90%; margin: auto;">
                  <canvas id="linechart-multi"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          
          <div class="row">
            <div class="col-lg-6 grid-margin stretch-card topic" style="width: 40%;">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title d-flex justify-content-between">워드 클라우드
                  <span><button type="button" id="wc-p-btn" class="btn btn-info btn-rounded btn-fw btn-sm">긍정</button>
                  <button type="button" id="wc-n-btn" class="btn btn-danger btn-rounded btn-fw btn-sm">부정</button>
                  </span></h4>
                  <div id="posWcChart"></div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card topic" style="width: 40%;">
              <div class="card">
                <div class="card-body">
                
                  <h4 class="card-title d-flex justify-content-between">키워드 Top10
                  <span>
                  <button id="pos-t" type="button" class="btn btn-info btn-rounded btn-fw btn-sm">긍정</button>
                  <button id="neg-t" type="button" class="btn btn-danger btn-rounded btn-fw btn-sm">부정</button>
                  </span>
                  </h4>
                  <canvas id="topicChart"></canvas>
                </div>
              </div>
            </div>
            
            <div class="col-lg-6 grid-margin stretch-card" style="width: 20%;" id="detail-review">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">상세 리뷰</h4>
                 	<div id="full-review">
                 	키워드 Top10의 각 막대를 클릭해보세요
                 	</div>
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
  <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
  <!-- End custom js for this page-->
</body>
<script>

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
	var rvData = ${amountJason}
	var rvObject = JSON.stringify(rvData);
	var rvData = JSON.parse(rvObject);
	
	var labelList = new Array();
	var pList = new Array();
	var nList = new Array();
	
	for(var i = 0; i<rvData.length; i++) {
		var r = rvData[i];
		labelList.push(r.yearDates);
		pList.push(r.pos_m);		
		nList.push(r.neg_m);
	}
	
	labelList = labelList.reverse();
	pList = pList.reverse();
	nList = nList.reverse();

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
	      options: {
	  		scales: {
		        y: {
		          ticks: {
		            beginAtZero: true
		          }
		        }
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
	

	// 키워드 차트
	const kwJson = ${keywordJson}
	const kwObject = JSON.stringify(kwJson);
	const kwData = JSON.parse(kwObject);
	
	const posKWordList = new Array()
	const posCntList = new Array()
	const negKWordList = new Array()
	const negCntList = new Array()
	const posColor = new Array()
	const posColorBorder = new Array()
	const negColor = new Array()
	const negColorBorder = new Array()
	
	for(var i = 0; i<kwData.length; i++){
		var k = kwData[i]
		posKWordList.push(k.pos_cnt_word)
		posCntList.push(k.pos_cnt)
		negKWordList.push(k.neg_cnt_word)
		negCntList.push(k.neg_cnt)
		posColor.push('rgba(54, 162, 235, 0.2)')
		posColorBorder.push('rgba(54, 162, 235, 1)')
		negColor.push('rgba(255, 99, 132, 0.2)')
		negColorBorder.push('rgba(255,99,132,1)')
	}

	// 긍정 키워드 차트 데이터
	const posTopicData = {
		  	labels: posKWordList,
		  	datasets: [{
		  	label: '긍정 키워드',
		  	data: posCntList,
		  	backgroundColor: posColor,
		  	borderColor: posColorBorder,
		  	borderWidth: 1,
		  	fill: false
		  	}],
		  	options: {
	    	    scales: {
	    	        y: {
	    	          ticks: {
	    	            beginAtZero: true
	    	          }
	    	        }
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
		  };
	
	
	
	
	// 부정 키워드 차트 데이터
	const negTopicData = {
		    labels: negKWordList,
		    datasets: [{
		      label: '부정 키워드',
		      data: negCntList,
		      backgroundColor: negColor,
		      borderColor: negColorBorder,
		      borderWidth: 1,
		      fill: false
		    }],
		    options: {
	    	    scales: {
	    	        y: {
	    	          ticks: {
	    	            beginAtZero: true
	    	          }
	    	        }
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
		  };
	
	const topicCanvas = $("#topicChart").get(0).getContext("2d");
	
	let topicChart = new Chart(topicCanvas, {
		type: 'bar',
	    data: posTopicData
	    
	})
	


$('#neg-t').on('click', function(){
	let chartStatus = Chart.getChart('topicChart');
	if (chartStatus !== undefined) {
		chartStatus.destroy();
	}
	
	topicChart = new Chart(topicCanvas, {
		type: 'bar',
	    data: negTopicData
	})
})

$('#pos-t').on('click', function(){
	let chartStatus = Chart.getChart('topicChart');
	if (chartStatus !== undefined) {
		chartStatus.destroy();
	}
	topicChart = new Chart(topicCanvas, {
		type: 'bar',
	    data: posTopicData
	})
})

$('#topicChart').on('click', function (evt) {
	
   let activePoints = topicChart.getElementsAtEventForMode(evt, 'nearest', { intersect: true }, true);
   
   if (activePoints.length > 0) {
	   let meta = topicChart.getDatasetMeta(0);	   
	   let label = meta.label;
	   let topic_emotion = 0;
	   
       let clickedLabel = topicChart.data.labels[activePoints[0].index];
       
       if(label == '긍정 키워드'){
    	   topic_emotion = 1;
       }else{
    	   topic_emotion = 0;
       }
       
       $.ajax({
    	   url: "FullReview.do",
    	   data: {
    		   "food_idx": ${food_idx},
    		   "review_source": '${review_source}',
    		   "topic_emotion": topic_emotion,
    		   "topic_content": clickedLabel
    	   },
    	   dataType: "json",
    	   success: function(data){
    		   
    		   let full_review = $("#full-review");
    		   let element = '';
    		   full_review.empty();
    		   
    		   $(".topic").animate({ width: '49.9%' }, 1000);
    		   $("#detail-review").animate({ width: '100%' }, 1000);
    		   
    		   for(let i = 0; i < data.length; i++){
    			   element += `
    			   	<div class="review-list border-bottom">
    			   		<p>\${data[i]}</p>
    			   	</div>
    			   `
    		   	
    		   }
    		   full_review.append(element);
    	   },
    	   error: function(xhr, status, error){
    		   console.error("데이터를 불러오는 중 오류가 발생했습니다:", status, error);
    	   }
       })
       
   }
});
	
    
		  
	// 워드 클라우드
	zingchart.MODULESDIR = 'https://cdn.zingchart.com/modules/';
	const jsonData = ${wcJson}
	const jsonObject = JSON.stringify(jsonData);
	const jData = JSON.parse(jsonObject);

	const posWordList = []
	const negWordList = []
	
	for(var i = 0; i < jData.length; i++){
		var j = jData[i];
		posWordList.push({text: j.pos_topic_word, count: j.pos_topic_count})
		negWordList.push({text: j.neg_topic_word, count: j.neg_topic_count})
	}
	
			 var posConfig = {
			     type: 'wordcloud',
			     options: {
			     words: posWordList,
			     minLength: 5,
			     ignore: [""],
			     maxItems: 40,
			     aspect: 'spiral', // 'flow-top' | 'flow-center'
			  
			     colorType: 'palette',
			     palette: ['#0040FF', '#2E64FE', '#2E9AFE', '#58ACFA'],
			  
			     style: {
			       fontFamily: 'Crete Round',
			  
			       hoverState: {
			         backgroundColor: '#0040FF',
			         borderRadius: 2,
			         fontColor: 'white'
			       },
			       tooltip: {
			         text: '%text: %hits',
			         visible: true,
			         alpha: 0.9,
			         backgroundColor: '#1976D2',
			         borderRadius: 2,
			         borderColor: 'none',
			         fontColor: 'white',
			         fontFamily: 'Georgia',
			         textAlpha: 1
			       }
			     }
			   },
			  
			   source: {
			     //text: '--President Barack Obama<br> Selma 50th anniversary speech<br>March 7, 2015',
			     //Source: https://obamawhitehouse.archives.gov/the-press-office/2015/03/07/remarks-president-50th-anniversary-selma-montgomery-marches
			     fontColor: '#64B5F6',
			     fontSize: 10,
			     fontFamily: 'Georgia',
			     fontWeight: 'normal',
			     marginBottom: '10%'
			   }
			 };
			 
			 var negConfig = {
				     type: 'wordcloud',
				     options: {
				     words: negWordList,
				     minLength: 5,
				     ignore: [""],
				     maxItems: 40,
				     aspect: 'spiral', // 'flow-top' | 'flow-center'
				  
				     colorType: 'palette',
				     palette: ['#D32F2F', '#FF4000', '#FE2E2E', '#FA5858', '#F78181'],
				  
				     style: {
				       fontFamily: 'Crete Round',
				  
				       hoverState: {
				         backgroundColor: '#D32F2F',
				         borderRadius: 2,
				         fontColor: 'white'
				       },
				       tooltip: {
				         text: '%text: %hits',
				         visible: true,
				         alpha: 0.9,
				         backgroundColor: '#B40404',
				         borderRadius: 2,
				         borderColor: 'none',
				         fontColor: 'white',
				         fontFamily: 'Georgia',
				         textAlpha: 1
				       }
				     }
				   },
				  
				   source: {
				     //text: '--President Barack Obama<br> Selma 50th anniversary speech<br>March 7, 2015',
				     //Source: https://obamawhitehouse.archives.gov/the-press-office/2015/03/07/remarks-president-50th-anniversary-selma-montgomery-marches
				     fontColor: '#64B5F6',
				     fontSize: 10,
				     fontFamily: 'Georgia',
				     fontWeight: 'normal',
				     marginBottom: '10%'
				   }
				 };


			//워드클라우드 렌더링
			 zingchart.render({
			   id: 'posWcChart',
			   data: posConfig,
			   height: 280,
			   width: '100%'
			 });
	
			$('#wc-n-btn').on('click', function(){
				$('#posWcChart').attr('id', 'negWcChart');
				$('#negWcChart').empty();
				zingchart.render({
					   id: 'negWcChart',
					   data: negConfig,
					   height: 300,
					   width: '100%'
					 });
			})
			
			$('#wc-p-btn').on('click', function(){
				$('#negWcChart').attr('id', 'posWcChart');
				$('#posWcChart').empty();
				zingchart.render({
					id: 'posWcChart',
					data: posConfig,
					height: 300,
					width: '100%'
				});
			})
</script>
</html>
